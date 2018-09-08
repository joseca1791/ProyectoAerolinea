/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelaerolineabarrantes;

/**
 *
 * @author Jose Carlos
 */
public class Viajes {
    String codigo;
    Vuelos vuelo;
    Aviones avion;
    String fecha;
    int vendidos;

    public Viajes(String codigo, Vuelos vuelo, Aviones avion, String fecha, int vendidos) {
        this.codigo = codigo;
        this.vuelo = vuelo;
        this.avion = avion;
        this.fecha = fecha;
        this.vendidos = vendidos;
    }

    public Viajes() {
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
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
}
