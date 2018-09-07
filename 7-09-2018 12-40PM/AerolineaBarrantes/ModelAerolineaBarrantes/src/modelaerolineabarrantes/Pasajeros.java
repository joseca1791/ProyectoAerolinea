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
public class Pasajeros {
    String pasaporte;
    String nombre;
    String apellido;
    int asiento;

    public void setPasaporte(String pasaporte) {
        this.pasaporte = pasaporte;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public void setAsiento(int asiento) {
        this.asiento = asiento;
    }

    public String getPasaporte() {
        return pasaporte;
    }

    public String getNombre() {
        return nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public int getAsiento() {
        return asiento;
    }

    public Pasajeros(String pasaporte, String nombre, String apellido, int asiento) {
        this.pasaporte = pasaporte;
        this.nombre = nombre;
        this.apellido = apellido;
        this.asiento = asiento;
    }

    public Pasajeros() {
    }
}
