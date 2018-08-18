
package Model;
import java.io.File;


public class Vuelo implements Jsonable{
   public String codigo;
   public Ciudad origen;
   public Ciudad destino;
   int precio;
   String tiempo;
   int promo;
 
   public Vuelo(){
       this("",new Ciudad("",""),new Ciudad("",""),0,"",0);
   }

    public Vuelo (String codigo, Ciudad origen, Ciudad destino, int precio,String tiempo,int promo) {
        this.codigo = codigo;
        this.origen = origen;
        this.destino = destino;
        this.precio = precio;
        this.tiempo=tiempo;
        this.promo = promo;
    }


    public String getTiempo() {
        return tiempo;
    }

    public void setTiempo(String tiempo) {
        this.tiempo = tiempo;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public Ciudad getOrigen() {
        return origen;
    }

    public void setOrigen(Ciudad origen) {
        this.origen = origen;
    }

    public Ciudad getDestino() {
        return destino;
    }

    public void setDestino(Ciudad destino) {
        this.destino = destino;
    }

    public int getPrecio() {
        return precio;
    }

    public void setPrecio(int precio) {
        this.precio = precio;
    }

    public int getPromo() {
        return promo;
    }

    public void setPromo(int promo) {
        this.promo = promo;
    }

}
