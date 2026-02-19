/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mistressoles.modelos;

/**
 *
 * @author long_
 */

public class DetalleVenta {
    private Producto producto;
    private double cantidad;
    private double subtotal;

    public DetalleVenta(Producto producto, double cantidad) {
        this.producto = producto;
        this.cantidad = cantidad;
        this.actualizarSubtotal();
    }

    private void actualizarSubtotal() {
        this.subtotal = this.producto.getPrecio() * this.cantidad;
    }

    // Getters necesarios para la Tabla (JavaFX los busca por nombre)
    public String getNombreProducto() { return producto.getNombre(); }
    public double getPrecioUnitario() { return producto.getPrecio(); }
    public double getCantidad() { return cantidad; }
    public void setCantidad(double cantidad) { 
        this.cantidad = cantidad; 
        actualizarSubtotal(); // Recalcular si cambiamos la cantidad
    }
    public double getSubtotal() { return subtotal; }
    public Producto getProducto() { return producto; }
}
