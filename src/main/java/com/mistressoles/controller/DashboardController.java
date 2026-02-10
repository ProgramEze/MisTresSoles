package com.mistressoles.controller;

import com.mistressoles.conexion.ConexionDB;
import com.mistressoles.modelos.Producto;
import java.io.IOException;
import java.net.URL;
import java.sql.*;
import java.util.ResourceBundle;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Label;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Modality;
import javafx.stage.Stage;

public class DashboardController implements Initializable {

    // Componentes de la Tabla
    @FXML
    private TableView<Producto> tablaProductos;
    @FXML
    private TableColumn<Producto, Integer> colId;
    @FXML
    private TableColumn<Producto, String> colNombre;
    @FXML
    private TableColumn<Producto, Double> colStock;
    @FXML
    private TableColumn<Producto, Double> colPrecio;

    // Componentes de los cuadros de resumen
    @FXML
    private Label lblVentas;
    @FXML
    private Label lblGastos;
    @FXML
    private Label lblStockCritico;

    private ObservableList<Producto> listaProductos = FXCollections.observableArrayList();

    @Override
    public void initialize(URL url, ResourceBundle rb) {
        configurarTabla();
        cargarDatosDesdeBD();
        actualizarResumen(); // Llamamos a la lógica de los cuadros de colores
    }

    private void configurarTabla() {
        // Vincula los atributos de Producto.java con las columnas de la vista
        colId.setCellValueFactory(new PropertyValueFactory<>("id"));
        colNombre.setCellValueFactory(new PropertyValueFactory<>("nombre"));
        colStock.setCellValueFactory(new PropertyValueFactory<>("stock"));
        colPrecio.setCellValueFactory(new PropertyValueFactory<>("precio"));
    }

    private void cargarDatosDesdeBD() {
        listaProductos.clear();
        // Consulta SQL usando los nombres de columna de tu script de SQLite
        String sql = "SELECT id_producto, nombre, stock_actual, precio_venta FROM productos";

        try (Connection conn = ConexionDB.conectar(); Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                listaProductos.add(new Producto(
                        rs.getInt("id_producto"),
                        rs.getString("nombre"),
                        rs.getDouble("stock_actual"),
                        rs.getDouble("precio_venta")
                ));
            }
            tablaProductos.setItems(listaProductos);

        } catch (SQLException e) {
            System.err.println("❌ Error al cargar la tabla: " + e.getMessage());
        }
    }

    private void actualizarResumen() {
        try (Connection conn = ConexionDB.conectar()) {
            // Lógica para el cuadro amarillo: Stock Crítico (menor a 5 unidades)
            String sqlStock = "SELECT COUNT(*) FROM productos WHERE stock_actual < 5";
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sqlStock);

            if (rs.next()) {
                lblStockCritico.setText(String.valueOf(rs.getInt(1)));
            }

            // Valores temporales para Ventas y Gastos hasta que creemos sus tablas
            lblVentas.setText("$ 0.00");
            lblGastos.setText("$ 0.00");

        } catch (SQLException e) {
            System.err.println("❌ Error al actualizar resumen: " + e.getMessage());
        }
    }

    @FXML
    private void onMenuAgregarProducto() {
        try {
            // Cargamos el FXML del modal
            FXMLLoader loader = new FXMLLoader(getClass().getResource("/com/mistressoles/nuevo_producto.fxml"));
            Parent root = loader.load();

            // Creamos la nueva ventana (Stage)
            Stage stage = new Stage();
            stage.setScene(new Scene(root));
            stage.setTitle("Mis Tres Soles - Cargar Producto");

            // Lo hacemos modal (bloquea la ventana principal)
            stage.initModality(Modality.APPLICATION_MODAL);
            stage.showAndWait();

            // Al cerrar el modal, refrescamos la tabla automáticamente
            cargarDatosDesdeBD();

        } catch (IOException e) {
            System.err.println("❌ No se pudo abrir el modal: " + e.getMessage());
        }
    }
}
