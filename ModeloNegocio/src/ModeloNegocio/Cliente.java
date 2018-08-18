/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloNegocio;

import java.io.Serializable;

/**
 *
 * @author Jose Carlos
 */
public class Cliente extends java.util.Observable implements Serializable,Jsonable{
    String nombre_usuario;
    String nombre;
    String apellidos;  
    String clave;
    String correo;
    String nacimiento;
    String direccion;
    String telefono;
    int tipo;

    public Cliente(){
        this("","","","","","","","",0);
    }
    
    public Cliente(String nombre_usuario, String apellidos, String nombre, String clave, String correo, String nacimiento, String direccion, String telefono,int tipo) {
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.nombre_usuario = nombre_usuario;
        this.clave = clave;
        this.correo = correo;
        this.nacimiento = nacimiento;
        this.direccion = direccion;
        this.telefono = telefono;
        this.tipo= tipo;
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

    public String getNombre_usuario() {
        return nombre_usuario;
    }

    public void setNombre_usuario(String nombre_usuario) {
        this.nombre_usuario = nombre_usuario;
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