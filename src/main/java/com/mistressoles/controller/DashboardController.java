package com.mistressoles.controller;

import com.mistressoles.conexion.ConexionDB;
import com.mistressoles.modelos.Producto;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.collections.transformation.FilteredList;
import javafx.collections.transformation.SortedList;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.paint.Color;
import javafx.stage.Stage;

import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Optional;
import java.util.ResourceBundle;

public class DashboardController implements Initializable {

    @FXML
    private Label lblVentasDia;
    @FXML
    private Label lblGastosDia;
    @FXML
    private Label lblGananciaDia;
    @FXML
    private Label lblStockCritico;

    @FXML
    private TextField txtBuscar;
    @FXML
    private TextField txtPrecioMin;
    @FXML
    private TextField txtPrecioMax;
    @FXML
    private ComboBox<String> cbEstado;

    @FXML
    private TableView<Producto> tablaProductos;
    @FXML
    private TableColumn<Producto, String> colNombre;
    @FXML
    private TableColumn<Producto, String> colCategoria;
    @FXML
    private TableColumn<Producto, Double> colStock;
    @FXML
    private TableColumn<Producto, String> colUnidad;
    @FXML
    private TableColumn<Producto, Double> colPrecio;

    private ObservableList<Producto> listaProductos = FXCollections.observableArrayList();
    private FilteredList<Producto> listaFiltrada;

    @Override
    public void initialize(URL url, ResourceBundle rb) {
        configurarTabla();
        configurarFiltros();
        cargarProductos();
        calcularMetricasDelDia();
    }

    private void configurarTabla() {
        colNombre.setCellValueFactory(new PropertyValueFactory<>("nombre"));
        colCategoria.setCellValueFactory(new PropertyValueFactory<>("categoria"));
        colStock.setCellValueFactory(new PropertyValueFactory<>("stock"));
        colUnidad.setCellValueFactory(new PropertyValueFactory<>("unidadMedida"));
        colPrecio.setCellValueFactory(new PropertyValueFactory<>("precio"));

        colNombre.setReorderable(false);
        colCategoria.setReorderable(false);
        colStock.setReorderable(false);
        colUnidad.setReorderable(false);
        colPrecio.setReorderable(false);

        tablaProductos.setColumnResizePolicy(TableView.CONSTRAINED_RESIZE_POLICY);

        // --- PRECISIÓN DE 3 DECIMALES PARA EL STOCK ---
        colStock.setCellFactory(columna -> new TableCell<Producto, Double>() {
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
                        setText(String.format("%.3f", stock)); // Actualizado a 3 decimales
                    }
                }
            }
        });

        colPrecio.setCellFactory(columna -> new TableCell<Producto, Double>() {
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

        colStock.setComparator((stock1, stock2) -> {
            boolean esEntero1 = (stock1 % 1 == 0);
            boolean esEntero2 = (stock2 % 1 == 0);

            if (esEntero1 && !esEntero2) {
                return -1;
            }
            if (!esEntero1 && esEntero2) {
                return 1;
            }

            return Double.compare(stock1, stock2);
        });

        tablaProductos.setRowFactory(tv -> new TableRow<Producto>() {
            @Override
            protected void updateItem(Producto item, boolean empty) {
                super.updateItem(item, empty);
                if (item == null || empty) {
                    setStyle("");
                } else if (item.getStock() <= 0) {
                    setStyle("-fx-background-color: #ffcdd2;");
                } else if (item.getStock() <= item.getStockMinimo()) {
                    setStyle("-fx-background-color: #ffe082;");
                } else {
                    setStyle("");
                }
            }
        });

        ContextMenu contextMenu = new ContextMenu();
        MenuItem miAgregar = new MenuItem("Agregar Producto");
        MenuItem miModificar = new MenuItem("Modificar Producto");
        MenuItem miEstado = new MenuItem("Dar de Baja");

        miAgregar.setOnAction(e -> abrirVentanaCarga());
        miModificar.setOnAction(e -> modificarProductoSeleccionado());
        miEstado.setOnAction(e -> alternarEstadoProducto());

        contextMenu.getItems().addAll(miAgregar, miModificar, new SeparatorMenuItem(), miEstado);
        tablaProductos.setContextMenu(contextMenu);

        tablaProductos.getSelectionModel().selectedItemProperty().addListener((obs, oldVal, newVal) -> {
            if (newVal != null) {
                if (newVal.isActivo()) {
                    miEstado.setText("Dar de Baja");
                } else {
                    miEstado.setText("Dar de Alta");
                }
            }
        });

        tablaProductos.setOnMouseClicked(event -> {
            if (event.getClickCount() == 2 && tablaProductos.getSelectionModel().getSelectedItem() != null) {
                modificarProductoSeleccionado();
            }
        });
    }

    private void configurarFiltros() {
        cbEstado.setItems(FXCollections.observableArrayList("Todos", "Activos", "Inactivos", "Sin stock"));
        cbEstado.setValue("Activos");
    }

    private void cargarProductos() {
        listaProductos.clear();
        String sql = "SELECT * FROM productos";

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
                p.setActivo(rs.getInt("activo") == 1);
                listaProductos.add(p);
            }

            listaFiltrada = new FilteredList<>(listaProductos, p -> true);
            SortedList<Producto> listaOrdenada = new SortedList<>(listaFiltrada);
            listaOrdenada.comparatorProperty().bind(tablaProductos.comparatorProperty());

            tablaProductos.setItems(listaOrdenada);
            onFiltrarProductos();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @FXML
    private void calcularMetricasDelDia() {
        double ingresosHoy = 0;
        double gastosHoy = 0;
        int productosEnAlerta = 0;

        try (Connection conn = ConexionDB.conectar(); Statement stmt = conn.createStatement()) {
            String sqlIngresos = "SELECT SUM(monto) AS total FROM movimientos WHERE tipo = 'INGRESO' AND date(fecha) = date('now', 'localtime')";
            ResultSet rsIngresos = stmt.executeQuery(sqlIngresos);
            if (rsIngresos.next()) {
                ingresosHoy = rsIngresos.getDouble("total");
            }

            String sqlGastos = "SELECT SUM(monto) AS total FROM movimientos WHERE tipo = 'GASTO' AND date(fecha) = date('now', 'localtime')";
            ResultSet rsGastos = stmt.executeQuery(sqlGastos);
            if (rsGastos.next()) {
                gastosHoy = rsGastos.getDouble("total");
            }

            String sqlStock = "SELECT COUNT(*) AS cantidad FROM productos WHERE stock_actual <= stock_minimo AND activo = 1";
            ResultSet rsStock = stmt.executeQuery(sqlStock);
            if (rsStock.next()) {
                productosEnAlerta = rsStock.getInt("cantidad");
            }

        } catch (SQLException e) {
            System.out.println("Error al cargar métricas del día.");
        }

        lblVentasDia.setText(String.format("$ %.2f", ingresosHoy));
        lblGastosDia.setText(String.format("$ %.2f", gastosHoy));

        double ganancia = ingresosHoy - gastosHoy;
        lblGananciaDia.setText(String.format("$ %.2f", ganancia));
        lblGananciaDia.setTextFill(ganancia < 0 ? Color.RED : Color.web("#1565c0"));

        lblStockCritico.setText(productosEnAlerta + " Productos");
        lblStockCritico.setTextFill(productosEnAlerta > 0 ? Color.RED : Color.web("#856404"));
    }

    @FXML
    private void abrirVentanaVentas() {
        abrirVentana("/com/mistressoles/views/ventas/venta.fxml", "Caja Registradora - Nueva Venta");
    }

    @FXML
    private void abrirMovimientos() {
        abrirVentana("/com/mistressoles/views/movimientos/movimiento.fxml", "Gestión de Movimientos y Gastos");
    }

    @FXML
    private void abrirVentanaCarga() {
        abrirVentana("/com/mistressoles/views/dashboard/nuevo_producto.fxml", "Gestión de Productos");
    }

    private void abrirVentana(String rutaFXML, String titulo) {
        try {
            FXMLLoader loader = new FXMLLoader(getClass().getResource(rutaFXML));
            Parent root = loader.load();
            Stage stage = new Stage();
            stage.setTitle(titulo);
            stage.setScene(new Scene(root));
            stage.setOnHidden(e -> {
                cargarProductos();
                calcularMetricasDelDia();
            });
            stage.show();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @FXML
    private void modificarProductoSeleccionado() {
        Producto seleccionado = tablaProductos.getSelectionModel().getSelectedItem();
        if (seleccionado == null) {
            mostrarAlerta("Selecciona un producto de la tabla para modificarlo.", Alert.AlertType.WARNING);
            return;
        }

        try {
            FXMLLoader loader = new FXMLLoader(getClass().getResource("/com/mistressoles/views/dashboard/nuevo_producto.fxml"));
            Parent root = loader.load();

            NuevoProductoController controller = loader.getController();
            controller.setProducto(seleccionado);

            Stage stage = new Stage();
            stage.setTitle("Modificar Producto: " + seleccionado.getNombre());
            stage.setScene(new Scene(root));
            stage.setOnHidden(e -> {
                cargarProductos();
                calcularMetricasDelDia();
            });
            stage.show();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @FXML
    private void alternarEstadoProducto() {
        Producto seleccionado = tablaProductos.getSelectionModel().getSelectedItem();
        if (seleccionado == null) {
            mostrarAlerta("Selecciona un producto para cambiar su estado.", Alert.AlertType.WARNING);
            return;
        }

        boolean estaActivo = seleccionado.isActivo();
        String accion = estaActivo ? "Dar de baja" : "Dar de alta";
        int nuevoEstado = estaActivo ? 0 : 1;

        Alert confirm = new Alert(Alert.AlertType.CONFIRMATION);
        confirm.setTitle("Confirmar " + accion);
        confirm.setHeaderText(accion + ": " + seleccionado.getNombre());
        confirm.setContentText("¿Estás seguro de que deseas " + accion.toLowerCase() + " este producto?");

        Optional<ButtonType> result = confirm.showAndWait();
        if (result.isPresent() && result.get() == ButtonType.OK) {
            String sql = "UPDATE productos SET activo = ? WHERE id_producto = ?";
            try (Connection conn = ConexionDB.conectar(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

                pstmt.setInt(1, nuevoEstado);
                pstmt.setInt(2, seleccionado.getId());
                pstmt.executeUpdate();

                cargarProductos();
                calcularMetricasDelDia();
                mostrarAlerta("Producto " + (estaActivo ? "dado de baja" : "dado de alta") + " correctamente.", Alert.AlertType.INFORMATION);

            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    private void mostrarAlerta(String msg, Alert.AlertType tipo) {
        Alert alert = new Alert(tipo);
        alert.setTitle("Sistema");
        alert.setHeaderText(null);
        alert.setContentText(msg);
        alert.showAndWait();
    }

    @FXML
    private void onFiltrarProductos() {
        if (listaFiltrada == null) {
            return;
        }

        listaFiltrada.setPredicate(producto -> {
            String textoBusqueda = txtBuscar.getText().toLowerCase();
            boolean coincideNombre = producto.getNombre().toLowerCase().contains(textoBusqueda);
            boolean coincideCategoria = producto.getCategoria().toLowerCase().contains(textoBusqueda);
            boolean coincideStock = String.valueOf(producto.getStock()).contains(textoBusqueda);

            if (!textoBusqueda.isEmpty() && !coincideNombre && !coincideCategoria && !coincideStock) {
                return false;
            }

            try {
                if (!txtPrecioMin.getText().isEmpty()) {
                    double min = Double.parseDouble(txtPrecioMin.getText());
                    if (producto.getPrecio() < min) {
                        return false;
                    }
                }
                if (!txtPrecioMax.getText().isEmpty()) {
                    double max = Double.parseDouble(txtPrecioMax.getText());
                    if (producto.getPrecio() > max) {
                        return false;
                    }
                }
            } catch (NumberFormatException e) {
            }

            String estado = cbEstado.getValue();
            if (estado != null) {
                if (estado.equals("Sin stock") && producto.getStock() > 0) {
                    return false;
                }
                if (estado.equals("Activos") && !producto.isActivo()) {
                    return false;
                }
                if (estado.equals("Inactivos") && producto.isActivo()) {
                    return false;
                }
            }

            return true;
        });
    }

    @FXML
    private void onLimpiarFiltros() {
        txtBuscar.clear();
        txtPrecioMin.clear();
        txtPrecioMax.clear();
        cbEstado.setValue("Activos");
        onFiltrarProductos();
    }
}
