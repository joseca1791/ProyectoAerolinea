package una.com.aeroline.LogicaNegocio;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by Luis Carrillo Rodriguez on 26/3/2018.
 */

public class Usuario implements Serializable {
    private String correo;
    private String contraseña;
    private String cedula;
    private String privilegio;
    private String nombre;
    private String apellidos;
    private String telefono;
    private String fechaNacimiento;

    public Usuario() {
        this.correo = "none";
        this.contraseña = "none";
        this.privilegio = "none";
    }

    public Usuario(String correo, String contraseña, String cedula, String privilegio, String nombre, String apellidos, String telefono, String fechaNacimiento) {
        this.correo = correo;
        this.contraseña = contraseña;
        this.cedula = cedula;
        this.privilegio = privilegio;
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.telefono = telefono;
        this.fechaNacimiento = fechaNacimiento;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getContraseña() {
        return contraseña;
    }

    public void setContraseña(String contraseña) {
        this.contraseña = contraseña;
    }

    public String getPrivilegio() {
        return privilegio;
    }

    public void setPrivilegio(String privilegio) {
        this.privilegio = privilegio;
    }

    public String getCedula() {
        return cedula;
    }

    public void setCedula(String cedula) {
        this.cedula = cedula;
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

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getFechaNacimiento() {
        return fechaNacimiento;
    }

    public void setFechaNacimiento(String fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }

    @Override
    public String toString() {
        return "Usuario{" +
                "correo='" + correo + '\'' +
                ", contraseña='" + contraseña + '\'' +
                ", cedula='" + cedula + '\'' +
                ", privilegio='" + privilegio + '\'' +
                ", nombre='" + nombre + '\'' +
                ", apellidos='" + apellidos + '\'' +
                ", telefono='" + telefono + '\'' +
                ", fechaNacimiento='" + fechaNacimiento + '\'' +
                '}';
    }
}
