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
import javafx.collections.transformation.SortedList;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.input.KeyCode;
import javafx.stage.Modality;
import javafx.stage.Stage;

public class DashboardController implements Initializable {

    @FXML private TableView<Producto> tablaProductos;
    @FXML private TableColumn<Producto, String> colNombre;
    @FXML private TableColumn<Producto, Double> colStock;
    @FXML private TableColumn<Producto, Double> colPrecio;

    @FXML private Label lblVentas, lblGastos, lblStockCritico;

    @FXML private TextField txtBuscar, txtPrecioMin, txtPrecioMax;
    @FXML private ComboBox<String> cbEstado;

    private ObservableList<Producto> listaProductos = FXCollections.observableArrayList();
    private FilteredList<Producto> listaFiltrada;
    private SortedList<Producto> listaOrdenada;

    @Override
    public void initialize(URL url, ResourceBundle rb) {
        configurarTabla();
        // Inicializar ComboBox
        cbEstado.setItems(FXCollections.observableArrayList("Activos", "Inactivos", "Todo", "Stock Crítico"));
        cbEstado.setValue("Activos");

        // Listener para cambios en el ComboBox
        cbEstado.getSelectionModel().selectedItemProperty().addListener((obs, viejo, nuevo) -> onFiltrarProductos());

        actualizarTodo();
        configurarMenuContextual();

        // Interacción de teclado y mouse
        tablaProductos.getSelectionModel().setSelectionMode(SelectionMode.MULTIPLE);
        tablaProductos.setOnKeyPressed(event -> {
            if (event.getCode() == KeyCode.DELETE) bajaMultiple();
        });

        tablaProductos.setOnMouseClicked(event -> {
            if (event.getClickCount() == 2 && tablaProductos.getSelectionModel().getSelectedItem() != null) {
                abrirVentanaEdicion(tablaProductos.getSelectionModel().getSelectedItem());
            }
        });
    }

    private void configurarTabla() {
        colNombre.setCellValueFactory(new PropertyValueFactory<>("nombre"));
        colStock.setCellValueFactory(new PropertyValueFactory<>("stock"));
        colPrecio.setCellValueFactory(new PropertyValueFactory<>("precio"));

        // Bloquear el reordenamiento manual de columnas
        colNombre.setReorderable(false);
        colStock.setReorderable(false);
        colPrecio.setReorderable(false);

        colStock.setStyle("-fx-alignment: CENTER-RIGHT;");
        colPrecio.setStyle("-fx-alignment: CENTER-RIGHT;");

        // Formato de filas para Stock Crítico
        tablaProductos.setRowFactory(tv -> new TableRow<Producto>() {
            @Override
            protected void updateItem(Producto item, boolean empty) {
                super.updateItem(item, empty);
                if (item == null || empty) {
                    setStyle("");
                } else if (item.getStock() < 5) {
                    setStyle("-fx-background-color: #ffcccc;"); 
                } else {
                    setStyle("");
                }
            }
        });
    }

    @FXML
    private void onFiltrarProductos() {
        if (listaFiltrada == null) return;

        String busqueda = txtBuscar.getText().toLowerCase().trim();
        String minStr = txtPrecioMin.getText().trim();
        String maxStr = txtPrecioMax.getText().trim();
        String estado = cbEstado.getValue();

        listaFiltrada.setPredicate(p -> {
            // Filtro por Nombre
            boolean n = busqueda.isEmpty() || p.getNombre().toLowerCase().contains(busqueda);

            // Filtro por Precio Mínimo
            double min = 0;
            try { if (!minStr.isEmpty()) min = Double.parseDouble(minStr.replace(",", ".")); } 
            catch (NumberFormatException e) { min = 0; }

            // Filtro por Precio Máximo
            double max = Double.MAX_VALUE;
            try { if (!maxStr.isEmpty()) max = Double.parseDouble(maxStr.replace(",", ".")); } 
            catch (NumberFormatException e) { max = Double.MAX_VALUE; }

            boolean pr = p.getPrecio() >= min && p.getPrecio() <= max;

            // Filtro por Estado
            boolean est = true;
            if ("Activos".equals(estado)) est = p.isActivo();
            else if ("Inactivos".equals(estado)) est = !p.isActivo();
            else if ("Stock Crítico".equals(estado)) est = p.getStock() < 5 && p.isActivo();

            return n && pr && est;
        });
    }

    @FXML
    private void onLimpiarFiltros() {
        txtBuscar.clear();
        txtPrecioMin.clear();
        txtPrecioMax.clear();
        cbEstado.setValue("Activos");
        if (listaFiltrada != null) {
            listaFiltrada.setPredicate(p -> p.isActivo());
        }
        txtBuscar.requestFocus();
    }

    public void actualizarTodo() {
        cargarDatosDesdeBD();
        actualizarResumen();
    }

    private void cargarDatosDesdeBD() {
        listaProductos.clear();
        String sql = "SELECT id_producto, nombre, stock_actual, precio_venta, activo FROM productos";
        try (Connection conn = ConexionDB.conectar(); Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                Producto p = new Producto(
                        rs.getInt("id_producto"), rs.getString("nombre"),
                        rs.getDouble("stock_actual"), rs.getDouble("precio_venta")
                );
                p.setActivo(rs.getInt("activo") == 1);
                listaProductos.add(p);
            }

            // --- EL "ENGANCHE" CORRECTO ---
            // 1. Creamos la FilteredList
            listaFiltrada = new FilteredList<>(listaProductos, p -> p.isActivo());

            // 2. Envolvemos la FilteredList en la SortedList
            listaOrdenada = new SortedList<>(listaFiltrada);

            // 3. Sincronizamos comparadores para que el clic en cabeceras funcione
            listaOrdenada.comparatorProperty().bind(tablaProductos.comparatorProperty());

            // 4. Seteamos la SortedList a la tabla
            tablaProductos.setItems(listaOrdenada);

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void actualizarResumen() {
        try (Connection conn = ConexionDB.conectar()) {
            String sqlStock = "SELECT COUNT(*) FROM productos WHERE stock_actual < 5 AND activo = 1";
            ResultSet rs = conn.createStatement().executeQuery(sqlStock);
            if (rs.next()) lblStockCritico.setText(String.valueOf(rs.getInt(1)));
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void bajaMultiple() {
        ObservableList<Producto> seleccionados = tablaProductos.getSelectionModel().getSelectedItems();
        if (seleccionados.isEmpty()) return;

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
        } catch (SQLException e) { e.printStackTrace(); }
    }

    @FXML private void abrirVentanaCarga() { mostrarModal(null); }
    private void abrirVentanaEdicion(Producto p) { mostrarModal(p); }

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
        } catch (IOException e) { e.printStackTrace(); }
    }

    private void darDeBajaProducto(Producto p) {
        String sql = "UPDATE productos SET activo = 0 WHERE id_producto = ?";
        try (Connection conn = ConexionDB.conectar(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, p.getId());
            pstmt.executeUpdate();
            actualizarTodo();
        } catch (SQLException e) { e.printStackTrace(); }
    }

    private void configurarMenuContextual() {
        ContextMenu contextMenu = new ContextMenu();
        
        MenuItem itemNuevo = new MenuItem("Nuevo Producto");
        itemNuevo.setOnAction(event -> abrirVentanaCarga());

        MenuItem itemEditar = new MenuItem("Editar seleccionado");
        itemEditar.setOnAction(event -> {
            Producto p = tablaProductos.getSelectionModel().getSelectedItem();
            if (p != null) abrirVentanaEdicion(p);
        });

        MenuItem itemBaja = new MenuItem("Dar de Baja");
        itemBaja.setOnAction(event -> {
            Producto p = tablaProductos.getSelectionModel().getSelectedItem();
            if (p != null) darDeBajaProducto(p);
        });

        contextMenu.getItems().addAll(itemNuevo, new SeparatorMenuItem(), itemEditar, itemBaja);
        tablaProductos.setContextMenu(contextMenu);
    }
}