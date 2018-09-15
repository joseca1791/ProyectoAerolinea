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
public class Reservaciones {
    
    int numero_reservacion;
    Viajes viaje;
    Clientes cliente;
    
    public Reservaciones(){
    }

    public Reservaciones(int numero_reservacion, Viajes viaje, Clientes cliente) {
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

    public Viajes getViaje() {
        return viaje;
    }

    public void setViaje(Viajes viaje) {
        this.viaje = viaje;
    }

    public Clientes getCliente() {
        return cliente;
    }

    public void setCliente(Clientes cliente) {
        this.cliente = cliente;
    }
}
