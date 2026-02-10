package com.mistressoles.controller;

import java.net.URL;
import java.sql.*;
import java.util.ResourceBundle;
import java.util.function.UnaryOperator;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.scene.control.TextFormatter;
import javafx.stage.Stage;

public class NuevoProductoController implements Initializable {

    @FXML
    private TextField txtNombre;
    @FXML
    private TextField txtStock;
    @FXML
    private TextField txtPrecio;
    @FXML
    private Button btnGuardar;
    @FXML
    private Button btnCancelar;
    @FXML 
    private Label lblMensaje; // El nuevo label

    @Override
    public void initialize(URL url, ResourceBundle rb) {
        // Aplicamos los filtros apenas se crea la vista
        configurarFiltroNumerico(txtStock);
        configurarFiltroNumerico(txtPrecio);
    }

    @FXML
    private void onGuardarClick() {
        // 1. Validación (Esto se queda igual)
        lblMensaje.setText("Procesando..."); // Línea de prueba
        lblMensaje.setStyle("-fx-text-fill: blue;");
        if (txtNombre.getText().isEmpty() || txtStock.getText().isEmpty() || txtPrecio.getText().isEmpty()) {
            lblMensaje.setText("⚠️ Completa todos los campos.");
            lblMensaje.setStyle("-fx-text-fill: orange;");
            return;
        }

        String sql = "INSERT INTO productos (nombre, stock_actual, precio_venta) VALUES (?, ?, ?)";

        try (Connection conn = com.mistressoles.conexion.ConexionDB.conectar(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, txtNombre.getText());
            pstmt.setDouble(2, Double.parseDouble(txtStock.getText()));
            pstmt.setDouble(3, Double.parseDouble(txtPrecio.getText()));

            pstmt.executeUpdate();

            // --- EL CAMBIO ESTÁ AQUÍ ---
            // Primero limpiamos los cuadros de texto
            limpiarCampos();

            // Luego ponemos el mensaje de éxito (al final para que no se borre)
            lblMensaje.setText("El producto ha sido dado de alta correctamente.");
            lblMensaje.setStyle("-fx-text-fill: green;");

            System.out.println("✅ Producto cargado con éxito.");

        } catch (SQLException e) {
            lblMensaje.setText("❌ Error al guardar en la base de datos.");
            lblMensaje.setStyle("-fx-text-fill: red;");
        } catch (NumberFormatException e) {
            lblMensaje.setText("❌ Error: Datos numéricos inválidos.");
            lblMensaje.setStyle("-fx-text-fill: red;");
        }
    }

    @FXML
    private void onCancelarClick() {
        // Cerramos la ventanita
        Stage stage = (Stage) btnCancelar.getScene().getWindow();
        stage.close();
    }

    @FXML
    private void limpiarCampos() {
        txtNombre.clear();
        txtStock.clear();
        txtPrecio.clear();
        txtNombre.requestFocus();
    }

    @FXML
    private void onEmpezarEscritura() {
        // En cuanto el usuario toca una tecla para el nuevo producto, borramos el aviso anterior
        if (!lblMensaje.getText().isEmpty()) {
            lblMensaje.setText("");
        }
    }

    private void configurarFiltroNumerico(TextField campo) {
        // Este filtro solo permite números y UN punto decimal
        UnaryOperator<TextFormatter.Change> filtro = cambio -> {
            String nuevoTexto = cambio.getControlNewText();
            if (nuevoTexto.matches("\\d*(\\.\\d*)?")) {
                return cambio;
            }
            return null; // Si no es número o punto, ignora la tecla presionada
        };

        campo.setTextFormatter(new TextFormatter<>(filtro));
    }
}
