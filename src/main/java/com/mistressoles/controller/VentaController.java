package com.mistressoles.controller;

import com.mistressoles.conexion.ConexionDB;
import com.mistressoles.modelos.DetalleVenta;
import com.mistressoles.modelos.Producto;
import javafx.animation.PauseTransition;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.collections.transformation.FilteredList;
import javafx.collections.transformation.SortedList;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.*;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.input.KeyCode;
import javafx.scene.paint.Color;
import javafx.util.Duration;

import java.net.URL;
import java.sql.*;
import java.util.ResourceBundle;

public class VentaController implements Initializable {

    @FXML
    private TextField txtBuscar;
    @FXML
    private TableView<Producto> tablaBusqueda;
    @FXML
    private TableColumn<Producto, String> colBusqNombre;
    @FXML
    private TableColumn<Producto, Double> colBusqStock;
    @FXML
    private TableColumn<Producto, String> colBusqUnidad;
    @FXML
    private TableColumn<Producto, Double> colBusqPrecio;
    @FXML
    private TextField txtCantidad;

    @FXML
    private TableView<DetalleVenta> tablaTicket;
    @FXML
    private TableColumn<DetalleVenta, String> colTicketProducto;
    @FXML
    private TableColumn<DetalleVenta, Double> colTicketCant;
    @FXML
    private TableColumn<DetalleVenta, Double> colTicketPrecio;
    @FXML
    private TableColumn<DetalleVenta, Double> colTicketSubtotal;

    @FXML
    private Label lblTotal;
    @FXML
    private Label lblMensaje;
    @FXML
    private TextField txtAbona;
    @FXML
    private Label lblVuelto;

    private ObservableList<Producto> listaProductos = FXCollections.observableArrayList();
    private FilteredList<Producto> listaFiltrada;
    private ObservableList<DetalleVenta> listaTicket = FXCollections.observableArrayList();

    @Override
    public void initialize(URL url, ResourceBundle rb) {
        configurarTablas();
        configurarFiltrosTexto();
        cargarProductos();

        // Buscador multifunción
        txtBuscar.textProperty().addListener((obs, oldVal, newVal) -> {
            listaFiltrada.setPredicate(p -> {
                if (newVal == null || newVal.isEmpty()) {
                    return true;
                }

                String texto = newVal.toLowerCase();
                boolean matchNombre = p.getNombre().toLowerCase().contains(texto);
                boolean matchCategoria = p.getCategoria().toLowerCase().contains(texto);
                boolean matchStock = String.valueOf(p.getStock()).contains(texto);

                return matchNombre || matchCategoria || matchStock;
            });
        });

        tablaBusqueda.setOnMouseClicked(e -> {
            if (e.getClickCount() == 2) {
                txtCantidad.requestFocus();
            }
        });

        txtCantidad.setOnKeyPressed(event -> {
            if (event.getCode() == KeyCode.ENTER) {
                agregarProducto();
            }
        });

        tablaTicket.setOnKeyPressed(event -> {
            if (event.getCode() == KeyCode.DELETE) {
                eliminarDelTicket();
            }
        });

        txtAbona.textProperty().addListener((obs, oldVal, newVal) -> calcularVuelto());

        txtAbona.setOnKeyPressed(event -> {
            if (event.getCode() == KeyCode.ENTER) {
                finalizarVenta();
            }
        });
    }

    private void configurarTablas() {
        colBusqNombre.setCellValueFactory(new PropertyValueFactory<>("nombre"));
        colBusqStock.setCellValueFactory(new PropertyValueFactory<>("stock"));
        colBusqUnidad.setCellValueFactory(new PropertyValueFactory<>("unidadMedida"));
        colBusqPrecio.setCellValueFactory(new PropertyValueFactory<>("precio"));

        colTicketProducto.setCellValueFactory(new PropertyValueFactory<>("nombreProducto"));
        colTicketCant.setCellValueFactory(new PropertyValueFactory<>("cantidad"));
        colTicketPrecio.setCellValueFactory(new PropertyValueFactory<>("precioUnitario"));
        colTicketSubtotal.setCellValueFactory(new PropertyValueFactory<>("subtotal"));

        colBusqNombre.setReorderable(false);
        colBusqPrecio.setReorderable(false);
        colBusqStock.setReorderable(false);
        colBusqUnidad.setReorderable(false);
        colTicketProducto.setReorderable(false);
        colTicketCant.setReorderable(false);
        colTicketPrecio.setReorderable(false);
        colTicketSubtotal.setReorderable(false);

        tablaBusqueda.setColumnResizePolicy(TableView.CONSTRAINED_RESIZE_POLICY);
        tablaTicket.setColumnResizePolicy(TableView.CONSTRAINED_RESIZE_POLICY);
        tablaTicket.setItems(listaTicket);

        // Formato para los precios de búsqueda
        colBusqPrecio.setCellFactory(c -> new TableCell<Producto, Double>() {
            @Override
            protected void updateItem(Double precio, boolean empty) {
                super.updateItem(precio, empty);
                if (empty || precio == null) {
                    setText(null);
                } else {
                    setText(String.format("$ %.2f", precio));
                }
            }
        });

        // Formato para los precios unitarios del ticket
        colTicketPrecio.setCellFactory(c -> new TableCell<DetalleVenta, Double>() {
            @Override
            protected void updateItem(Double precio, boolean empty) {
                super.updateItem(precio, empty);
                if (empty || precio == null) {
                    setText(null);
                } else {
                    setText(String.format("$ %.2f", precio));
                }
            }
        });

        // Formato para los subtotales del ticket
        colTicketSubtotal.setCellFactory(c -> new TableCell<DetalleVenta, Double>() {
            @Override
            protected void updateItem(Double sub, boolean empty) {
                super.updateItem(sub, empty);
                if (empty || sub == null) {
                    setText(null);
                } else {
                    setText(String.format("$ %.2f", sub));
                }
            }
        });

        // --- PRECISIÓN DE BALANZA: 3 DECIMALES ---
        // Stock de Búsqueda: kg vs unid
        colBusqStock.setCellFactory(columna -> new TableCell<Producto, Double>() {
            @Override
            protected void updateItem(Double stock, boolean empty) {
                super.updateItem(stock, empty);
                if (empty || stock == null || getTableRow() == null || getTableRow().getItem() == null) {
                    setText(null);
                } else {
                    Producto p = getTableRow().getItem();
                    if ("unid".equalsIgnoreCase(p.getUnidadMedida())) {
                        setText(String.format("%.0f", stock));
                    } else {
                        setText(String.format("%.3f", stock)); // 3 decimales
                    }
                }
            }
        });

        // Stock del Ticket: kg vs unid
        colTicketCant.setCellFactory(columna -> new TableCell<DetalleVenta, Double>() {
            @Override
            protected void updateItem(Double cantidad, boolean empty) {
                super.updateItem(cantidad, empty);
                if (empty || cantidad == null || getTableRow() == null || getTableRow().getItem() == null) {
                    setText(null);
                } else {
                    DetalleVenta dv = getTableRow().getItem();
                    if ("unid".equalsIgnoreCase(dv.getProducto().getUnidadMedida())) {
                        setText(String.format("%.0f", cantidad));
                    } else {
                        setText(String.format("%.3f", cantidad)); // 3 decimales
                    }
                }
            }
        });

        // Ordenamiento Inteligente de Stock
        colBusqStock.setComparator((s1, s2) -> {
            boolean e1 = (s1 % 1 == 0);
            boolean e2 = (s2 % 1 == 0);
            if (e1 && !e2) {
                return -1;
            }
            if (!e1 && e2) {
                return 1;
            }
            return Double.compare(s1, s2);
        });

        ContextMenu menuTicket = new ContextMenu();
        MenuItem itemEliminar = new MenuItem("🗑️ Eliminar del ticket");
        itemEliminar.setOnAction(e -> eliminarDelTicket());
        menuTicket.getItems().add(itemEliminar);
        tablaTicket.setContextMenu(menuTicket);
    }

    private void eliminarDelTicket() {
        DetalleVenta seleccionado = tablaTicket.getSelectionModel().getSelectedItem();
        if (seleccionado != null) {
            Producto p = seleccionado.getProducto();
            p.setStock(p.getStock() + seleccionado.getCantidad());
            tablaBusqueda.refresh();
            listaTicket.remove(seleccionado);
            actualizarTotal();
        }
    }

    private void configurarFiltrosTexto() {
        // Filtro para el campo ABONA (Dinero = 2 decimales)
        java.util.function.UnaryOperator<TextFormatter.Change> filtroDinero = change -> {
            String textoNuevo = change.getControlNewText();
            if (textoNuevo.matches("^\\d*([\\.,]\\d{0,2})?$")) {
                return change;
            }
            return null;
        };
        txtAbona.setTextFormatter(new TextFormatter<>(filtroDinero));

        // Filtro para el campo CANTIDAD (Peso = 3 decimales)
        java.util.function.UnaryOperator<TextFormatter.Change> filtroPeso = change -> {
            String textoNuevo = change.getControlNewText();
            if (textoNuevo.matches("^\\d*([\\.,]\\d{0,3})?$")) {
                return change;
            }
            return null;
        };
        txtCantidad.setTextFormatter(new TextFormatter<>(filtroPeso));
    }

    private void cargarProductos() {
        listaProductos.clear();
        String sql = "SELECT * FROM productos WHERE activo = 1 AND stock_actual > 0";
        try (Connection conn = ConexionDB.conectar(); Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                Producto p = new Producto(
                        rs.getInt("id_producto"),
                        rs.getString("nombre"),
                        rs.getString("categoria"),
                        rs.getDouble("stock_actual"),
                        rs.getString("unidad_medida"),
                        rs.getDouble("precio_venta"),
                        rs.getDouble("stock_minimo"),
                        rs.getString("imagen_path")
                );
                p.setActivo(true);
                listaProductos.add(p);
            }

            listaFiltrada = new FilteredList<>(listaProductos, p -> true);
            SortedList<Producto> listaOrdenada = new SortedList<>(listaFiltrada);
            listaOrdenada.comparatorProperty().bind(tablaBusqueda.comparatorProperty());

            tablaBusqueda.setItems(listaOrdenada);

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @FXML
    private void limpiarBuscador() {
        txtBuscar.clear();
        txtBuscar.requestFocus();
    }

    @FXML
    private void agregarProducto() {
        Producto p = tablaBusqueda.getSelectionModel().getSelectedItem();
        if (p == null) {
            mostrarAlerta("Selecciona un producto de la lista izquierda.");
            return;
        }

        try {
            double cant = Double.parseDouble(txtCantidad.getText().replace(",", "."));
            if (cant <= 0) {
                throw new NumberFormatException();
            }

            if (cant > p.getStock()) {
                mostrarAlerta("¡Atención! No hay stock suficiente.\nStock disponible: " + String.format(p.getUnidadMedida().equals("unid") ? "%.0f" : "%.3f", p.getStock()) + " " + p.getUnidadMedida());
                return;
            }

            p.setStock(p.getStock() - cant);
            tablaBusqueda.refresh();

            listaTicket.add(new DetalleVenta(p, cant));
            actualizarTotal();
            txtCantidad.setText("1");
            txtBuscar.requestFocus();

        } catch (NumberFormatException e) {
            mostrarAlerta("Ingresa una cantidad válida.");
        }
    }

    private void actualizarTotal() {
        double total = listaTicket.stream().mapToDouble(DetalleVenta::getSubtotal).sum();
        lblTotal.setText(String.format("$ %.2f", total));
        calcularVuelto();
    }

    private void calcularVuelto() {
        double total = listaTicket.stream().mapToDouble(DetalleVenta::getSubtotal).sum();
        try {
            String abonaStr = txtAbona.getText().replace(",", ".");
            if (abonaStr.isEmpty()) {
                lblVuelto.setText("Vuelto: $ 0.00");
                lblVuelto.setTextFill(Color.BLACK);
                return;
            }
            double abona = Double.parseDouble(abonaStr);
            double vuelto = abona - total;

            if (vuelto < 0) {
                lblVuelto.setText("Faltan: $ " + String.format("%.2f", Math.abs(vuelto)));
                lblVuelto.setTextFill(Color.RED);
            } else {
                lblVuelto.setText("Vuelto: $ " + String.format("%.2f", vuelto));
                lblVuelto.setTextFill(Color.web("#005bb5"));
            }
        } catch (NumberFormatException e) {
            lblVuelto.setText("Monto inválido");
            lblVuelto.setTextFill(Color.RED);
        }
    }

    @FXML
    private void finalizarVenta() {
        if (listaTicket.isEmpty()) {
            mostrarAlerta("El carrito está vacío.");
            return;
        }

        double totalVenta = listaTicket.stream().mapToDouble(DetalleVenta::getSubtotal).sum();

        try {
            String abonaStr = txtAbona.getText().replace(",", ".");
            if (abonaStr.isEmpty()) {
                abonaStr = String.valueOf(totalVenta);
                txtAbona.setText(abonaStr);
            }

            double abona = Double.parseDouble(abonaStr);
            if (abona < totalVenta) {
                mostrarAlerta("El monto ingresado es insuficiente.\nFaltan: $ " + String.format("%.2f", totalVenta - abona));
                return;
            }
        } catch (NumberFormatException e) {
            mostrarAlerta("Ingresa un monto válido para cobrar.");
            return;
        }

        String sqlVenta = "INSERT INTO ventas (total) VALUES (?)";
        String sqlDetalle = "INSERT INTO detalle_ventas (id_venta, id_producto, cantidad, precio_unitario, subtotal) VALUES (?, ?, ?, ?, ?)";
        String sqlStock = "UPDATE productos SET stock_actual = stock_actual - ? WHERE id_producto = ?";
        String sqlMovimiento = "INSERT INTO movimientos (tipo, concepto, monto, categoria_contable) VALUES ('INGRESO', ?, ?, 'Ventas')";

        try (Connection conn = ConexionDB.conectar()) {
            conn.setAutoCommit(false);
            try {
                PreparedStatement pstmtVenta = conn.prepareStatement(sqlVenta, Statement.RETURN_GENERATED_KEYS);
                pstmtVenta.setDouble(1, totalVenta);
                pstmtVenta.executeUpdate();

                ResultSet rsKeys = pstmtVenta.getGeneratedKeys();
                int idVenta = rsKeys.next() ? rsKeys.getInt(1) : 0;

                PreparedStatement pstmtMov = conn.prepareStatement(sqlMovimiento);
                pstmtMov.setString(1, "Venta en mostrador (Ticket #" + idVenta + ")");
                pstmtMov.setDouble(2, totalVenta);
                pstmtMov.executeUpdate();

                PreparedStatement pstmtDetalle = conn.prepareStatement(sqlDetalle);
                PreparedStatement pstmtStock = conn.prepareStatement(sqlStock);

                for (DetalleVenta dv : listaTicket) {
                    pstmtDetalle.setInt(1, idVenta);
                    pstmtDetalle.setInt(2, dv.getProducto().getId());
                    pstmtDetalle.setDouble(3, dv.getCantidad());
                    pstmtDetalle.setDouble(4, dv.getPrecioUnitario());
                    pstmtDetalle.setDouble(5, dv.getSubtotal());
                    pstmtDetalle.addBatch();

                    pstmtStock.setDouble(1, dv.getCantidad());
                    pstmtStock.setInt(2, dv.getProducto().getId());
                    pstmtStock.addBatch();
                }

                pstmtDetalle.executeBatch();
                pstmtStock.executeBatch();

                conn.commit();

                mostrarMensajeExito("✅ Venta registrada: $" + String.format("%.2f", totalVenta));
                listaTicket.clear();
                lblTotal.setText("$ 0.00");
                txtAbona.clear();
                txtBuscar.requestFocus();
                cargarProductos();

            } catch (SQLException e) {
                conn.rollback();
                e.printStackTrace();
                mostrarAlerta("❌ Error crítico al guardar.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @FXML
    private void cancelarVenta() {
        for (DetalleVenta dv : listaTicket) {
            Producto p = dv.getProducto();
            p.setStock(p.getStock() + dv.getCantidad());
        }
        tablaBusqueda.refresh();

        listaTicket.clear();
        actualizarTotal();
        txtAbona.clear();
        txtBuscar.requestFocus();
    }

    private void mostrarMensajeExito(String msg) {
        if (lblMensaje != null) {
            lblMensaje.setText(msg);
            lblMensaje.setTextFill(Color.GREEN);
            PauseTransition pause = new PauseTransition(Duration.seconds(4));
            pause.setOnFinished(event -> lblMensaje.setText(""));
            pause.play();
        }
    }

    private void mostrarAlerta(String msg) {
        Alert alert = new Alert(Alert.AlertType.WARNING);
        alert.setTitle("Atención");
        alert.setHeaderText(null);
        alert.setContentText(msg);
        alert.showAndWait();
    }
}
