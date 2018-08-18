/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloNegocio;

/**
 *
 * @author Jose Carlos
 */
public class Viaje extends java.util.Observable implements Jsonable{
    
    String codigo;
    Vuelo vuelo;
    Avion avion;
    String fecha;
    int vendidas;

    
    public Viaje(){
        this("",new Vuelo("",new Ciudad("",""),new Ciudad("",""),0,"",0),new Avion("","",0),"",0);
    }
    
    public Viaje(String codigo, Vuelo vuelo, Avion avion, String fecha,int vendidas) {
        this.codigo = codigo;
        this.vuelo = vuelo;
        this.avion = avion;
        this.fecha = fecha;
        this.vendidas = vendidas;
    }


    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public Vuelo getVuelo() {
        return vuelo;
    }

    public void setVuelo(Vuelo vuelo) {
        this.vuelo = vuelo;
    }

    public Avion getAvion() {
        return avion;
    }

    public void setAvion(Avion avion) {
        this.avion = avion;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }
    
    
    public int getVendidas() {
        return vendidas;
    }

    public void setVendidas(int vendidas) {
        this.vendidas = vendidas;
    }
}