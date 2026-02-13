package com.mistressoles.controller;

import com.mistressoles.conexion.ConexionDB;
import com.mistressoles.modelos.Producto;
import java.io.IOException;
import java.net.URL;
import java.sql.*;
import java.util.ResourceBundle;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.*;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.collections.transformation.FilteredList;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.input.KeyCode;
import javafx.stage.Modality;
import javafx.stage.Stage;

public class DashboardController implements Initializable {

    @FXML
    private TableView<Producto> tablaProductos;
    // Eliminamos colId ya que no existe en el FXML
    @FXML
    private TableColumn<Producto, String> colNombre;
    @FXML
    private TableColumn<Producto, Double> colStock;
    @FXML
    private TableColumn<Producto, Double> colPrecio;

    @FXML
    private Label lblVentas, lblGastos, lblStockCritico;

    // Filtros vinculados a tus nuevos campos
    @FXML
    private TextField txtBuscar, txtPrecioMin, txtPrecioMax;

    private ObservableList<Producto> listaProductos = FXCollections.observableArrayList();
    private FilteredList<Producto> listaFiltrada;

    @Override
    public void initialize(URL url, ResourceBundle rb) {
        configurarTabla();
        actualizarTodo();
        configurarMenuContextual();

        // Habilitar selección múltiple y tecla Suprimir
        tablaProductos.getSelectionModel().setSelectionMode(SelectionMode.MULTIPLE);
        tablaProductos.setOnKeyPressed(event -> {
            if (event.getCode() == KeyCode.DELETE) {
                bajaMultiple();
            }
        });

        // Detectar doble clic para edición
        tablaProductos.setOnMouseClicked(event -> {
            if (event.getClickCount() == 2 && tablaProductos.getSelectionModel().getSelectedItem() != null) {
                abrirVentanaEdicion(tablaProductos.getSelectionModel().getSelectedItem());
            }
        });
    }

    private void configurarTabla() {
        // Ya no referenciamos colId
        colNombre.setCellValueFactory(new PropertyValueFactory<>("nombre"));
        colStock.setCellValueFactory(new PropertyValueFactory<>("stock"));
        colPrecio.setCellValueFactory(new PropertyValueFactory<>("precio"));

        // Alineación estética
        colNombre.setReorderable(false);
        colStock.setReorderable(false);
        colPrecio.setReorderable(false);

        // Resaltado de Stock Crítico (Menos de 5)
        tablaProductos.setRowFactory(tv -> new TableRow<Producto>() {
            @Override
            protected void updateItem(Producto item, boolean empty) {
                super.updateItem(item, empty);
                if (item == null || empty) {
                    setStyle("");
                } else if (item.getStock() < 5) {
                    setStyle("-fx-background-color: #ffcccc;"); // Rojo suave
                } else {
                    setStyle("");
                }
            }
        });
    }

    @FXML
    private void onFiltrarProductos() {
        // Este método debe estar vinculado al evento 'On Key Typed' de tus 3 buscadores
        String busqueda = txtBuscar.getText().toLowerCase().trim();
        String minStr = txtPrecioMin.getText().trim();
        String maxStr = txtPrecioMax.getText().trim();

        listaFiltrada.setPredicate(p -> {
            boolean coincideNombre = busqueda.isEmpty() || p.getNombre().toLowerCase().contains(busqueda);

            double min = minStr.isEmpty() ? 0 : Double.parseDouble(minStr.replace(",", "."));
            boolean coincideMin = p.getPrecio() >= min;

            double max = maxStr.isEmpty() ? Double.MAX_VALUE : Double.parseDouble(maxStr.replace(",", "."));
            boolean coincideMax = p.getPrecio() <= max;

            return coincideNombre && coincideMin && coincideMax;
        });
    }

    @FXML
    private void onLimpiarFiltros() {
        txtBuscar.clear();
        txtPrecioMin.clear();
        txtPrecioMax.clear();
        listaFiltrada.setPredicate(p -> true);
        txtBuscar.requestFocus();
    }

    public void actualizarTodo() {
        cargarDatosDesdeBD();
        actualizarResumen();
    }

    private void cargarDatosDesdeBD() {
        listaProductos.clear();
        String sql = "SELECT id_producto, nombre, stock_actual, precio_venta FROM productos WHERE activo = 1";
        try (Connection conn = ConexionDB.conectar(); Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                listaProductos.add(new Producto(
                        rs.getInt("id_producto"),
                        rs.getString("nombre"),
                        rs.getDouble("stock_actual"),
                        rs.getDouble("precio_venta")
                ));
            }
            listaFiltrada = new FilteredList<>(listaProductos, p -> true);
            tablaProductos.setItems(listaFiltrada);
        } catch (SQLException e) {
            System.err.println("❌ Error en tabla: " + e.getMessage());
        }
    }

    private void actualizarResumen() {
        try (Connection conn = ConexionDB.conectar()) {
            String sqlStock = "SELECT COUNT(*) FROM productos WHERE stock_actual < 5 AND activo = 1";
            ResultSet rs = conn.createStatement().executeQuery(sqlStock);
            if (rs.next()) {
                lblStockCritico.setText(String.valueOf(rs.getInt(1)));
            }
            lblVentas.setText("$ 0.00");
            lblGastos.setText("$ 0.00");
        } catch (SQLException e) {
            System.err.println("❌ Error en resumen: " + e.getMessage());
        }
    }

    private void bajaMultiple() {
        ObservableList<Producto> seleccionados = tablaProductos.getSelectionModel().getSelectedItems();
        if (seleccionados.isEmpty()) {
            return;
        }

        String sql = "UPDATE productos SET activo = 0 WHERE id_producto = ?";
        try (Connection conn = ConexionDB.conectar(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            conn.setAutoCommit(false);
            for (Producto p : seleccionados) {
                pstmt.setInt(1, p.getId());
                pstmt.addBatch();
            }
            pstmt.executeBatch();
            conn.commit();
            actualizarTodo();
        } catch (SQLException e) {
            System.err.println("❌ Error en lote: " + e.getMessage());
        }
    }

    @FXML
    private void abrirVentanaCarga() {
        mostrarModal(null);
    }

    private void abrirVentanaEdicion(Producto p) {
        mostrarModal(p);
    }

    private void mostrarModal(Producto p) {
        try {
            FXMLLoader loader = new FXMLLoader(getClass().getResource("/com/mistressoles/views/dashboard/nuevo_producto.fxml"));
            Parent root = loader.load();
            if (p != null) {
                NuevoProductoController controller = loader.getController();
                controller.setProducto(p);
            }
            Stage stage = new Stage();
            stage.setScene(new Scene(root));
            stage.setTitle(p == null ? "Nuevo Producto" : "Editar Producto");
            stage.initModality(Modality.APPLICATION_MODAL);
            stage.setOnHiding(event -> actualizarTodo());
            stage.show();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void darDeBajaProducto(Producto p) {
        String sql = "UPDATE productos SET activo = 0 WHERE id_producto = ?";
        try (Connection conn = ConexionDB.conectar(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, p.getId());
            pstmt.executeUpdate();
            actualizarTodo();
        } catch (SQLException e) {
            System.err.println("❌ Error: " + e.getMessage());
        }
    }

    private void configurarMenuContextual() {
        ContextMenu contextMenu = new ContextMenu();
        MenuItem itemBaja = new MenuItem("Dar de Baja");
        itemBaja.setOnAction(event -> {
            Producto seleccionado = tablaProductos.getSelectionModel().getSelectedItem();
            if (seleccionado != null) {
                darDeBajaProducto(seleccionado);
            }
        });
        contextMenu.getItems().add(itemBaja);
        tablaProductos.setContextMenu(contextMenu);
    }
}
