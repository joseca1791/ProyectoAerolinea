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
public class Vuelos {

    public Vuelos(String codigo, Ciudades origen, Ciudades destino, int precio, String tiempo, int promo) {
        this.codigo = codigo;
        this.origen = origen;
        this.destino = destino;
        this.precio = precio;
        this.tiempo = tiempo;
        this.promo = promo;
    }

    public Vuelos() {
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
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
   public String codigo;
   public Ciudades origen;
   public Ciudades destino;
   int precio;
   String tiempo;
   int promo;
}
