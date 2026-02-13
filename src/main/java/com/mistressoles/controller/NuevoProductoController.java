package com.mistressoles.controller;

import com.mistressoles.modelos.Producto;
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
    private TextField txtNombre, txtStock, txtPrecio;
    @FXML
    private Button btnCancelar;
    @FXML
    private Label lblMensaje;
    @FXML
    private Button btnGuardar; // Asegúrate que en Scene Builder el ID sea 'btnGuardar'
    private Producto productoExistente; // Para saber qué estamos editando
    private boolean esModificacion = false;

    @Override
    public void initialize(URL url, ResourceBundle rb) {
        configurarFiltroNumerico(txtStock);
        configurarFiltroNumerico(txtPrecio);
    }

    // Método que llamará el Dashboard para pasarnos los datos
    public void setProducto(Producto p) {
        this.productoExistente = p;
        this.esModificacion = true;

        txtNombre.setText(p.getNombre());
        txtStock.setText(String.valueOf(p.getStock()));
        txtPrecio.setText(String.valueOf(p.getPrecio()));

        // Cambiamos el texto del botón si es edición
        btnGuardar.setText("Modificar");
    }

    @FXML
    private void onGuardarClick() {
        // 1. Validaciones de campos vacíos
        if (txtNombre.getText().isEmpty() || txtStock.getText().isEmpty() || txtPrecio.getText().isEmpty()) {
            lblMensaje.setText("⚠️ Completa todos los campos.");
            lblMensaje.setStyle("-fx-text-fill: orange;");
            return;
        }

        // 2. Definimos el SQL según la operación (Nuevo o Modificación)
        String sql;
        if (esModificacion) {
            sql = "UPDATE productos SET nombre = ?, stock_actual = ?, precio_venta = ? WHERE id_producto = ?";
        } else {
            sql = "INSERT INTO productos (nombre, stock_actual, precio_venta) VALUES (?, ?, ?)";
        }

        try (Connection conn = com.mistressoles.conexion.ConexionDB.conectar(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

            // 3. Pasamos los parámetros comunes
            pstmt.setString(1, txtNombre.getText());
            pstmt.setDouble(2, Double.parseDouble(txtStock.getText()));
            pstmt.setDouble(3, Double.parseDouble(txtPrecio.getText()));

            // 4. Si es modificación, agregamos el ID para el WHERE
            if (esModificacion) {
                pstmt.setInt(4, productoExistente.getId());
            }

            int filasAfectadas = pstmt.executeUpdate();

            if (filasAfectadas > 0) {
                if (esModificacion) {
                    // Si es edición, cerramos porque el usuario ya terminó con ese producto
                    System.out.println("✅ Modificación exitosa.");
                    cerrarVentana();
                } else {
                    // Si es un ALTA, solo limpiamos y mostramos el mensaje
                    System.out.println("✅ Alta exitosa.");

                    // Primero limpiamos para que el foco no nos borre el aviso
                    limpiarCampos();

                    // Mostramos el mensaje de éxito que tanto nos costó
                    lblMensaje.setText("El producto ha sido dado de alta correctamente.");
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
    // Método auxiliar para cerrar la ventana

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
        txtNombre.requestFocus();
    }

    @FXML
    private void onEmpezarEscritura() {
        // Vinculado a On Mouse Clicked en Scene Builder
        lblMensaje.setText("");
    }

    private void configurarFiltroNumerico(TextField campo) {
        UnaryOperator<TextFormatter.Change> filtro = cambio -> {
            String nuevoTexto = cambio.getControlNewText();
            if (nuevoTexto.matches("\\d*(\\.\\d*)?")) {
                return cambio;
            }
            return null;
        };
        campo.setTextFormatter(new TextFormatter<>(filtro));
    }
}
