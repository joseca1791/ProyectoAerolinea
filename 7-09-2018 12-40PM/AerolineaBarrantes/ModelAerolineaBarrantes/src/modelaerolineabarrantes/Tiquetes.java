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
public class Tiquetes {

    public Tiquetes() {
    }

    public Tiquetes(int numero_tiquete, String nombre_dueno, String apellido_dueno, String pasaporte, int asiento, Reservaciones reservacion) {
        this.numero_tiquete = numero_tiquete;
        this.nombre_dueno = nombre_dueno;
        this.apellido_dueno = apellido_dueno;
        this.pasaporte = pasaporte;
        this.asiento = asiento;
        this.reservacion = reservacion;
    }

    public int getNumero_tiquete() {
        return numero_tiquete;
    }

    public void setNumero_tiquete(int numero_tiquete) {
        this.numero_tiquete = numero_tiquete;
    }

    public String getNombre_dueno() {
        return nombre_dueno;
    }

    public void setNombre_dueno(String nombre_dueno) {
        this.nombre_dueno = nombre_dueno;
    }

    public String getApellido_dueno() {
        return apellido_dueno;
    }

    public void setApellido_dueno(String apellido_dueno) {
        this.apellido_dueno = apellido_dueno;
    }

    public String getPasaporte() {
        return pasaporte;
    }

    public void setPasaporte(String pasaporte) {
        this.pasaporte = pasaporte;
    }

    public int getAsiento() {
        return asiento;
    }

    public void setAsiento(int asiento) {
        this.asiento = asiento;
    }

    public Reservaciones getReservacion() {
        return reservacion;
    }

    public void setReservacion(Reservaciones reservacion) {
        this.reservacion = reservacion;
    }
    
    int numero_tiquete;
    String nombre_dueno;
    String apellido_dueno;
    String pasaporte;
    int asiento;
    Reservaciones reservacion;
}
