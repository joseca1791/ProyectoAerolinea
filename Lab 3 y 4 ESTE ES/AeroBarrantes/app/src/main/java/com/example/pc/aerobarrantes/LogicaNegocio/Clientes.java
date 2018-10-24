package com.example.pc.aerobarrantes.LogicaNegocio;

public class Clientes {
    String nombre_usuario;
    String nombre;
    String apellidos;
    String clave;
    String correo;
    String nacimiento;
    String direccion;
    String telefono;
    int tipo;

    public Clientes(String clave, String correo, int tipo) {
        this.clave = clave;
        this.correo = correo;
        this.tipo = tipo;
    }

    public Clientes(String nombre_usuario, String nombre, String apellidos, String clave, String correo, String nacimiento, String direccion, String telefono, int tipo) {
        this.nombre_usuario = nombre_usuario;
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.clave = clave;
        this.correo = correo;
        this.nacimiento = nacimiento;
        this.direccion = direccion;
        this.telefono = telefono;
        this.tipo = tipo;
    }

    public String getNombre_usuario() {
        return nombre_usuario;
    }

    public String getNombre() {
        return nombre;
    }

    public String getApellidos() {
        return apellidos;
    }

    public String getClave() {
        return clave;
    }

    public String getCorreo() {
        return correo;
    }

    public String getNacimiento() {
        return nacimiento;
    }

    public String getDireccion() {
        return direccion;
    }

    public String getTelefono() {
        return telefono;
    }

    public int getTipo() {
        return tipo;
    }

    public void setNombre_usuario(String nombre_usuario) {
        this.nombre_usuario = nombre_usuario;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public void setNacimiento(String nacimiento) {
        this.nacimiento = nacimiento;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public void setTipo(int tipo) {
        this.tipo = tipo;
    }

    @Override
    public String toString() {
        return "Clientes{" +
                "nombre_usuario='" + nombre_usuario + '\'' +
                ", nombre='" + nombre + '\'' +
                ", apellidos='" + apellidos + '\'' +
                ", clave='" + clave + '\'' +
                ", correo='" + correo + '\'' +
                ", nacimiento='" + nacimiento + '\'' +
                ", direccion='" + direccion + '\'' +
                ", telefono='" + telefono + '\'' +
                ", tipo=" + tipo +
                '}';
    }

}

