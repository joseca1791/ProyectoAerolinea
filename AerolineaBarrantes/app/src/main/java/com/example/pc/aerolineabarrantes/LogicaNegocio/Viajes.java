package com.example.pc.aerolineabarrantes.LogicaNegocio;

public class Viajes {

    private String codigo;
    private String fecha;
    private int vendidos;
    Vuelos vuelo;
    Aviones avion;

    public Viajes(String codigo, String fecha, int vendidos, Vuelos vuelo, Aviones avion) {
        this.codigo = codigo;
        this.fecha = fecha;
        this.vendidos = vendidos;
        this.vuelo = vuelo;
        this.avion = avion;
    }

    public Viajes() {
    }

    @Override
    public String toString() {
        return "Viajes{" +
                "codigo='" + codigo + '\'' +
                ", fecha='" + fecha + '\'' +
                ", vendidos=" + vendidos +
                ", vuelo=" + vuelo +
                ", avion=" + avion +
                '}';
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public int getVendidos() {
        return vendidos;
    }

    public void setVendidos(int vendidos) {
        this.vendidos = vendidos;
    }

    public Vuelos getVuelo() {
        return vuelo;
    }

    public void setVuelo(Vuelos vuelo) {
        this.vuelo = vuelo;
    }

    public Aviones getAvion() {
        return avion;
    }

    public void setAvion(Aviones avion) {
        this.avion = avion;
    }
}
