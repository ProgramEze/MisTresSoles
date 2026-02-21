/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mistressoles.modelos;

/**
 *
 * @author long_
 */
public class Movimiento {
    private int id;
    private String tipo;
    private String concepto;
    private double monto;
    private String fecha;
    private String categoria;

    public Movimiento(int id, String tipo, String concepto, double monto, String fecha, String categoria) {
        this.id = id;
        this.tipo = tipo;
        this.concepto = concepto;
        this.monto = monto;
        this.fecha = fecha;
        this.categoria = categoria;
    }

    public int getId() { return id; }
    public String getTipo() { return tipo; }
    public String getConcepto() { return concepto; }
    public double getMonto() { return monto; }
    public String getFecha() { return fecha; }
    public String getCategoria() { return categoria; }
}