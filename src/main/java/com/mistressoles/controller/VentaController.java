package com.mistressoles.controller;

import javafx.animation.PauseTransition;
import javafx.scene.paint.Color;
import javafx.util.Duration;
import com.mistressoles.conexion.ConexionDB;
import com.mistressoles.modelos.DetalleVenta;
import com.mistressoles.modelos.Producto;
import java.net.URL;
import java.sql.*;
import java.util.ResourceBundle;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.collections.transformation.FilteredList;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.*;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.input.KeyCode;

public class VentaController implements Initializable {

    // --- LADO IZQUIERDO: BUSQUEDA ---
    @FXML
    private TextField txtBuscar;
    @FXML
    private TableView<Producto> tablaBusqueda;
    @FXML
    private TableColumn<Producto, String> colBusqNombre;
    @FXML
    private TableColumn<Producto, Double> colBusqPrecio;
    @FXML
    private TableColumn<Producto, Double> colBusqStock;

    @FXML
    private TextField txtCantidad;

    // --- LADO DERECHO: TICKET ---
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

    // --- VUELTO ---
    @FXML
    private TextField txtAbona;
    @FXML
    private Label lblVuelto;

    // --- DATOS ---
    private ObservableList<Producto> listaProductos = FXCollections.observableArrayList();
    private FilteredList<Producto> listaFiltrada;
    private ObservableList<DetalleVenta> listaTicket = FXCollections.observableArrayList();

    @Override
    public void initialize(URL url, ResourceBundle rb) {
        configurarTablas();
        cargarProductos();

        // --- NUEVO: Filtro para aceptar solo números y hasta 2 decimales ---
        java.util.function.UnaryOperator<TextFormatter.Change> filtroDecimales = change -> {
            String textoNuevo = change.getControlNewText();
            // Expresión Regular: Acepta vacío, o números seguidos de un punto/coma opcional y hasta 2 dígitos
            if (textoNuevo.matches("^\\d*([\\.,]\\d{0,2})?$")) {
                return change; // Permite el cambio
            }
            return null; // Rechaza la tecla pulsada
        };

        // Aplicamos el filtro a ambos campos de texto
        txtAbona.setTextFormatter(new TextFormatter<>(filtroDecimales));
        txtCantidad.setTextFormatter(new TextFormatter<>(filtroDecimales));
        // ------------------------------------------------------------------

        // Buscador en tiempo real
        txtBuscar.textProperty().addListener((obs, oldVal, newVal) -> {
            listaFiltrada.setPredicate(p -> {
                if (newVal == null || newVal.isEmpty()) {
                    return true;
                }
                return p.getNombre().toLowerCase().contains(newVal.toLowerCase());
            });
        });

        // Al hacer doble clic en un producto, poner foco en cantidad
        tablaBusqueda.setOnMouseClicked(e -> {
            if (e.getClickCount() == 2) {
                txtCantidad.requestFocus();
            }
        });

        // Agregar producto con ENTER en cantidad
        txtCantidad.setOnKeyPressed(event -> {
            if (event.getCode() == KeyCode.ENTER) {
                agregarProducto();
            }
        });

        // Borrar fila del ticket con SUPRIMIR
        tablaTicket.setOnKeyPressed(event -> {
            if (event.getCode() == KeyCode.DELETE) {
                DetalleVenta seleccionado = tablaTicket.getSelectionModel().getSelectedItem();
                if (seleccionado != null) {

                    // --- NUEVO: Devolvemos el stock a la tabla izquierda ---
                    Producto p = seleccionado.getProducto();
                    p.setStock(p.getStock() + seleccionado.getCantidad());
                    tablaBusqueda.refresh();
                    // -------------------------------------------------------

                    listaTicket.remove(seleccionado);
                    actualizarTotal();
                }
            }
        });

        // Calcular vuelto dinámicamente
        txtAbona.textProperty().addListener((obs, oldVal, newVal) -> calcularVuelto());

        // Cobrar al presionar ENTER en "Abona con" (Llama a la misma validación que el botón)
        txtAbona.setOnKeyPressed(event -> {
            if (event.getCode() == KeyCode.ENTER) {
                finalizarVenta();
            }
        });
    }

    private void configurarTablas() {
        colBusqNombre.setCellValueFactory(new PropertyValueFactory<>("nombre"));
        colBusqPrecio.setCellValueFactory(new PropertyValueFactory<>("precio"));
        colBusqStock.setCellValueFactory(new PropertyValueFactory<>("stock"));

        colTicketProducto.setCellValueFactory(new PropertyValueFactory<>("nombreProducto"));
        colTicketCant.setCellValueFactory(new PropertyValueFactory<>("cantidad"));
        colTicketPrecio.setCellValueFactory(new PropertyValueFactory<>("precioUnitario"));
        colTicketSubtotal.setCellValueFactory(new PropertyValueFactory<>("subtotal"));

        // Bloquear columnas
        colBusqNombre.setReorderable(false);
        colBusqPrecio.setReorderable(false);
        colBusqStock.setReorderable(false);
        colTicketProducto.setReorderable(false);
        colTicketCant.setReorderable(false);
        colTicketPrecio.setReorderable(false);
        colTicketSubtotal.setReorderable(false);

        tablaBusqueda.setColumnResizePolicy(TableView.CONSTRAINED_RESIZE_POLICY);
        tablaTicket.setColumnResizePolicy(TableView.CONSTRAINED_RESIZE_POLICY);
        tablaTicket.setItems(listaTicket);
    }

    private void cargarProductos() {
        listaProductos.clear();
        // --- ACÁ ESTÁ EL CAMBIO: Agregamos "AND stock_actual > 0" ---
        String sql = "SELECT * FROM productos WHERE activo = 1 AND stock_actual > 0";
        // -------------------------------------------------------------
        try (Connection conn = ConexionDB.conectar(); Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                listaProductos.add(new Producto(
                        rs.getInt("id_producto"), rs.getString("nombre"),
                        rs.getDouble("stock_actual"), rs.getDouble("precio_venta")
                ));
            }
            listaFiltrada = new FilteredList<>(listaProductos, p -> true);
            tablaBusqueda.setItems(listaFiltrada);
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

            // Verificamos si alcanza el stock (que ahora se actualiza en vivo)
            if (cant > p.getStock()) {
                mostrarAlerta("¡Atención! No hay stock suficiente.\nStock disponible de " + p.getNombre() + ": " + p.getStock());
                return;
            }

            // --- NUEVO: Descontamos el stock en memoria y refrescamos la tabla ---
            p.setStock(p.getStock() - cant);
            tablaBusqueda.refresh();
            // ----------------------------------------------------------------------

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

        // --- VALIDACIÓN DE PAGO ---
        try {
            String abonaStr = txtAbona.getText().replace(",", ".");

            // --- OPCIÓN ESTRICTA (Si preferís obligar a escribir, descomentá esto y borrá lo de abajo) ---
            /*
            if (abonaStr.isEmpty()) {
                mostrarAlerta("Por favor, ingresa el monto con el que abona el cliente.");
                txtAbona.requestFocus();
                return;
            }
             */
            // --- OPCIÓN ÁGIL (Asumimos pago exacto si está vacío) ---
            if (abonaStr.isEmpty()) {
                abonaStr = String.valueOf(totalVenta); // Asumimos el total
                txtAbona.setText(abonaStr); // Lo mostramos visualmente en el campo
            }

            double abona = Double.parseDouble(abonaStr);
            if (abona < totalVenta) {
                mostrarAlerta("El monto ingresado es insuficiente.\nFaltan: $ " + String.format("%.2f", totalVenta - abona));
                return; // Cortamos la ejecución acá, NO SE COBRA
            }

        } catch (NumberFormatException e) {
            mostrarAlerta("Ingresa un monto válido para cobrar.");
            return;
        }
        // ------------------------------------------

        // ... Acá sigue intacto tu código de base de datos (String sqlVenta = ...) ...
        String sqlVenta = "INSERT INTO ventas (total) VALUES (?)";
        String sqlDetalle = "INSERT INTO detalle_ventas (id_venta, id_producto, cantidad, precio_unitario, subtotal) VALUES (?, ?, ?, ?, ?)";
        String sqlStock = "UPDATE productos SET stock_actual = stock_actual - ? WHERE id_producto = ?";

        try (Connection conn = ConexionDB.conectar()) {
            conn.setAutoCommit(false);
            try {
                PreparedStatement pstmtVenta = conn.prepareStatement(sqlVenta, Statement.RETURN_GENERATED_KEYS);
                pstmtVenta.setDouble(1, totalVenta);
                pstmtVenta.executeUpdate();

                ResultSet rsKeys = pstmtVenta.getGeneratedKeys();
                int idVenta = rsKeys.next() ? rsKeys.getInt(1) : 0;

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

                mostrarMensajeExito("✅ Venta registrada: $" + totalVenta);
                listaTicket.clear();
                lblTotal.setText("$ 0.00");
                txtAbona.clear();
                txtBuscar.requestFocus();
                cargarProductos();

            } catch (SQLException e) {
                conn.rollback();
                e.printStackTrace();
                mostrarAlerta("❌ Error al registrar la venta.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @FXML
    private void cancelarVenta() {
        // --- NUEVO: Devolvemos el stock de TODOS los productos del carrito ---
        for (DetalleVenta dv : listaTicket) {
            Producto p = dv.getProducto();
            p.setStock(p.getStock() + dv.getCantidad());
        }
        tablaBusqueda.refresh();
        // ---------------------------------------------------------------------

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
