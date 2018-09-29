package com.example.pc.aerolineabarrantes.LogicaNegocio;

public class Aviones {


    private String codigo_Avion;
    private String modelo;
    private int capacidad;

    public Aviones(String codigo_Avion, String modelo, int capacidad) {
        this.codigo_Avion = codigo_Avion;
        this.modelo = modelo;
        this.capacidad = capacidad;
    }

    public Aviones() {
    }

    @Override
    public String toString() {
        return "Aviones{" +
                "codigo_Avion='" + codigo_Avion + '\'' +
                ", modelo='" + modelo + '\'' +
                ", capacidad=" + capacidad +
                '}';
    }

    public String getCodigo_Avion() {
        return codigo_Avion;
    }

    public void setCodigo_Avion(String codigo_Avion) {
        this.codigo_Avion = codigo_Avion;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public int getCapacidad() {
        return capacidad;
    }

    public void setCapacidad(int capacidad) {
        this.capacidad = capacidad;
    }


}




