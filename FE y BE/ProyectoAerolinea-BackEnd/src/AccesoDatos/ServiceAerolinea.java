/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AccesoDatos;

import ModeloNegocio.*;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import oracle.jdbc.OracleTypes;
/**
 *
 * @author Jose Carlos
 */
public class ServiceAerolinea extends Service{
    
    public ServiceAerolinea(){}
    
    private static final String INSERTARproductos = "{call agregarProducto(?,?,?,?,?)}";
    
    private static final String BUSCARCiudadesTodas="{?=call getCiudadesTodas(?)}";
    private static final String BUSCARCiudadesPorNombre="{?=call getCiudadesNombre(?)}";
    private static final String BUSCARCiudadesPorCodigo="{?=call getCiudadesCodigo(?)}";
    private static final String BUSCARVuelosTodos="{?=call getVuelosTodos(?)}";
    private static final String BUSCARVueloPorCodigo="{?=call getVueloCodigo(?)}"; 
    private static final String BUSCARAvionesTodos="{?=call getAvionesTodos(?)}";
    private static final String BUSCARViajesPorCodigo="{?=call getViajesCodigo(?)}";
    private static final String BUSCARViajesPorFecha="{?=call getViajesFecha(?)}";
    private static final String BUSCARVueloConPromo="{?=call getPromo(?)}";
  
    
    private static ArrayList aviones;
    private static ArrayList ciudades;
    private static ArrayList clientes;
    private static ArrayList reservaciones;
    private static ArrayList tiquetes;
    private static ArrayList viajes;
    private static ArrayList vuelos;

    public Collection getCiudadesTodas() throws SQLException, Exception {
        ResultSet rs = null;
        ciudades = new ArrayList(); 
        CallableStatement pstmt = null;
        Ciudad lasCiudades= null;
        try {
            getConnection();
            pstmt = connection.prepareCall(BUSCARCiudadesTodas);
            pstmt.registerOutParameter(1, OracleTypes.CURSOR);
            pstmt.setString(2, "n");
            pstmt.execute();
            rs = (ResultSet) pstmt.getObject(1);
            while (rs.next()) {
                lasCiudades = new Ciudad(rs.getString("codigo"),rs.getString("nombre"));
                ciudades.add(lasCiudades);
            }
        } catch (SQLException e) {
            throw new Exception("Sentencia no valida");
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pstmt != null) {
                    pstmt.close();
                }
                closeConnection();
            } catch (SQLException e) {
                throw new Exception("Estatutos invalidos o nulos");
            }
        }
        if (ciudades == null || ciudades.isEmpty()) {
            throw new Exception("No hay datos");
        }
        return ciudades;
    }
    public Collection getCiudadesNombre(String n) throws SQLException, Exception {
        ResultSet rs = null;
        ciudades = new ArrayList();
        CallableStatement pstmt = null;
        Ciudad lasCiudades = null;
        try {
            getConnection();
            pstmt = connection.prepareCall(BUSCARCiudadesPorNombre);
            pstmt.registerOutParameter(1, OracleTypes.CURSOR);
            pstmt.setString(2, n);
            pstmt.execute();
            rs = (ResultSet) pstmt.getObject(1);
            while (rs.next()) {
                lasCiudades = new Ciudad(rs.getString("codigo"),rs.getString("nombre"));
                ciudades.add(lasCiudades);
            }
        } catch (SQLException e) {
            throw new Exception("Sentencia no valida");
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pstmt != null) {
                    pstmt.close();
                }
                closeConnection();
            } catch (SQLException e) {
                throw new Exception("Estatutos invalidos o nulos");
            }
        }
        if (ciudades == null || ciudades.isEmpty()) {
            throw new Exception("No hay datos");
        }
        return ciudades;
    }
    public Collection getCiudadesCodigo(String n) throws SQLException, Exception {
        ResultSet rs = null;
        ciudades = new ArrayList();
        CallableStatement pstmt = null;
        Ciudad lasCiudades = null;
        try {
            getConnection();
            pstmt = connection.prepareCall(BUSCARCiudadesPorCodigo);
            pstmt.registerOutParameter(1, OracleTypes.CURSOR);
            pstmt.setString(2, n);
            pstmt.execute();
            rs = (ResultSet) pstmt.getObject(1);
            while (rs.next()) {
                lasCiudades = new Ciudad(rs.getString("codigo"),rs.getString("nombre"));
                ciudades.add(lasCiudades);
            }
        } catch (SQLException e) {
            throw new Exception("Sentencia no valida");
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pstmt != null) {
                    pstmt.close();
                }
                closeConnection();
            } catch (SQLException e) {
                throw new Exception("Estatutos invalidos o nulos");
            }
        }
        if (ciudades == null || ciudades.isEmpty()) {
            throw new Exception("No hay datos");
        }
        return ciudades;
    }
    public Collection getVuelosTodos() throws SQLException,Exception {
        ResultSet rs = null;
        vuelos = new ArrayList(); 
        CallableStatement pstmt = null;
        Vuelo losVuelos=null;
        try {
            getConnection();
            pstmt = connection.prepareCall(BUSCARVuelosTodos);
            pstmt.registerOutParameter(1, OracleTypes.CURSOR);
            pstmt.setString(2, "n");
            pstmt.execute();
            rs=(ResultSet) pstmt.getObject(1);
            while (rs.next()){
                losVuelos=new Vuelo(rs.getString("codigo"),rs.getString("origen"),
                                    rs.getString("destino"),rs.getInt("precio"),
                                    rs.getString("tiempo"),rs.getInt("promo"));
                vuelos.add(losVuelos);
            }
            } catch (SQLException e) {
            throw new Exception("Sentencia no valida");
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pstmt != null) {
                    pstmt.close();
                }
                closeConnection();
            } catch (SQLException e) {
                throw new Exception("Estatutos invalidos o nulos");
            }
        }
        if (vuelos == null || vuelos.isEmpty()) {
            throw new Exception("No hay datos");
        }
        return vuelos;
    }
    public Collection vueloBusquedaCodigo(String n) throws SQLException, Exception {
        ResultSet rs = null;
        vuelos = new ArrayList();
        CallableStatement pstmt = null;
        Vuelo losVuelos = null;
        try {
            getConnection();
            pstmt = connection.prepareCall(BUSCARVueloPorCodigo);
            pstmt.registerOutParameter(1, OracleTypes.CURSOR);
            pstmt.setString(2, n);
            pstmt.execute();
            rs = (ResultSet) pstmt.getObject(1);
            while (rs.next()) {
                losVuelos=new Vuelo(rs.getString("codigo"),rs.getString("origen"),
                                    rs.getString("destino"),rs.getInt("precio"),
                                    rs.getString("tiempo"),rs.getInt("promo"));
                vuelos.add(losVuelos);
            }
        } catch (SQLException e) {
            throw new Exception("Sentencia no valida");
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pstmt != null) {
                    pstmt.close();
                }
                closeConnection();
            } catch (SQLException e) {
                throw new Exception("Estatutos invalidos o nulos");
            }
        }
        if (vuelos == null || vuelos.isEmpty()) {
            throw new Exception("No hay datos");
        }
        return vuelos;
        
    }
    public Collection getAvionesTodos() throws SQLException,Exception {
        ResultSet rs = null;
        aviones = new ArrayList(); 
        CallableStatement pstmt = null;
        Avion losAviones=null;
        try {
            getConnection();
            pstmt = connection.prepareCall(BUSCARAvionesTodos);
            pstmt.registerOutParameter(1, OracleTypes.CURSOR);
            pstmt.setString(2, "n");
            pstmt.execute();
            rs=(ResultSet) pstmt.getObject(1);
            while (rs.next()){
                losAviones=new Avion(rs.getString("codigo_Avion"),rs.getString("modelo"),rs.getInt("capacidad"));
                aviones.add(losAviones);
            }
            } catch (SQLException e) {
            throw new Exception("Sentencia no valida");
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pstmt != null) {
                    pstmt.close();
                }
                closeConnection();
            } catch (SQLException e) {
                throw new Exception("Estatutos invalidos o nulos");
            }
        }
        if (aviones == null || aviones.isEmpty()) {
            throw new Exception("No hay datos");
        }
        return aviones;        
    }
    public Collection getViajesCodigo(String n) throws SQLException,Exception {
        ResultSet rs = null;
        viajes = new ArrayList();
        CallableStatement pstmt = null;
        Viaje losViajes = null;
        try {
            getConnection();
            pstmt = connection.prepareCall(BUSCARViajesPorCodigo);
            pstmt.registerOutParameter(1, OracleTypes.CURSOR);
            pstmt.setString(2, n);
            pstmt.execute();
            rs = (ResultSet) pstmt.getObject(1);
            while (rs.next()) {
                losViajes = new Viaje(rs.getString("codigo"),rs.getString("vuelo"),
                                      rs.getString("avion"),rs.getString("fecha"),
                                      rs.getInt("vendidas"));
                viajes.add(losViajes);
            }
        } catch (SQLException e) {
            throw new Exception("Sentencia no valida");
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pstmt != null) {
                    pstmt.close();
                }
                closeConnection();
            } catch (SQLException e) {
                throw new Exception("Estatutos invalidos o nulos");
            }
        }
        if (viajes == null || viajes.isEmpty()) {
            throw new Exception("No hay datos");
        }
        return viajes;
        
    }
    public Collection getViajesFecha(String n) throws SQLException,Exception {
        ResultSet rs = null;
        viajes = new ArrayList();
        CallableStatement pstmt = null;
        Viaje losViajes = null;
        try {
            getConnection();
            pstmt = connection.prepareCall(BUSCARViajesPorFecha);
            pstmt.registerOutParameter(1, OracleTypes.CURSOR);
            pstmt.setString(2, n);
            pstmt.execute();
            rs = (ResultSet) pstmt.getObject(1);
            while (rs.next()) {
                losViajes = new Viaje(rs.getString("codigo"),rs.getString("vuelo"),
                                      rs.getString("avion"),rs.getString("fecha"),
                                      rs.getInt("vendidas"));
                viajes.add(losViajes);
            }
        } catch (SQLException e) {
            throw new Exception("Sentencia no valida");
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pstmt != null) {
                    pstmt.close();
                }
                closeConnection();
            } catch (SQLException e) {
                throw new Exception("Estatutos invalidos o nulos");
            }
        }
        if (viajes == null || viajes.isEmpty()) {
            throw new Exception("No hay datos");
        }
        return viajes;
        
    }   
    public Collection getPromo() throws SQLException,Exception{
        ResultSet rs = null;
        vuelos = new ArrayList();
        CallableStatement pstmt = null;
        Vuelo losVuelos = null;
        try {
            getConnection();
            pstmt = connection.prepareCall(BUSCARVueloConPromo);
            pstmt.registerOutParameter(1, OracleTypes.CURSOR);
            pstmt.setString(2, "n");
            pstmt.execute();
            rs = (ResultSet) pstmt.getObject(1);
            while (rs.next()) {
                losVuelos = new Vuelo();
                vuelos.add(losVuelos);
            }
        } catch (SQLException e) {
            throw new Exception("Sentencia no valida");
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pstmt != null) {
                    pstmt.close();
                }
                closeConnection();
            } catch (SQLException e) {
                throw new Exception("Estatutos invalidos o nulos");
            }
        }
        if (vuelos == null || vuelos.isEmpty()) {
            throw new Exception("No hay datos");
        }
        return vuelos;    
    
    
    }
}
