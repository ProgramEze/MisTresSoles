package com.mistressoles.modelos;

/**
 * Clase Modelo que representa un producto de "Mis Tres Soles".
 */
public class Producto {
    private int id;
    private String nombre;
    private String categoria;
    private double stock;
    private String unidadMedida; // 'kg' o 'unid'
    private double precio;
    private double stockMinimo;
    private String imagenPath;
    private boolean activo;

    // Constructor completo actualizado
    public Producto(int id, String nombre, String categoria, double stock, String unidadMedida, double precio, double stockMinimo, String imagenPath) {
        this.id = id;
        this.nombre = nombre;
        this.categoria = categoria;
        this.stock = stock;
        this.unidadMedida = unidadMedida;
        this.precio = precio;
        this.stockMinimo = stockMinimo;
        this.imagenPath = imagenPath;
    }

    // --- GETTERS ---
    public int getId() { return id; }
    public String getNombre() { return nombre; }
    public String getCategoria() { return categoria; }
    public double getStock() { return stock; }
    public String getUnidadMedida() { return unidadMedida; }
    public double getPrecio() { return precio; }
    public double getStockMinimo() { return stockMinimo; }
    public String getImagenPath() { return imagenPath; }
    public boolean isActivo(){ return activo; }

    // --- SETTERS ---
    public void setId(int id) { this.id = id; }
    public void setNombre(String nombre) { this.nombre = nombre; }
    public void setCategoria(String categoria) { this.categoria = categoria; }
    public void setStock(double stock) { this.stock = stock; }
    public void setUnidadMedida(String unidadMedida) { this.unidadMedida = unidadMedida; }
    public void setPrecio(double precio) { this.precio = precio; }
    public void setStockMinimo(double stockMinimo) { this.stockMinimo = stockMinimo; }
    public void setImagenPath(String imagenPath) { this.imagenPath = imagenPath; }
    public void setActivo(boolean activo) { this.activo = activo; }
}