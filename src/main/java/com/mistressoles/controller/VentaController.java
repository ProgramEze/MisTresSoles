/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mistressoles.controller;

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

/**
 *
 * @author long_
 */
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
    @FXML
    private Button btnAgregar;

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

    // --- DATOS ---
    private ObservableList<Producto> listaProductos = FXCollections.observableArrayList();
    private FilteredList<Producto> listaFiltrada;
    private ObservableList<DetalleVenta> listaTicket = FXCollections.observableArrayList();

    @Override
    public void initialize(URL url, ResourceBundle rb) {
        configurarTablas();

        // ESTAS DOS LÍNEAS REEMPLAZAN LO QUE BORRAMOS DEL FXML
        tablaBusqueda.setColumnResizePolicy(TableView.CONSTRAINED_RESIZE_POLICY);
        tablaTicket.setColumnResizePolicy(TableView.CONSTRAINED_RESIZE_POLICY);

        cargarProductos();

        // Buscador en tiempo real
        txtBuscar.textProperty().addListener((obs, oldVal, newVal) -> {
            listaFiltrada.setPredicate(p -> {
                if (newVal == null || newVal.isEmpty()) {
                    return true;
                }
                return p.getNombre().toLowerCase().contains(newVal.toLowerCase());
            });
        });

        // Al hacer doble clic en un producto de la izquierda, poner foco en cantidad
        tablaBusqueda.setOnMouseClicked(e -> {
            if (e.getClickCount() == 2) {
                txtCantidad.requestFocus();
            }
        });

        // Disparar agregarProducto al presionar Enter en cantidad
        txtCantidad.setOnKeyPressed(event -> {
            if (event.getCode() == KeyCode.ENTER) {
                agregarProducto();
            }
        });
    }

    private void configurarTablas() {
        // Tabla Búsqueda
        colBusqNombre.setCellValueFactory(new PropertyValueFactory<>("nombre"));
        colBusqPrecio.setCellValueFactory(new PropertyValueFactory<>("precio"));
        colBusqStock.setCellValueFactory(new PropertyValueFactory<>("stock"));

        // Tabla Ticket
        colTicketProducto.setCellValueFactory(new PropertyValueFactory<>("nombreProducto"));
        colTicketCant.setCellValueFactory(new PropertyValueFactory<>("cantidad"));
        colTicketPrecio.setCellValueFactory(new PropertyValueFactory<>("precioUnitario"));
        colTicketSubtotal.setCellValueFactory(new PropertyValueFactory<>("subtotal"));

        // Bloquear columnas de la tabla de búsqueda
        colBusqNombre.setReorderable(false);
        colBusqPrecio.setReorderable(false);
        colBusqStock.setReorderable(false);

        // Bloquear columnas de la tabla del ticket
        colTicketProducto.setReorderable(false);
        colTicketCant.setReorderable(false);
        colTicketPrecio.setReorderable(false);
        colTicketSubtotal.setReorderable(false);

        tablaTicket.setItems(listaTicket);
    }

    private void cargarProductos() {
        listaProductos.clear();
        String sql = "SELECT * FROM productos WHERE activo = 1";
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

            // Lógica para agregar al ticket (La completamos en el próximo paso)
            listaTicket.add(new DetalleVenta(p, cant));
            actualizarTotal();
            txtCantidad.setText("1");
            txtBuscar.requestFocus(); // Volver al buscador para seguir vendiendo rápido

        } catch (NumberFormatException e) {
            mostrarAlerta("Ingresa una cantidad válida.");
        }
    }

    private void actualizarTotal() {
        double total = listaTicket.stream().mapToDouble(DetalleVenta::getSubtotal).sum();
        lblTotal.setText(String.format("$ %.2f", total));
    }

    @FXML
    private void finalizarVenta() {
        // 1. Validamos que haya algo que cobrar
        if (listaTicket.isEmpty()) {
            mostrarAlerta("El carrito está vacío, Eze.");
            return;
        }

        // 2. Calculamos el total final sumando la columna de subtotales
        double totalVenta = listaTicket.stream().mapToDouble(DetalleVenta::getSubtotal).sum();

        // 3. Preparamos las sentencias SQL
        String sqlVenta = "INSERT INTO ventas (total) VALUES (?)";
        String sqlDetalle = "INSERT INTO detalle_ventas (id_venta, id_producto, cantidad, precio_unitario, subtotal) VALUES (?, ?, ?, ?, ?)";
        // ¡OJO ACÁ! Esta línea es la que hace la magia de bajar el stock:
        String sqlStock = "UPDATE productos SET stock_actual = stock_actual - ? WHERE id_producto = ?";

        try (Connection conn = ConexionDB.conectar()) {
            // INICIO DE TRANSACCIÓN: Desactivamos el guardado automático para seguridad
            conn.setAutoCommit(false);

            try {
                // PASO A: Guardar la Cabecera (El total del ticket)
                PreparedStatement pstmtVenta = conn.prepareStatement(sqlVenta, Statement.RETURN_GENERATED_KEYS);
                pstmtVenta.setDouble(1, totalVenta);
                pstmtVenta.executeUpdate();

                // Recuperamos el ID del ticket recién creado (ej: Ticket #50)
                ResultSet rsKeys = pstmtVenta.getGeneratedKeys();
                int idVenta = 0;
                if (rsKeys.next()) {
                    idVenta = rsKeys.getInt(1);
                } else {
                    throw new SQLException("Error al generar el ID de venta.");
                }

                // PASO B: Guardar cada producto y descontar stock
                PreparedStatement pstmtDetalle = conn.prepareStatement(sqlDetalle);
                PreparedStatement pstmtStock = conn.prepareStatement(sqlStock);

                for (DetalleVenta dv : listaTicket) {
                    // 1. Guardamos el detalle
                    pstmtDetalle.setInt(1, idVenta);
                    pstmtDetalle.setInt(2, dv.getProducto().getId());
                    pstmtDetalle.setDouble(3, dv.getCantidad());
                    pstmtDetalle.setDouble(4, dv.getPrecioUnitario());
                    pstmtDetalle.setDouble(5, dv.getSubtotal());
                    pstmtDetalle.addBatch(); // Agregamos al paquete

                    // 2. Restamos el stock (Cantidad vendida se resta al actual)
                    pstmtStock.setDouble(1, dv.getCantidad());
                    pstmtStock.setInt(2, dv.getProducto().getId());
                    pstmtStock.addBatch(); // Agregamos al paquete
                }

                // Ejecutamos todos los cambios juntos
                pstmtDetalle.executeBatch();
                pstmtStock.executeBatch();

                // CONFIRMACIÓN (COMMIT): Si llegamos acá, guardamos todo de verdad
                conn.commit();

                // Avisamos y limpiamos
                mostrarInformacion("✅ ¡Venta registrada! Total: $" + totalVenta);
                listaTicket.clear();
                lblTotal.setText("$ 0.00");
                txtBuscar.requestFocus();

                // Recargamos la tabla de la izquierda para ver que el stock bajó
                cargarProductos();

            } catch (SQLException e) {
                // Si algo falló, deshacemos todo (ROLLBACK) para no dejar datos corruptos
                conn.rollback();
                e.printStackTrace();
                mostrarAlerta("❌ Error crítico: No se guardó nada.");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @FXML
    private void limpiarBuscador() {
        txtBuscar.clear();
        txtBuscar.requestFocus(); // Devuelve el cursor al buscador para seguir tecleando
    }

    private void mostrarInformacion(String msg) {
        Alert alert = new Alert(Alert.AlertType.INFORMATION);
        alert.setTitle("Éxito");
        alert.setHeaderText(null);
        alert.setContentText(msg);
        alert.showAndWait();
    }

    private void mostrarAlerta(String msg) {
        Alert alert = new Alert(Alert.AlertType.WARNING);
        alert.setTitle("Atención");
        alert.setHeaderText(null);
        alert.setContentText(msg);
        alert.showAndWait();
    }

    @FXML
    private void cancelarVenta() {
        listaTicket.clear();
        actualizarTotal();
    }
}
