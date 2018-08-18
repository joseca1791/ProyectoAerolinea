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
public class Reservacion extends java.util.Observable implements Jsonable{
    
    int numero_reservacion;
    Viaje viaje;
    Cliente cliente;
    
    public Reservacion(){
 this(0,new Viaje("",new Vuelo("",new Ciudad("",""),new Ciudad("",""),0,"",0),new Avion("","",0),"",0), new Cliente("","","","","","","","",0));
    }

    public Reservacion(int numero_reservacion, Viaje viaje, Cliente cliente) {
        this.numero_reservacion = numero_reservacion;
        this.viaje = viaje;
        this.cliente = cliente;
    }

    public int getNumero_reservacion() {
        return numero_reservacion;
    }

    public void setNumero_reservacion(int numero_reservacion) {
        this.numero_reservacion = numero_reservacion;
    }

    public Viaje getViaje() {
        return viaje;
    }

    public void setViaje(Viaje viaje) {
        this.viaje = viaje;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }
    
    
    
}