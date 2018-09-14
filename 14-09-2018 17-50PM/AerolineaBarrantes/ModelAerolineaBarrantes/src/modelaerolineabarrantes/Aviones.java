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
public class Aviones {

    String codigo_Avion;
    String modelo;
    int capacidad;
    
    public Aviones(String codigo_Avion, String modelo, int capacidad) {
        this.codigo_Avion = codigo_Avion;
        this.modelo = modelo;
        this.capacidad = capacidad;
    }

    public Aviones() {
    }

    public String getCodigo_Avion() {
        return codigo_Avion;
    }

    public String getModelo() {
        return modelo;
    }

    public int getCapacidad() {
        return capacidad;
    }

    public void setCodigo_Avion(String codigo_Avion) {
        this.codigo_Avion = codigo_Avion;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public void setCapacidad(int capacidad) {
        this.capacidad = capacidad;
    }
}
