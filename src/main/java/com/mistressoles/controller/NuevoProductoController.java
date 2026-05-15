package com.mistressoles.controller;

import com.mistressoles.modelos.Producto;
import java.net.URL;
import java.sql.*;
import java.util.ResourceBundle;
import java.util.function.UnaryOperator;
import javafx.collections.FXCollections;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.*;
import javafx.stage.Stage;

public class NuevoProductoController implements Initializable {

    @FXML
    private TextField txtNombre, txtStock, txtPrecio, txtStockMinimo;
    @FXML
    private ComboBox<String> cbCategoria, cbUnidad;
    @FXML
    private Button btnCancelar, btnGuardar;
    @FXML
    private Label lblMensaje;

    private Producto productoExistente;
    private boolean esModificacion = false;

    @Override
    public void initialize(URL url, ResourceBundle rb) {
        // Filtros estrictos separados
        configurarFiltroStock(txtStock);
        configurarFiltroStock(txtStockMinimo);
        configurarFiltroPrecio(txtPrecio);

        cbCategoria.setItems(FXCollections.observableArrayList("Verduras", "Frutas", "Almacén", "Bebidas", "Otros"));
        cbUnidad.setItems(FXCollections.observableArrayList("kg", "unid"));

        cbUnidad.setValue("kg");
        txtStockMinimo.setText("2.000"); // 3 decimales por defecto

        btnCancelar.setCancelButton(true);
    }

    public void setProducto(Producto p) {
        this.productoExistente = p;
        this.esModificacion = true;

        txtNombre.setText(p.getNombre());
        cbCategoria.setValue(p.getCategoria());
        cbUnidad.setValue(p.getUnidadMedida());

        // --- Formateo dinámico al cargar para modificar ---
        if ("unid".equalsIgnoreCase(p.getUnidadMedida())) {
            txtStock.setText(String.format("%.0f", p.getStock()));
            txtStockMinimo.setText(String.format("%.0f", p.getStockMinimo()));
        } else {
            txtStock.setText(String.format("%.3f", p.getStock()).replace(",", "."));
            txtStockMinimo.setText(String.format("%.3f", p.getStockMinimo()).replace(",", "."));
        }

        txtPrecio.setText(String.format("%.2f", p.getPrecio()).replace(",", "."));

        btnGuardar.setText("Modificar");
    }

    @FXML
    private void onGuardarClick() {
        String nombre = txtNombre.getText().trim();

        if (nombre.isEmpty() || txtStock.getText().isEmpty() || txtPrecio.getText().isEmpty()
                || txtStockMinimo.getText().isEmpty() || cbCategoria.getValue() == null || cbUnidad.getValue() == null) {
            lblMensaje.setText("⚠️ Completa todos los campos.");
            lblMensaje.setStyle("-fx-text-fill: orange;");
            return;
        }

        if (existeProductoConNombre(nombre)) {
            lblMensaje.setText("⚠️ El producto '" + nombre + "' ya existe.");
            lblMensaje.setStyle("-fx-text-fill: orange;");
            return;
        }

        String sql;
        if (esModificacion) {
            sql = "UPDATE productos SET nombre = ?, categoria = ?, stock_actual = ?, unidad_medida = ?, precio_venta = ?, stock_minimo = ? WHERE id_producto = ?";
        } else {
            sql = "INSERT INTO productos (nombre, categoria, stock_actual, unidad_medida, precio_venta, stock_minimo) VALUES (?, ?, ?, ?, ?, ?)";
        }

        try (Connection conn = com.mistressoles.conexion.ConexionDB.conectar(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, txtNombre.getText());
            pstmt.setString(2, cbCategoria.getValue());
            pstmt.setDouble(3, Double.parseDouble(txtStock.getText().replace(",", ".")));
            pstmt.setString(4, cbUnidad.getValue());
            pstmt.setDouble(5, Double.parseDouble(txtPrecio.getText().replace(",", ".")));
            pstmt.setDouble(6, Double.parseDouble(txtStockMinimo.getText().replace(",", ".")));

            if (esModificacion) {
                pstmt.setInt(7, productoExistente.getId());
            }

            int filasAfectadas = pstmt.executeUpdate();

            if (filasAfectadas > 0) {
                if (esModificacion) {
                    cerrarVentana();
                } else {
                    limpiarCampos();
                    lblMensaje.setText("✅ Producto dado de alta correctamente.");
                    lblMensaje.setStyle("-fx-text-fill: green;");
                }
            }
        } catch (SQLException e) {
            lblMensaje.setText("❌ Error de base de datos.");
            lblMensaje.setStyle("-fx-text-fill: red;");
            e.printStackTrace();
        } catch (NumberFormatException e) {
            lblMensaje.setText("❌ Error: Ingresa números válidos.");
            lblMensaje.setStyle("-fx-text-fill: red;");
        }
    }

    private void cerrarVentana() {
        Stage stage = (Stage) btnCancelar.getScene().getWindow();
        stage.close();
    }

    @FXML
    private void onCancelarClick() {
        cerrarVentana();
    }

    private void limpiarCampos() {
        txtNombre.clear();
        txtStock.clear();
        txtPrecio.clear();
        cbCategoria.setValue(null);
        cbUnidad.setValue("kg");
        txtStockMinimo.setText("2.000");
        txtNombre.requestFocus();
    }

    private boolean existeProductoConNombre(String nombre) {
        if (esModificacion && nombre.equalsIgnoreCase(productoExistente.getNombre())) {
            return false;
        }
        String sql = "SELECT COUNT(*) FROM productos WHERE nombre = ? AND activo = 1";
        try (Connection conn = com.mistressoles.conexion.ConexionDB.conectar(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, nombre);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @FXML
    private void onEmpezarEscritura() {
        lblMensaje.setText("");
    }

    // --- FILTROS ESTRICTOS ---
    private void configurarFiltroStock(TextField campo) {
        UnaryOperator<TextFormatter.Change> filtro = cambio -> {
            String nuevoTexto = cambio.getControlNewText();
            // Permite hasta 3 decimales para pesos en balanza
            if (nuevoTexto.matches("^\\d*([\\.,]\\d{0,3})?$")) {
                return cambio;
            }
            return null;
        };
        campo.setTextFormatter(new TextFormatter<>(filtro));
    }

    private void configurarFiltroPrecio(TextField campo) {
        UnaryOperator<TextFormatter.Change> filtro = cambio -> {
            String nuevoTexto = cambio.getControlNewText();
            // Permite solo 2 decimales para dinero
            if (nuevoTexto.matches("^\\d*([\\.,]\\d{0,2})?$")) {
                return cambio;
            }
            return null;
        };
        campo.setTextFormatter(new TextFormatter<>(filtro));
    }
}
