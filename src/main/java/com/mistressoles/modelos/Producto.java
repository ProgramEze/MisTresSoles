package com.mistressoles.modelos;

/**
 * Clase Modelo que representa un producto de "Mis Tres Soles".
 * @author Ezequiel
 */
public class Producto {
    // Atributos que coinciden con tu script de SQLite
    private int id;
    private String nombre;
    private double stock; // Usamos double por el tipo REAL en la BD
    private double precio;

    // Constructor para inicializar el objeto con los datos de la consulta SQL
    public Producto(int id, String nombre, double stock, double precio) {
        this.id = id;
        this.nombre = nombre;
        this.stock = stock;
        this.precio = precio;
    }

    /**
     * GETTERS: Son obligatorios para que JavaFX pueda mostrar 
     * los datos en las columnas de la tabla.
     * @return 
     */
    public int getId() {
        return id;
    }

    public String getNombre() {
        return nombre;
    }

    public double getStock() {
        return stock;
    }

    public double getPrecio() {
        return precio;
    }

    // SETTERS: Útiles para futuras actualizaciones de stock o precio
    public void setId(int id) { this.id = id; }
    public void setNombre(String nombre) { this.nombre = nombre; }
    public void setStock(double stock) { this.stock = stock; }
    public void setPrecio(double precio) { this.precio = precio; }
}