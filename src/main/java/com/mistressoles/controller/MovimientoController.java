/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mistressoles.controller;

import com.mistressoles.conexion.ConexionDB;
import com.mistressoles.modelos.Movimiento;
import javafx.animation.PauseTransition;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.*;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.paint.Color;
import javafx.util.Duration;
import java.net.URL;
import java.sql.*;
import java.util.ResourceBundle;
/**
 *
 * @author long_
 */
public class MovimientoController implements Initializable {

    // --- FORMULARIO ---
    @FXML private ComboBox<String> cbTipo;
    @FXML private TextField txtConcepto;
    @FXML private TextField txtMonto;
    @FXML private ComboBox<String> cbCategoria;
    @FXML private Label lblMensajeForm;

    // --- TABLA ---
    @FXML private TableView<Movimiento> tablaMovimientos;
    @FXML private TableColumn<Movimiento, String> colFecha;
    @FXML private TableColumn<Movimiento, String> colTipo;
    @FXML private TableColumn<Movimiento, String> colConcepto;
    @FXML private TableColumn<Movimiento, String> colCategoria;
    @FXML private TableColumn<Movimiento, Double> colMonto;

    private ObservableList<Movimiento> listaMovimientos = FXCollections.observableArrayList();

    @Override
    public void initialize(URL url, ResourceBundle rb) {
        configurarFiltroMonto();
        llenarCombos();
        configurarTabla();
        cargarMovimientos();
    }

    private void configurarFiltroMonto() {
        // Mismo filtro de 2 decimales que usamos en Ventas
        java.util.function.UnaryOperator<TextFormatter.Change> filtro = change -> {
            String textoNuevo = change.getControlNewText();
            if (textoNuevo.matches("^\\d*([\\.,]\\d{0,2})?$")) {
                return change;
            }
            return null;
        };
        txtMonto.setTextFormatter(new TextFormatter<>(filtro));
    }

    private void llenarCombos() {
        cbTipo.setItems(FXCollections.observableArrayList("INGRESO", "GASTO"));
        cbCategoria.setItems(FXCollections.observableArrayList(
            "Mercadería", "Servicios (Luz, Agua)", "Sueldos", "Mantenimiento", "Otros"
        ));
    }

    private void configurarTabla() {
        colFecha.setCellValueFactory(new PropertyValueFactory<>("fecha"));
        colTipo.setCellValueFactory(new PropertyValueFactory<>("tipo"));
        colConcepto.setCellValueFactory(new PropertyValueFactory<>("concepto"));
        colCategoria.setCellValueFactory(new PropertyValueFactory<>("categoria"));
        colMonto.setCellValueFactory(new PropertyValueFactory<>("monto"));

        tablaMovimientos.setColumnResizePolicy(TableView.CONSTRAINED_RESIZE_POLICY);
        tablaMovimientos.setItems(listaMovimientos);
    }

    private void cargarMovimientos() {
        listaMovimientos.clear();
        String sql = "SELECT * FROM movimientos ORDER BY fecha DESC LIMIT 100"; 
        
        try (Connection conn = ConexionDB.conectar();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                listaMovimientos.add(new Movimiento(
                    rs.getInt("id_movimiento"),
                    rs.getString("tipo"),
                    rs.getString("concepto"),
                    rs.getDouble("monto"),
                    rs.getString("fecha"),
                    rs.getString("categoria_contable")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @FXML
    private void guardarMovimiento() {
        // Validaciones básicas
        if (cbTipo.getValue() == null || txtConcepto.getText().trim().isEmpty() || 
            txtMonto.getText().isEmpty() || cbCategoria.getValue() == null) {
            mostrarAlerta("Por favor, completa todos los campos del formulario.");
            return;
        }

        try {
            double monto = Double.parseDouble(txtMonto.getText().replace(",", "."));
            if (monto <= 0) {
                mostrarAlerta("El monto debe ser mayor a cero.");
                return;
            }

            String sql = "INSERT INTO movimientos (tipo, concepto, monto, categoria_contable) VALUES (?, ?, ?, ?)";
            
            try (Connection conn = ConexionDB.conectar();
                 PreparedStatement pstmt = conn.prepareStatement(sql)) {
                
                pstmt.setString(1, cbTipo.getValue());
                pstmt.setString(2, txtConcepto.getText().trim());
                pstmt.setDouble(3, monto);
                pstmt.setString(4, cbCategoria.getValue());
                
                pstmt.executeUpdate();
                
                mostrarMensajeExito("✅ Registro guardado correctamente.");
                limpiarFormulario();
                cargarMovimientos(); // Recargar la tabla
                
            } catch (SQLException e) {
                e.printStackTrace();
                mostrarAlerta("Error al guardar en la base de datos.");
            }

        } catch (NumberFormatException e) {
            mostrarAlerta("Monto inválido.");
        }
    }

    private void limpiarFormulario() {
        cbTipo.setValue(null);
        txtConcepto.clear();
        txtMonto.clear();
        cbCategoria.setValue(null);
    }

    private void mostrarMensajeExito(String msg) {
        lblMensajeForm.setText(msg);
        lblMensajeForm.setTextFill(Color.GREEN);
        PauseTransition pause = new PauseTransition(Duration.seconds(4));
        pause.setOnFinished(event -> lblMensajeForm.setText(""));
        pause.play();
    }

    private void mostrarAlerta(String msg) {
        Alert alert = new Alert(Alert.AlertType.WARNING);
        alert.setTitle("Atención");
        alert.setHeaderText(null);
        alert.setContentText(msg);
        alert.showAndWait();
    }
}