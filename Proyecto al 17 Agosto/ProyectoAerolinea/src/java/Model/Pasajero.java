package Model;

/**
 *
 * @author Greivin
 */
public class Pasajero implements Jsonable{
    String pasaporte;
    String nombre;
    String apellido;
    int asiento;

    public Pasajero() {
        this("","","",0);
    }

    public Pasajero(String pasaporte, String nombre, String apellido, int asiento) {
        this.pasaporte = pasaporte;
        this.nombre = nombre;
        this.apellido = apellido;
        this.asiento = asiento;
    }

    public String getPasaporte() {
        return pasaporte;
    }

    public void setPasaporte(String pasaporte) {
        this.pasaporte = pasaporte;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public int getAsiento() {
        return asiento;
    }

    public void setAsiento(int asiento) {
        this.asiento = asiento;
    }
    
    
    
}
