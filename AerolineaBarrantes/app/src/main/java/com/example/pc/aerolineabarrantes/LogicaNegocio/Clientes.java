package com.example.pc.aerolineabarrantes.LogicaNegocio;

public class Clientes {

    private String nombre_usuario;
    private String nombre;
    private String apellidos;
    private String clave;
    private String correo;
    private String nacimiento;
    private String direccion;
    private String telefono;
    private int tipo;

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

    public Clientes() {
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

    public String getNombre_usuario() {
        return nombre_usuario;
    }

    public void setNombre_usuario(String nombre_usuario) {
        this.nombre_usuario = nombre_usuario;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getNacimiento() {
        return nacimiento;
    }

    public void setNacimiento(String nacimiento) {
        this.nacimiento = nacimiento;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public int getTipo() {
        return tipo;
    }

    public void setTipo(int tipo) {
        this.tipo = tipo;
    }
}
