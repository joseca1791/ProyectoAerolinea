
package Model;

/**
 *
 * @author Greivin
 */
public class Ciudad implements Jsonable{
    
   public String codigo;
    public String nombre;

    public Ciudad(){
        this("","");
    }
    
    public Ciudad(String codigo, String nombre) {
        this.codigo = codigo;
        this.nombre = nombre;
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
