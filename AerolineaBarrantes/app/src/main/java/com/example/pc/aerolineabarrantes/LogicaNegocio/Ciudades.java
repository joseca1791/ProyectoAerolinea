package com.example.pc.aerolineabarrantes.LogicaNegocio;

public class Ciudades {

    private String codigo;
    private String nombre;

    public Ciudades(String codigo, String nombre) {
        this.codigo = codigo;
        this.nombre = nombre;
    }

    public Ciudades() {
    }


    @Override
    public String toString() {
        return "Ciudades{" +
                "codigo='" + codigo + '\'' +
                ", nombre='" + nombre + '\'' +
                '}';
    }


    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
}
