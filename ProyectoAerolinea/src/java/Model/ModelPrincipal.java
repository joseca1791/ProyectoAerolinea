
package Model;

import Database.Database;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Vector;


public class ModelPrincipal {
    static Database aerolinea;
    static List<Vuelo> vuelos = new ArrayList<Vuelo>();
    static List<Ciudad> ciudades = new ArrayList<Ciudad>();

    static{
        initAerolinea();
    }
    
    private static void initAerolinea(){
 
        aerolinea = new Database(null,null,null);
 
    }
    
  
    public List<Ciudad> getCiudadesTodas(){
     List<Ciudad> ciudades = new ArrayList<Ciudad>();
     try{
         String sql = "select * from ciudades order by nombre ASC";
         sql = String.format(sql);
         
         ResultSet rs = aerolinea.executeQuery(sql);
         
         while(rs.next()){
             ciudades.add(toCiudad(rs));
         }
     }catch(SQLException e){}
     return ciudades;
    }//select * from Ciudades, llama a toCiudad
    
    public List<Vuelo> getVuelosTodos()throws Exception{
        List<Vuelo> vuelos = new ArrayList<Vuelo>();
        
        try{
            String sql = "select * from vuelos";
            sql = String.format(sql);
            
            ResultSet rs = aerolinea.executeQuery(sql);
            
            while(rs.next()){
               vueloCompleto(vuelos,rs);
            }
        }catch(SQLException e){}
        return vuelos;
    }
    
    public List<Avion> getAvionesTodos(){
        List<Avion> aviones = new ArrayList<Avion>();
        
        try{
            
            String sql = "select * from aviones";
            sql = String.format(sql);
            
            ResultSet rs = aerolinea.executeQuery(sql);
            
            while(rs.next()){
                Avion avion = new Avion();
                avion.setCodigo_Avion(rs.getString(1));
                avion.setModelo(rs.getString(2));
                avion.setCapacidad(rs.getInt(3));
                aviones.add(avion);
            }
            
        }catch(SQLException e){}
        return aviones;
    }
    
    public List <Ciudad> getCiudadesNombre(String criteria){
        List<Ciudad> ciudades = new ArrayList<Ciudad>();
        try{
            String sql ="Select * from ciudades where nombre like '%%%s%%'";
            sql = String.format(sql, criteria);
            
            ResultSet rs = aerolinea.executeQuery(sql);
            
            while(rs.next()){
                ciudades.add(toCiudad(rs));
            }
            
        }catch(SQLException e){
        e.printStackTrace();
        }
        
        return ciudades;
    }//Select * from ciudades nombre like %s% llama a toCiudad
    
    public List <Ciudad> getCiudadesCodigo(String criteria){
        List<Ciudad> ciudades = new ArrayList<Ciudad>();
        try{
            String sql ="Select * from ciudades where codigo_ciudad = '%s'";
            sql = String.format(sql, criteria);
            
            ResultSet rs = aerolinea.executeQuery(sql);
            
            while(rs.next()){
                ciudades.add(toCiudad(rs));
            }
            
        }catch(SQLException e){
        e.printStackTrace();
        }
        
        return ciudades;
    }//Select * from ciudades where codigo_ciudad = '%s'" llama a toCiudad
    
    private Ciudad toCiudad(ResultSet rs){
       try{
           Ciudad c = new Ciudad();
           c.setCodigo(rs.getString(1));
           c.setNombre(rs.getString(2));
           return c;
       }catch(SQLException e){
       return null;
       }
    }//Recibe un ResultSet y devuelve una ciudad
    
    public static boolean newCiudad(Ciudad c)throws Exception{
        String sql = "insert into ciudades(codigo_ciudad,nombre) values ('%s' , '%s')";
        sql = String.format(sql, c.getCodigo().toUpperCase(),c.getNombre().toUpperCase());
        
        int count  =aerolinea.executeUpdate(sql);
        
        if(count ==0){
          return false;
        }else{
            return true;
        }
        
    }//inserta Ciudad a la BD
        
    public static int newVuelo(Vuelo v)throws Exception{
        String sql = "insert into vuelos(numero_vuelo,origen,destino,costo,tiempo,promo) values ('%s','%s','%s','%s','%s','%s')";
        sql = String.format(sql,v.getCodigo(),v.getOrigen().getCodigo().toUpperCase(),v.getDestino().getCodigo().toUpperCase(),
                            v.getPrecio(),v.getTiempo(),v.getPromo());
        
        int count = aerolinea.executeUpdate(sql);
        
        if(count ==0){
          return 0;
        }else{
            return 1;
        }
  
    } //Insertar Vuelo a la BD                                  
    
    public int eliminarCiudad(String codigo)throws Exception{
        String sql = "delete from ciudades where codigo_ciudad = '%s'";
        sql = String.format(sql, codigo);
        
        int count = aerolinea.executeUpdate(sql);
        
         if(count ==0){
          return 0;
        }else{
            return 1;
        }
    }
    
    public int eliminarVuelo(String codigo)throws Exception{
        String sql = "delete from vuelos where numero_vuelo= '%s'";
        sql = String.format(sql, codigo);
        
        int count = aerolinea.executeUpdate(sql);
        
         if(count ==0){
          return 0;
        }else{
            return 1;
        }
    }
    
     public int eliminarViaje(String codigo)throws Exception{
        String sql = "delete from viajes where codigo_viaje= '%s'";
        sql = String.format(sql, codigo);
        
        int count = aerolinea.executeUpdate(sql);
        
         if(count ==0){
          return 0;
        }else{
            return 1;
        }
    }
    
    public boolean newAvion(Avion v)throws Exception{
        
        String sql = "insert into aviones(codigo_avion,modelo,capacidad) values ('%s','%s','%s')";
        sql = String.format(sql, v.getCodigo_Avion().toUpperCase(),v.getModelo().toUpperCase(),v.getCapacidad());
        
        int count = aerolinea.executeUpdate(sql);
        
      if(count ==0){
          return false;
        }else{
            return true;
        }
    }
    
    public boolean newViaje(Viaje v){
        String sql = "insert into viajes(codigo_viaje,vuelo,avion,fecha,vendidas) values ('%s','%s','%s','%s','%s')";
        sql = String.format(sql, v.getCodigo().toUpperCase(),v.getVuelo().getCodigo(),v.getAvion().getCodigo_Avion(),v.getFecha(),v.getVendidas());
        
        int count = aerolinea.executeUpdate(sql);
        
        if(count ==0){
          return false;
        }else{
            return true;
        }
    }
    
    public static boolean actualizarVuelo(Vuelo v)throws Exception{
        String sql = "update vuelos set origen = '%s' ,destino = '%s' ,costo = '%s' ,tiempo = '%s',promo = '%s'"+
                    "where numero_vuelo = '%s'";
        
       sql = String.format(sql, v.getOrigen().getCodigo(),v.getDestino().getCodigo(),v.getPrecio(),v.getTiempo(),v.getPromo(),
                            v.getCodigo());
       
       int count = aerolinea.executeUpdate(sql);
       
       if(count == 0){
           return false;
       }else{
           return true;
       }
       
    }
    
    public boolean actualizarAvion(Avion v)throws Exception{
        String sql = "update aviones set modelo = '%s' ,capacidad = '%s' where codigo_avion = '%s'";
        sql = String.format(sql, v.getModelo(),v.getCapacidad(),v.getCodigo_Avion());
        
         int count = aerolinea.executeUpdate(sql);
       
       if(count == 0){
           return false;
       }else{
           return true;
       }
        
    }
    
    public static Cliente userLogin(Cliente cliente) throws Exception{
        try{
            String sql = "select * from Usuarios u where u.nombre_usuario = '%s'"+
                         "and u.clave = '%s'";
            sql = String.format(sql, cliente.nombre_usuario,cliente.clave);
            
            ResultSet rs = aerolinea.executeQuery(sql);
            
            if(rs.next()){
                return toUser(rs);
            }else{
                return new Cliente(cliente.nombre_usuario,cliente.nombre,cliente.apellidos,cliente.clave,cliente.correo,
                                    cliente.nacimiento,cliente.direccion,cliente.telefono,0);
            }
            
        }catch(SQLException ex){
            System.out.println("Error en Model userLogin");
        }
        return null;
    }
    
    public static Cliente signIn(Cliente c)throws Exception{
       
            
            String sql = "insert into usuarios(nombre_usuario,nombre,apellido,clave,correo,nacimiento,"+
                    "direccion,telefono,tipo) values ('%s','%s','%s','%s','%s','%s','%s','%s','%s')";
            
            sql=String.format(sql,c.getNombre_usuario(),c.getNombre(),c.getApellidos(),c.getClave(),
                           c.getCorreo(),c.getNacimiento(),c.getDireccion(),c.getTelefono(),c.getTipo());
            
            int count = aerolinea.executeUpdate(sql);
            
            if(count == 0){//Nombre de Usuario ya Existe
                return new Cliente("","","","","","","","",0);
            }else{
                return c;
            }

    }
    
    private static Cliente toUser(ResultSet rs) throws Exception{
        Cliente obj = new Cliente();
        obj.setNombre_usuario(rs.getString(1));
        obj.setNombre(rs.getString(2));
        obj.setApellidos(rs.getString(3));
        obj.setClave(rs.getString(4));
        obj.setCorreo(rs.getString(5));
        obj.setNacimiento(rs.getString(6));
        obj.setDireccion(rs.getString(7));
        obj.setTelefono(rs.getString(8));
        obj.setTipo(rs.getInt(9));
        return obj;
        
    }
 
   public List<Vuelo> getPromo() throws Exception{      //Son las Promos
         List <Vuelo> promos = new ArrayList<Vuelo>();

       try{
           
           String sql = "select * from vuelos where promo = 1";
           
           sql = String.format(sql);
           
           ResultSet rs = aerolinea.executeQuery(sql);
           
           while(rs.next()){
            vueloCompleto(promos,rs);
           }
           
       }catch(SQLException e){
           
       }
       return promos;
   }//Son las Promos a mostrar Principal y Ofertas
     
   public List<Vuelo> vuelosAMostrar()throws Exception{
      List <Vuelo> vuelos = new ArrayList<Vuelo>();
       try{
           String sql = "select * from vuelos where promo =0";
           sql = String.format(sql);
           ResultSet rs = aerolinea.executeQuery(sql);
           
           while(rs.next()){
               vueloCompleto(vuelos,rs);
           }
       }catch(SQLException e){}
       return vuelos;
   }
   
   public List<Vuelo> CiudadBusqueda(String origen,String destino)throws Exception{
       List <Vuelo> vuelos = new ArrayList<Vuelo>();
       try{
       
           String sql ="select codigo_ciudad from Ciudades where nombre = '%s'";
           sql = String.format(sql,origen);
           
           ResultSet rsOrigen = aerolinea.executeQuery(sql);
           
           if(rsOrigen.next()){
               
           String sql1 ="select codigo_ciudad from Ciudades where nombre = '%s'";

           sql1 = String.format(sql1,destino);
           
           ResultSet rsDestino = aerolinea.executeQuery(sql1);
           
           if(rsDestino.next()){
           Ciudad ori = new Ciudad(rsOrigen.getString(1),origen);
           Ciudad dest = new Ciudad(rsDestino.getString(1),destino);
           vueloBusqueda(vuelos,ori,dest);
           }
           
           }
       }catch(SQLException ex){}
       return vuelos;
   }
   
   private static void vueloBusqueda(List vuelo,Ciudad origen,Ciudad destino)throws Exception{
       try{
           String sql = "select * from Vuelos where origen ='%s' and destino= '%s'";
           sql = String.format(sql,origen.getCodigo(),destino.getCodigo());
           
           ResultSet rs = aerolinea.executeQuery(sql);
           
           while(rs.next()){
               vueloCompleto(vuelo,rs);
           }
       }catch(SQLException ex){}  
   
   }
     
   private static void vueloCompleto(List vuelos,ResultSet resultado)throws Exception{
       String origen = resultado.getString(2);
       String destino = resultado.getString(3);
  
       try{
           String sql = "Select nombre from Ciudades where codigo_ciudad = '%s'";
           sql = String.format(sql, origen);
           ResultSet rsOrigen = aerolinea.executeQuery(sql);
           
           if(rsOrigen.next()){
               origen = rsOrigen.getString(1);
           }
           
           sql = "Select nombre from Ciudades where codigo_ciudad = '%s'";
           sql = String.format(sql, destino);
           rsOrigen = aerolinea.executeQuery(sql);
           
           if(rsOrigen.next()){
               destino = rsOrigen.getString(1);
           }
           
           Ciudad ciudad = new Ciudad(resultado.getString(2),origen);
           Vuelo vuelo = new Vuelo();
           vuelo.codigo = resultado.getString(1);
           vuelo.origen = ciudad;
           ciudad = new Ciudad(resultado.getString(3),destino);
           vuelo.destino= ciudad;
           vuelo.precio= resultado.getInt(4);
           vuelo.tiempo=resultado.getString(5);
           vuelo.promo = resultado.getInt(6);
           vuelos.add(vuelo);
           
           
       }catch(SQLException e){}
       
   }
   
   public Avion avionBusquedaCodigo(String criteria)throws Exception{
       try{
           
             Avion a = new Avion();
           String sql = "Select * from aviones where codigo_avion = '%s'";
           sql = String.format(sql, criteria);
           
           ResultSet rs = aerolinea.executeQuery(sql);
           
           if(rs.next()){
               a.setCodigo_Avion(rs.getString(1));
               a.setModelo(rs.getString(2));
               a.setCapacidad(rs.getInt(3));
               return a;
           }
       }catch(SQLException e){
       
       }
        return null;
       
   }
   
   public List<Vuelo> vueloBusquedaCodigo(String criteria)throws Exception{
       List<Vuelo> vuelo = new ArrayList<Vuelo>();
       try{
           String sql = "select * from vuelos where numero_vuelo = '%s'";
           sql = String.format(sql, criteria);
           
           ResultSet rs = aerolinea.executeQuery(sql);
           
           if(rs.next()){
               vueloCompleto(vuelo,rs);
           }
       }catch(SQLException e){
           
       }
       return vuelo;
   }
   
   public List<Viaje> getViajesCodigo(String criteria)throws Exception{
       List<Viaje> viajes = new ArrayList<Viaje>();
       try{
       String sql = "select * from viajes where codigo_viaje ='%s'";
       sql = String.format(sql, criteria);
       
       ResultSet rs = aerolinea.executeQuery(sql);
       
       if(rs.next()){
           viajeCompleto(viajes,rs);
       }
       }catch(SQLException e){
           e.printStackTrace();
       }
       return viajes;
   }
   
   public List<Viaje> getViajesFecha(String criteria)throws Exception{
       List<Viaje> viajes = new ArrayList<Viaje>();
       try{
       String sql = "select * from viajes where fecha ='%s'";
       sql = String.format(sql, criteria);
       
       ResultSet rs = aerolinea.executeQuery(sql);
       
       while(rs.next()){
           viajeCompleto(viajes,rs);
       }
       }catch(SQLException e){
           e.printStackTrace();
       }
       return viajes;
   }
   
   private static void viajeCompleto(List viajes, ResultSet resultado) throws Exception{
       try{
           Viaje viaje = new Viaje();
           viaje.setCodigo(resultado.getString(1));
           viaje.setFecha(resultado.getString(4));
           viaje.setVendidas(resultado.getInt(5));
           String sql = "select * from vuelos where numero_vuelo = '%s'";
           sql = String.format(sql,resultado.getString(2));
           
           ResultSet rsVuelo = aerolinea.executeQuery(sql);
           
           if(rsVuelo.next()){
               Vuelo vuelo = new Vuelo();
               vuelo.setCodigo(rsVuelo.getString(1));
               vuelo.setPrecio(rsVuelo.getInt(4));
               vuelo.setTiempo(rsVuelo.getString(5));
               vuelo.setPromo(rsVuelo.getInt(6));
               sql = "select * from ciudades where codigo_ciudad = '%s'";
               sql = String.format(sql, rsVuelo.getString(2));
               
               ResultSet rsOrigen = aerolinea.executeQuery(sql);
               
               if(rsOrigen.next()){
                   Ciudad ciudad = new Ciudad();
                   ciudad.setCodigo(rsOrigen.getString(1));
                   ciudad.setNombre(rsOrigen.getString(2));
                   vuelo.setOrigen(ciudad);
               }
               
               sql = "select * from ciudades where codigo_ciudad = '%s'";
               sql = String.format(sql, rsVuelo.getString(3));
               
               ResultSet rsDestino = aerolinea.executeQuery(sql);
               
               if(rsDestino.next()){
                   Ciudad ciudad = new Ciudad();
                   ciudad.setCodigo(rsDestino.getString(1));
                   ciudad.setNombre(rsDestino.getString(2));
                   vuelo.setDestino(ciudad);
               }
               viaje.setVuelo(vuelo);
               
               sql = "select * from aviones where codigo_avion ='%s'";
               sql = String.format(sql, resultado.getString(3));
               
               ResultSet rsAvion = aerolinea.executeQuery(sql);
               
               if(rsAvion.next()){
                   Avion avion = new Avion();
                   avion.setCodigo_Avion(rsAvion.getString(1));
                   avion.setModelo(rsAvion.getString(2));
                   avion.setCapacidad(rsAvion.getInt(3));
                   viaje.setAvion(avion);
               }
               viajes.add(viaje);
           }
           
       }catch(SQLException e){//Del select del vuelo
           e.printStackTrace();
       }
   }
   
   public List<Viaje> getViajesDisponibles(Ciudad origen, Ciudad destino , String fecha)throws Exception{
      List<Viaje> viajes = new ArrayList<Viaje>();
      String sql;
       try{
       sql = "select * from vuelos where origen = '%s' and destino ='%s'";
       sql = String.format(sql,origen.getCodigo(),destino.getCodigo());
       
       ResultSet rsVuelo = aerolinea.executeQuery(sql);
       
       while(rsVuelo.next()){//Significa que SÍ hay un VUELO con ese origen y destino
           
        try{
            
            sql = "Select * from viajes where vuelo = '%s' and fecha = '%s'";
            sql = String.format(sql, rsVuelo.getString(1), fecha);
            
            ResultSet rsViaje = aerolinea.executeQuery(sql);
            
            while(rsViaje.next()){//SÍ hay un VIAJE con esa fecha
                Viaje viaje = new Viaje();
                viaje.setCodigo(rsViaje.getString(1));
                Vuelo vuelo = new Vuelo();
                //Creacion del vuelo
                vuelo.setCodigo(rsVuelo.getString(1));
                vuelo.setOrigen(origen);
                vuelo.setDestino(destino);
                vuelo.setPrecio(rsVuelo.getInt(4));
                vuelo.setTiempo(rsVuelo.getString(5));
                vuelo.setPromo(rsVuelo.getInt(6));
                
                viaje.setVuelo(vuelo);
                
                try{
                    sql = "select * from aviones where codigo_avion = '%s'";
                    sql = String.format(sql, rsViaje.getString(3));
                    
                    ResultSet rsAvion = aerolinea.executeQuery(sql);
                    
                    if(rsAvion.next()){
                        Avion avion = new Avion();
                        avion.setCodigo_Avion(rsAvion.getString(1));
                        avion.setModelo(rsAvion.getString(2));
                        avion.setCapacidad(rsAvion.getInt(3));
                        viaje.setAvion(avion);
                    }
                    
                }catch(SQLException e){
                    
                }
                
                viaje.setFecha(fecha);
                viaje.setVendidas(rsViaje.getInt(5));
                viajes.add(viaje);
            }//FIN rs.Viaje.next() SI HAY UN VIAJE EN ESA FECHA
            
        }catch(SQLException e){//Select * from viajes
            
        } 
           
       }//FIN rs.Vuelo.next() SI HAY UN VUELO CON ESE ORIGEN Y DESTINO
       
       }catch(SQLException ex){//select * from vuelos
           
       }
       return viajes;
   }
   

   public void crearReservacion(Viaje v , Cliente c, Reservacion reservacion) throws Exception{
     String sql = "insert into reservaciones (viaje,usuario) values ('%s' , '%s')";  
     sql = String.format(sql, v.getCodigo(),c.getNombre_usuario());
       
    ResultSet keys = aerolinea.executeUpdateWithKeys(sql);
    
    try{
        keys.next();
        reservacion.setNumero_reservacion(keys.getInt(1));
        reservacion.setViaje(v);
        reservacion.setCliente(c);
        System.out.println("Número de Reservación "+keys.getInt(1));
        
    }catch(Exception e){
        e.printStackTrace();
    }
     
}
   
   public void crearTiquete(Pasajero p, Reservacion r,Tiquete t)throws Exception{
       String sql = "insert into tiquetes(nombre_dueno,apellido_dueno,pasaporte,asiento,reservacion) values"+
               "('%s' , '%s' , '%s' , '%s' , '%s')";
       
       sql = String.format(sql, p.getNombre(),p.getApellido(),p.getPasaporte(),p.getAsiento(),r.getNumero_reservacion());
               
       ResultSet keys = aerolinea.executeUpdateWithKeys(sql);
       
        try{
        keys.next();
        t.setNumero_tiquete(keys.getInt(1));
        t.setNombre_dueno(p.getNombre());//Se sale !!!!!!!!
        t.setApellido_dueno(p.getApellido());
        t.setPasaporte(p.getPasaporte());
        t.setAsiento(p.getAsiento());
        t.setReservacion(r);
        System.out.println("Número de Tiquete "+keys.getInt(1));
       
        
        try{
            sql = "select vendidas from viajes where codigo_viaje = '%s'";
            sql = String.format(sql, r.getViaje().getCodigo());
            
            ResultSet rsVendidas = aerolinea.executeQuery(sql);
            
            if(rsVendidas.next()){
                int vendidas = rsVendidas.getInt(1);
                System.out.println("Hay "+vendidas+" Tiquetes para este viaje");
                vendidas += 1;
                sql = "update viajes set vendidas = '%s' where codigo_viaje = '%s'";
                sql = String.format(sql, vendidas,r.getViaje().getCodigo());
                aerolinea.executeUpdate(sql);
                System.out.println("Ahora Hay "+vendidas);
                
            }
            
        }catch(SQLException e){//Del select vendidas
            e.printStackTrace();
        }
        
    }catch(Exception e){
        e.printStackTrace();
        
    }
   }
   
}
