
package Model;


public class Avion implements Jsonable{
    
    
    String codigo_Avion;
    String modelo;
    int capacidad;

    public Avion() {
        this("","",0);
    }

    public String getCodigo_Avion() {
        return codigo_Avion;
    }

    public void setCodigo_Avion(String codigo_Avion) {
        this.codigo_Avion = codigo_Avion;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public int getCapacidad() {
        return capacidad;
    }

    public void setCapacidad(int capacidad) {
        this.capacidad = capacidad;
    }

    public Avion(String codigo_Avion, String modelo, int capacidad) {
        this.codigo_Avion = codigo_Avion;
        this.modelo = modelo;
        this.capacidad = capacidad;
    }
    
}
