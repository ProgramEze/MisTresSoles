package com.mistressoles.controller;

import com.mistressoles.conexion.ConexionDB;
import com.mistressoles.modelos.Movimiento;
import javafx.animation.PauseTransition;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.collections.transformation.SortedList;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.*;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.paint.Color;
import javafx.util.Duration;

import java.net.URL;
import java.sql.*;
import java.time.LocalDate;
import java.util.Optional;
import java.util.ResourceBundle;

public class MovimientoController implements Initializable {

    @FXML
    private Label lblTotalIngresos;
    @FXML
    private Label lblTotalGastos;
    @FXML
    private Label lblGananciaNeta;

    // Filtros superiores
    @FXML
    private DatePicker dpDesde;
    @FXML
    private DatePicker dpHasta;
    @FXML
    private TextField txtBuscarConcepto;
    @FXML
    private ComboBox<String> cbFiltroTipo;
    @FXML
    private ComboBox<String> cbFiltroCategoria;
    @FXML
    private CheckBox chkOcultarAnulados; // NUEVO

    // Formulario lateral
    @FXML
    private ComboBox<String> cbTipo;
    @FXML
    private TextField txtConcepto;
    @FXML
    private TextField txtMonto;
    @FXML
    private ComboBox<String> cbCategoria;
    @FXML
    private Label lblMensajeForm;

    @FXML
    private TableView<Movimiento> tablaMovimientos;
    @FXML
    private TableColumn<Movimiento, String> colFecha;
    @FXML
    private TableColumn<Movimiento, String> colTipo;
    @FXML
    private TableColumn<Movimiento, String> colConcepto;
    @FXML
    private TableColumn<Movimiento, String> colCategoria;
    @FXML
    private TableColumn<Movimiento, Double> colMonto;

    private ObservableList<Movimiento> listaMovimientos = FXCollections.observableArrayList();

    @Override
    public void initialize(URL url, ResourceBundle rb) {
        configurarFiltroMonto();
        llenarCombos();
        configurarTabla();

        // Listeners para filtrado automático en tiempo real
        txtBuscarConcepto.textProperty().addListener((obs, oldVal, newVal) -> aplicarFiltros());
        cbFiltroTipo.valueProperty().addListener((obs, oldVal, newVal) -> aplicarFiltros());
        cbFiltroCategoria.valueProperty().addListener((obs, oldVal, newVal) -> aplicarFiltros());
        dpDesde.valueProperty().addListener((obs, oldVal, newVal) -> aplicarFiltros());
        dpHasta.valueProperty().addListener((obs, oldVal, newVal) -> aplicarFiltros());
        chkOcultarAnulados.selectedProperty().addListener((obs, oldVal, newVal) -> aplicarFiltros()); // NUEVO

        aplicarFiltros();
    }

    private void configurarFiltroMonto() {
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
        cbTipo.setItems(FXCollections.observableArrayList("GASTO", "INGRESO"));
        cbTipo.setValue("GASTO");

        ObservableList<String> categoriasForm = FXCollections.observableArrayList(
                "Seleccione una categoría...", "Mercadería", "Servicios (Luz, Agua)", "Sueldos", "Mantenimiento", "Aporte de Capital", "Otros", "Ventas"
        );
        cbCategoria.setItems(categoriasForm);
        cbCategoria.setValue("Seleccione una categoría...");

        cbFiltroTipo.setItems(FXCollections.observableArrayList("Todos", "GASTO", "INGRESO"));
        cbFiltroTipo.setValue("Todos");

        ObservableList<String> categoriasFiltro = FXCollections.observableArrayList("Todas");
        categoriasFiltro.addAll("Mercadería", "Servicios (Luz, Agua)", "Sueldos", "Mantenimiento", "Aporte de Capital", "Otros", "Ventas");
        cbFiltroCategoria.setItems(categoriasFiltro);
        cbFiltroCategoria.setValue("Todas");
    }

    private void configurarTabla() {
        colFecha.setCellValueFactory(new PropertyValueFactory<>("fecha"));
        colTipo.setCellValueFactory(new PropertyValueFactory<>("tipo"));
        colConcepto.setCellValueFactory(new PropertyValueFactory<>("concepto"));
        colCategoria.setCellValueFactory(new PropertyValueFactory<>("categoria"));
        colMonto.setCellValueFactory(new PropertyValueFactory<>("monto"));

        colFecha.setReorderable(false);
        colTipo.setReorderable(false);
        colConcepto.setReorderable(false);
        colCategoria.setReorderable(false);
        colMonto.setReorderable(false);

        tablaMovimientos.setColumnResizePolicy(TableView.CONSTRAINED_RESIZE_POLICY);

        colMonto.setCellFactory(c -> new TableCell<Movimiento, Double>() {
            @Override
            protected void updateItem(Double monto, boolean empty) {
                super.updateItem(monto, empty);
                if (empty || monto == null) {
                    setText(null);
                } else {
                    setText(String.format("$ %.2f", monto));
                }
            }
        });

        // --- ROW FACTORY CON MENÚ CONTEXTUAL INTEGRADO ---
        tablaMovimientos.setRowFactory(tv -> {
            TableRow<Movimiento> row = new TableRow<Movimiento>() {
                @Override
                protected void updateItem(Movimiento item, boolean empty) {
                    super.updateItem(item, empty);
                    if (item == null || empty) {
                        setStyle("");
                    } else if (item.getConcepto().startsWith("[ANULADO]")) {
                        setStyle("-fx-background-color: #e0e0e0; -fx-text-inner-color: #9e9e9e;");
                    } else {
                        setStyle("");
                    }
                }
            };

            ContextMenu contextMenu = new ContextMenu();
            MenuItem miAnular = new MenuItem("🚫 Anular Movimiento");
            miAnular.setOnAction(e -> {
                tablaMovimientos.getSelectionModel().select(row.getItem());
                anularMovimiento();
            });
            contextMenu.getItems().add(miAnular);

            row.contextMenuProperty().bind(
                    javafx.beans.binding.Bindings.when(row.emptyProperty())
                            .then((ContextMenu) null)
                            .otherwise(contextMenu)
            );

            return row;
        });

        SortedList<Movimiento> listaOrdenada = new SortedList<>(listaMovimientos);
        listaOrdenada.comparatorProperty().bind(tablaMovimientos.comparatorProperty());
        tablaMovimientos.setItems(listaOrdenada);
    }

    @FXML
    private void aplicarFiltros() {
        if (txtBuscarConcepto == null || cbFiltroTipo == null) {
            return;
        }

        LocalDate desde = dpDesde.getValue();
        LocalDate hasta = dpHasta.getValue();

        calcularTotalesPorFecha(desde, hasta);

        StringBuilder sql = new StringBuilder("SELECT * FROM movimientos WHERE 1=1 ");

        if (desde != null) {
            sql.append(" AND date(fecha) >= '").append(desde).append("'");
        }
        if (hasta != null) {
            sql.append(" AND date(fecha) <= '").append(hasta).append("'");
        }

        String buscar = txtBuscarConcepto.getText() != null ? txtBuscarConcepto.getText().trim().replace("'", "''") : "";
        if (!buscar.isEmpty()) {
            sql.append(" AND concepto LIKE '%").append(buscar).append("%'");
        }

        String tipo = cbFiltroTipo.getValue();
        if (tipo != null && !tipo.equals("Todos")) {
            sql.append(" AND tipo = '").append(tipo).append("'");
        }

        String categoria = cbFiltroCategoria.getValue();
        if (categoria != null && !categoria.equals("Todas")) {
            sql.append(" AND categoria_contable = '").append(categoria).append("'");
        }

        // --- NUEVO FILTRO PARA OCULTAR ANULADOS ---
        if (chkOcultarAnulados.isSelected()) {
            sql.append(" AND concepto NOT LIKE '[ANULADO]%'");
        }

        sql.append(" ORDER BY fecha DESC LIMIT 200");
        cargarMovimientos(sql.toString());
    }

    private void calcularTotalesPorFecha(LocalDate desde, LocalDate hasta) {
        double ingresos = 0;
        double gastos = 0;

        StringBuilder sql = new StringBuilder("SELECT tipo, SUM(monto) as total FROM movimientos WHERE concepto NOT LIKE '[ANULADO]%'");

        if (desde != null) {
            sql.append(" AND date(fecha) >= '").append(desde).append("'");
        }
        if (hasta != null) {
            sql.append(" AND date(fecha) <= '").append(hasta).append("'");
        }

        sql.append(" GROUP BY tipo");

        try (Connection conn = ConexionDB.conectar(); Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(sql.toString())) {

            while (rs.next()) {
                String tipo = rs.getString("tipo");
                double total = rs.getDouble("total");

                if (tipo.contains("INGRESO")) {
                    ingresos += total;
                } else {
                    gastos += total;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        lblTotalIngresos.setText(String.format("$ %.2f", ingresos));
        lblTotalGastos.setText(String.format("$ %.2f", gastos));
        double ganancia = ingresos - gastos;
        lblGananciaNeta.setText(String.format("$ %.2f", ganancia));
        lblGananciaNeta.setTextFill(ganancia < 0 ? Color.RED : Color.web("#1565c0"));
    }

    private void cargarMovimientos(String sql) {
        listaMovimientos.clear();

        try (Connection conn = ConexionDB.conectar(); Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(sql)) {

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
    private void limpiarFiltros() {
        dpDesde.setValue(null);
        dpHasta.setValue(null);
        txtBuscarConcepto.clear();
        cbFiltroTipo.setValue("Todos");
        cbFiltroCategoria.setValue("Todas");
        chkOcultarAnulados.setSelected(true); // Restablecemos el check a su valor por defecto
    }

    @FXML
    private void guardarMovimiento() {
        if (cbTipo.getValue() == null || txtConcepto.getText().trim().isEmpty()
                || txtMonto.getText().isEmpty() || cbCategoria.getValue() == null
                || cbCategoria.getValue().equals("Seleccione una categoría...")) {

            mostrarAlerta("Completa todos los campos del formulario.", Alert.AlertType.WARNING);
            return;
        }

        boolean guardadoExitoso = false;

        try {
            double monto = Double.parseDouble(txtMonto.getText().replace(",", "."));
            if (monto <= 0) {
                mostrarAlerta("El monto debe ser mayor a cero.", Alert.AlertType.WARNING);
                return;
            }

            String sql = "INSERT INTO movimientos (tipo, concepto, monto, categoria_contable) VALUES (?, ?, ?, ?)";

            try (Connection conn = ConexionDB.conectar(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setString(1, cbTipo.getValue());
                pstmt.setString(2, txtConcepto.getText().trim());
                pstmt.setDouble(3, monto);
                pstmt.setString(4, cbCategoria.getValue());
                pstmt.executeUpdate();

                guardadoExitoso = true;
            }
        } catch (NumberFormatException | SQLException e) {
            mostrarAlerta("Error al procesar el monto o guardar en BD.", Alert.AlertType.ERROR);
        }

        if (guardadoExitoso) {
            mostrarMensajeExito("✅ Registro guardado.");
            limpiarFormulario();
            aplicarFiltros();
        }
    }

    private void anularMovimiento() {
        Movimiento seleccionado = tablaMovimientos.getSelectionModel().getSelectedItem();
        if (seleccionado == null) {
            mostrarAlerta("Selecciona un movimiento para anular.", Alert.AlertType.WARNING);
            return;
        }

        if (seleccionado.getConcepto().startsWith("[ANULADO]")) {
            mostrarAlerta("Este movimiento ya está anulado.", Alert.AlertType.INFORMATION);
            return;
        }

        Alert confirm = new Alert(Alert.AlertType.CONFIRMATION);
        confirm.setTitle("Anular Movimiento");
        confirm.setHeaderText("Vas a anular: " + seleccionado.getConcepto());
        confirm.setContentText("Esta acción marcará el registro como anulado y descontará el saldo. ¿Continuar?");

        Optional<ButtonType> result = confirm.showAndWait();
        if (result.isPresent() && result.get() == ButtonType.OK) {
            String sql = "UPDATE movimientos SET concepto = ? WHERE id_movimiento = ?";
            try (Connection conn = ConexionDB.conectar(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setString(1, "[ANULADO] " + seleccionado.getConcepto());
                pstmt.setInt(2, seleccionado.getId());
                pstmt.executeUpdate();

                aplicarFiltros();
                mostrarMensajeExito("🚫 Movimiento anulado.");
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    private void limpiarFormulario() {
        cbTipo.setValue("GASTO");
        txtConcepto.clear();
        txtMonto.clear();
        cbCategoria.setValue("Seleccione una categoría...");
    }

    private void mostrarMensajeExito(String msg) {
        lblMensajeForm.setText(msg);
        lblMensajeForm.setTextFill(Color.GREEN);
        PauseTransition pause = new PauseTransition(Duration.seconds(4));
        pause.setOnFinished(event -> lblMensajeForm.setText(""));
        pause.play();
    }

    private void mostrarAlerta(String msg, Alert.AlertType tipo) {
        Alert alert = new Alert(tipo);
        alert.setTitle("Atención");
        alert.setHeaderText(null);
        alert.setContentText(msg);
        alert.showAndWait();
    }
}
