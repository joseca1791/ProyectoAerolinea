package com.example.pc.aerolineabarrantes.LogicaNegocio;

public class Vuelos {


    private String codigo;
    private int precio;
    private String tiempo;
    private int promo;
    Ciudades origen;
    Ciudades destino;

    public Vuelos(String codigo, int precio, String tiempo, int promo, Ciudades origen, Ciudades destino) {
        this.codigo = codigo;
        this.precio = precio;
        this.tiempo = tiempo;
        this.promo = promo;
        this.origen = origen;
        this.destino = destino;
    }

    public Vuelos() {
    }

    @Override
    public String toString() {
        return "Vuelos{" +
                "codigo='" + codigo + '\'' +
                ", precio=" + precio +
                ", tiempo='" + tiempo + '\'' +
                ", promo=" + promo +
                ", origen=" + origen +
                ", destino=" + destino +
                '}';
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public int getPrecio() {
        return precio;
    }

    public void setPrecio(int precio) {
        this.precio = precio;
    }

    public String getTiempo() {
        return tiempo;
    }

    public void setTiempo(String tiempo) {
        this.tiempo = tiempo;
    }

    public int getPromo() {
        return promo;
    }

    public void setPromo(int promo) {
        this.promo = promo;
    }

    public Ciudades getOrigen() {
        return origen;
    }

    public void setOrigen(Ciudades origen) {
        this.origen = origen;
    }

    public Ciudades getDestino() {
        return destino;
    }

    public void setDestino(Ciudades destino) {
        this.destino = destino;
    }
}
