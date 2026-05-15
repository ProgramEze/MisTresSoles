package com.mistressoles.conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;

/**
 *
 * @author long_
 */
public class ConexionDB {

    private static Connection conn = null;
    // Como el archivo está en la raíz del proyecto, solo ponemos el nombre
    private static final String URL = "jdbc:sqlite:mistressoles.db";

    public static Connection conectar() {
        try {
            if (conn == null || conn.isClosed()) {
                conn = DriverManager.getConnection(URL);
                System.out.println("✅ Conexión a Mis Tres Soles exitosa.");
            }
        } catch (SQLException e) {
            System.err.println("❌ Error al conectar: " + e.getMessage());
        }
        return conn;
    }

// ... dentro de la clase ConexionDB ...
    public static void main(String[] args) {
        Connection c = conectar();
        if (c != null) {
            try {
                // 1. Creamos la sentencia para ejecutar SQL
                Statement stmt = c.createStatement();

                // 2. Ejecutamos la consulta a la tabla que creamos en el DB Browser
                String sql = "SELECT nombre, stock_actual, unidad_medida FROM productos";
                ResultSet rs = stmt.executeQuery(sql);

                System.out.println("\n--- LISTA DE PRODUCTOS EN STOCK ---");

                // 3. Recorremos los resultados
                while (rs.next()) {
                    String nombre = rs.getString("nombre");
                    double stock = rs.getDouble("stock_actual");
                    String unidad = rs.getString("unidad_medida");

                    System.out.println("-> " + nombre + ": " + stock + " " + unidad);
                }

                System.out.println("-----------------------------------\n");

            } catch (SQLException e) {
                System.err.println("❌ Error al leer datos: " + e.getMessage());
            }
        }
    }
}
