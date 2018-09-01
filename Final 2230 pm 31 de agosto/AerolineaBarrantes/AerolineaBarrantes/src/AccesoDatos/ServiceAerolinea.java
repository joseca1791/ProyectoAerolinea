/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AccesoDatos;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import oracle.jdbc.OracleTypes;

import modelaerolineabarrantes.*;
/**
 *
 * @author Jose Carlos
 */
public class ServiceAerolinea extends Service{
    
        public ServiceAerolinea(){
        }
        
        public ServiceAerolinea(String url, String user, String pass){
            getConnection(url,user,pass);
        }
        /*Metodos hacia la base de datos para Aviones*/
        private static final String AgregarAvion = "{call agregarAvion(?,?,?)}";
        private static final String ListarAviones="{?=call listarAviones(?)}";
        private static final String ListarAvionesPorId="{?=call listarAvionesPorId(?)}";
        private static final String EditarAvion="{call editarAvion(?,?,?,?)}";
        private static final String EliminarAvion="{call eliminarAvion(?)}";
        
        /*Metodos hacia la base de datos para Ciudades*/
        private static final String AgregarCiudad = "{call agregarCiudad(?,?)}";
        private static final String ListarCiudades="{?=call listarCiudades(?)}";
        private static final String ListarCiudadesPorId="{?=call listarCiudadesPorId(?)}";
        private static final String ListarCiudadesPorNombre="{?=call listarCiudadesPorNombre(?)}";
        private static final String EditarCiudad="{call editarCiudad(?,?,?)}";
        private static final String EliminarCiudad="{call eliminarCiudad(?)}";  
        
        /*Metodos hacia la base de datos para Clientes*/
        private static final String AgregarCliente="{call agregarCliente(?,?,?,?,?,?,?,?,?)}";
        private static final String BuscarCliente="{?=call buscarCliente(?,?)}";
        
        /*Metodos hacia la base de datos para Vuelos*/
        private static final String AgregarVuelo="{call agregarVuelo(?,?,?,?,?,?)}";
        /*Array Lists para devolver de la base de datos luego*/
        
        private static ArrayList aviones;
        private static ArrayList ciudades;
        private static ArrayList clientes;
        private static ArrayList vuelos;
        
        
        /*Metodos hacia la base de datos para Aviones*/
        public boolean agregarAvion(Aviones avion) throws SQLException {
        boolean resp = true;
        CallableStatement pstmt = null;
        try {
            getConnection();
            pstmt = connection.prepareCall(AgregarAvion);
            pstmt.setString(1, avion.getCodigo_Avion());
            pstmt.setString(2, avion.getModelo());
            pstmt.setInt(3, avion.getCapacidad());
            boolean resultado = pstmt.execute();
            if (resultado == true) {
                resp = false;
                throw new SQLException("No se realizo la inserción");
            }
        } catch (SQLException e) {
            resp = false;
            throw new SQLException("Llave duplicada");
        } finally {
            try {
                if (pstmt != null) {
                    pstmt.close();
                }
                connection.close();
            } catch (SQLException e) {
                resp = false;
                throw new SQLException("Estatutos invalidos o nulos");
            }
        }
        return resp;
    }
        public List<Aviones> listarAviones(String n) throws SQLException {
        ResultSet rs = null;
        aviones = new ArrayList(); 
        CallableStatement pstmt = null;
        Aviones losAviones= null;
        try {
             getConnection();
            pstmt = connection.prepareCall(ListarAviones);
            pstmt.registerOutParameter(1, OracleTypes.CURSOR);
            pstmt.setString(2, n);
            pstmt.execute();
            rs = (ResultSet) pstmt.getObject(1);
            while (rs.next()) {
                losAviones = new Aviones(rs.getString("codigo_Avion"),rs.getString("modelo"),rs.getInt("capacidad"));
                aviones.add(losAviones);
            }
        } catch (SQLException e) {
            throw new SQLException("Sentencia no valida");
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pstmt != null) {
                    pstmt.close();
                }
                connection.close();
            } catch (SQLException e) {
                throw new SQLException("Estatutos invalidos o nulos");
            }
        }
        if (aviones == null || aviones.isEmpty()) {
            throw new SQLException("No hay datos");
        }
        return aviones;
    }
        public Collection obtenerAvionPorId(String n) throws SQLException{
            ResultSet rs = null;
            aviones = new ArrayList(); 
            CallableStatement pstmt = null;
            Aviones losAviones= null;
        try {
             getConnection();
            pstmt = connection.prepareCall(ListarAvionesPorId);
            pstmt.registerOutParameter(1, OracleTypes.CURSOR);
            pstmt.setString(2, n);
            pstmt.execute();
            rs = (ResultSet) pstmt.getObject(1);
            while (rs.next()) {
                losAviones = new Aviones(rs.getString("codigo_Avion"),rs.getString("modelo"),rs.getInt("capacidad"));
                aviones.add(losAviones);
            }
        } catch (SQLException e) {
            throw new SQLException("Sentencia no valida");
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pstmt != null) {
                    pstmt.close();
                }
                connection.close();
            } catch (SQLException e) {
                throw new SQLException("Estatutos invalidos o nulos");
            }
        }
        if (aviones == null || aviones.isEmpty()) {
            throw new SQLException("No hay datos");
        }
        return aviones;
        }
        public boolean editarAvion(Aviones avion,String code) throws SQLException{
            boolean resp = true;
            CallableStatement pstmt = null;
        try {
            getConnection();
            pstmt = connection.prepareCall(EditarAvion);
            pstmt.setString(1, avion.getCodigo_Avion());
            pstmt.setString(2, avion.getModelo());
            pstmt.setInt(3, avion.getCapacidad());
            pstmt.setString(4,code);
            boolean resultado = pstmt.execute();
            if (resultado == true) {
                resp = false;
                throw new SQLException("No se realizo la actualizacion");
            }
        } catch (SQLException e) {
            resp = false;
            throw new SQLException("Llave duplicada");
        } finally {
            try {
                if (pstmt != null) {
                    pstmt.close();
                }
                connection.close();
            } catch (SQLException e) {
                resp = false;
                throw new SQLException("Estatutos invalidos o nulos");
            }
        }
        return resp;
        }
        public boolean eliminarAvion(String code) throws SQLException{
          boolean resp=true;
          CallableStatement pstmt=null;
          try{
              getConnection();
              pstmt=connection.prepareCall(EliminarAvion);
              pstmt.setString(1,code);
              boolean resultado=pstmt.execute();
              if(resultado ==true){
                  resp=false;
                  throw new SQLException("No se elimino la fila");
              }
          } catch(SQLException e){
              resp= false;
              throw new SQLException("No se");
          } finally{
              try{
                  if(pstmt!=null){
                      pstmt.close();
                  }
                  connection.close();
                  } catch (SQLException e){
                      resp=false;
                      throw new SQLException("Estatutos invalidos o nulos");
                  }
              }
          return resp;
        }
        
        /*Metodos hacia la base de datos para Ciudades*/
        public boolean agregarCiudad(Ciudades ciudad) throws SQLException {
            boolean resp = true;
            CallableStatement pstmt = null;
        try {
            getConnection();
            pstmt = connection.prepareCall(AgregarCiudad);
            pstmt.setString(1, ciudad.getCodigo());
            pstmt.setString(2, ciudad.getNombre());
            boolean resultado = pstmt.execute();
            if (resultado == true) {
                resp = false;
                throw new SQLException("No se realizo la inserción");
            }
        } catch (SQLException e) {
            resp = false;
            throw new SQLException("Llave duplicada");
        } finally {
            try {
                if (pstmt != null) {
                    pstmt.close();
                }
                connection.close();
            } catch (SQLException e) {
                resp = false;
                throw new SQLException("Estatutos invalidos o nulos");
            }
        }
        return resp;
    }
        public List<Ciudades> listarCiudades(String n) throws SQLException {
        ResultSet rs = null;
        ciudades = new ArrayList(); 
        CallableStatement pstmt = null;
        Ciudades lasCiudades= null;
        try {
            getConnection();
            pstmt = connection.prepareCall(ListarCiudades);
            pstmt.registerOutParameter(1, OracleTypes.CURSOR);
            pstmt.setString(2, n);
            pstmt.execute();
            rs = (ResultSet) pstmt.getObject(1);
            while (rs.next()) {
                lasCiudades = new Ciudades(rs.getString("codigo_ciudad"),rs.getString("nombre_ciudad"));
                ciudades.add(lasCiudades);
            }
        } catch (SQLException e) {
            throw new SQLException("Sentencia no valida");
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pstmt != null) {
                    pstmt.close();
                }
                connection.close();
            } catch (SQLException e) {
                throw new SQLException("Estatutos invalidos o nulos");
            }
        }
        if (ciudades == null || ciudades.isEmpty()) {
            throw new SQLException("No hay datos");
        }
        return ciudades;
    }
        public Collection listarCiudadesPorId(String n) throws SQLException{
            ResultSet rs = null;
            ciudades = new ArrayList(); 
            CallableStatement pstmt = null;
            Ciudades lasCiudades= null;
        try {
            getConnection();
            pstmt = connection.prepareCall(ListarCiudadesPorId);
            pstmt.registerOutParameter(1, OracleTypes.CURSOR);
            pstmt.setString(2, n);
            pstmt.execute();
            rs = (ResultSet) pstmt.getObject(1);
            while (rs.next()) {
                lasCiudades = new Ciudades(rs.getString("codigo_ciudad"),rs.getString("nombre_ciudad"));
                ciudades.add(lasCiudades);
            }
        } catch (SQLException e) {
            throw new SQLException("Sentencia no valida");
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pstmt != null) {
                    pstmt.close();
                }
                connection.close();
            } catch (SQLException e) {
                throw new SQLException("Estatutos invalidos o nulos");
            }
        }
        if (ciudades == null || ciudades.isEmpty()) {
            throw new SQLException("No hay datos");
        }
        return ciudades;
        }
        public Ciudades listarCiudadesPorNombre(String n) throws SQLException{
            ResultSet rs = null;
            ciudades = new ArrayList(); 
            CallableStatement pstmt = null;
            Ciudades lasCiudades= null;
        try {
            getConnection();
            pstmt = connection.prepareCall(ListarCiudadesPorNombre);
            pstmt.registerOutParameter(1, OracleTypes.CURSOR);
            pstmt.setString(2, n);
            pstmt.execute();
            rs = (ResultSet) pstmt.getObject(1);
            while (rs.next()) {
                lasCiudades = new Ciudades(rs.getString("codigo_ciudad"),rs.getString("nombre_ciudad"));
                ciudades.add(lasCiudades);
            }
        } catch (SQLException e) {
            throw new SQLException("Sentencia no valida");
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pstmt != null) {
                    pstmt.close();
                }
                connection.close();
            } catch (SQLException e) {
                throw new SQLException("Estatutos invalidos o nulos");
            }
        }
        if (ciudades == null || ciudades.isEmpty()) {
            throw new SQLException("No hay datos");
        }
     
        return(Ciudades) ciudades.get(0);
        }
        public boolean editarCiudad(Ciudades ciudad,String code) throws SQLException{
            boolean resp = true;
            CallableStatement pstmt = null;
        try {
            getConnection();
            pstmt = connection.prepareCall(EditarCiudad);
            pstmt.setString(1, ciudad.getCodigo());
            pstmt.setString(2, ciudad.getNombre());
            pstmt.setString(3,code);
            boolean resultado = pstmt.execute();
            if (resultado == true) {
                resp = false;
                throw new SQLException("No se realizo la actualizacion");
            }
        } catch (SQLException e) {
            resp = false;
            throw new SQLException("Llave duplicada");
        } finally {
            try {
                if (pstmt != null) {
                    pstmt.close();
                }
                connection.close();
            } catch (SQLException e) {
                resp = false;
                throw new SQLException("Estatutos invalidos o nulos");
            }
        }
        return resp;
        }
        public boolean eliminarCiudad(String code) throws SQLException{
          boolean resp=true;
          CallableStatement pstmt=null;
          try{
              getConnection();
              pstmt=connection.prepareCall(EliminarCiudad);
              pstmt.setString(1,code);
              boolean resultado=pstmt.execute();
              if(resultado ==true){
                  resp=false;
                  throw new SQLException("No se elimino la fila");
              }
          } catch(SQLException e){
              resp= false;
              throw new SQLException("No se");
          } finally{
              try{
                  if(pstmt!=null){
                      pstmt.close();
                  }
                  connection.close();
                  } catch (SQLException e){
                      resp=false;
                      throw new SQLException("Estatutos invalidos o nulos");
                  }
              }
          return resp;
        }

        /*Metodos hacia la base de datos para Clientes*/
        public boolean agregarCliente(Clientes cliente) throws SQLException{
            boolean resp = true;
            CallableStatement pstmt = null;
        try {
            getConnection();
            pstmt = connection.prepareCall(AgregarCliente);
            pstmt.setString(1, cliente.getNombre_usuario());
            pstmt.setString(2, cliente.getNombre());
            pstmt.setString(3, cliente.getApellidos());
            pstmt.setString(4, cliente.getClave());
            pstmt.setString(5, cliente.getCorreo());
            pstmt.setString(6, cliente.getNacimiento());
            pstmt.setString(7, cliente.getDireccion());
            pstmt.setString(8, cliente.getTelefono());
            pstmt.setInt(9, cliente.getTipo());
            boolean resultado = pstmt.execute();
            if (resultado == true) {
                resp = false;
                throw new SQLException("No se realizo la inserción");
            }
        } catch (SQLException e) {
            resp = false;
            throw new SQLException("Llave duplicada");
        } finally {
            try {
                if (pstmt != null) {
                    pstmt.close();
                }
                connection.close();
            } catch (SQLException e) {
                resp = false;
                throw new SQLException("Estatutos invalidos o nulos");
            }
        }
        return resp;      
        }
        public Clientes buscarCliente(Clientes cliente) throws SQLException{
            ResultSet rs = null;
            CallableStatement pstmt = null;
        try {
            getConnection();
            pstmt = connection.prepareCall(BuscarCliente);
            pstmt.registerOutParameter(1, OracleTypes.CURSOR);
            pstmt.setString(2,cliente.getNombre_usuario());
            pstmt.setString(3,cliente.getClave());
            pstmt.execute();
            rs = (ResultSet) pstmt.getObject(1);
        } catch (SQLException e) {
            throw new SQLException("Sentencia no valida");
        } 
        return llenarCliente(rs);    
        }
        public Clientes llenarCliente(ResultSet rs) throws SQLException{
            rs.next();
            Clientes cliente=new Clientes();
            cliente.setNombre_usuario(rs.getString(1));
            cliente.setNombre(rs.getString(2));
            cliente.setApellidos(rs.getString(3));
            cliente.setClave(rs.getString(4));
            cliente.setCorreo(rs.getString(5));
            cliente.setNacimiento(rs.getString(6));
            cliente.setDireccion(rs.getString(7));
            cliente.setTelefono(rs.getString(8));
            cliente.setTipo(rs.getInt(9));
            return cliente;
        }
        
        /*Metodos hacia la base de datos para Vuelos*/
        public boolean agregarVuelo(Vuelos vuelo) throws SQLException{
            boolean resp = true;
            CallableStatement pstmt = null;
        try {
            getConnection();
            pstmt = connection.prepareCall(AgregarVuelo);
            pstmt.setString(1, vuelo.getCodigo());
            pstmt.setString(2, vuelo.getOrigen().getCodigo());
            pstmt.setString(3, vuelo.getDestino().getCodigo());
            pstmt.setInt(4, vuelo.getPrecio());
            pstmt.setString(5, vuelo.getTiempo());
            pstmt.setInt(6, vuelo.getPromo());
            boolean resultado = pstmt.execute();
            if (resultado == true) {
                resp = false;
                throw new SQLException("No se realizo la inserción");
            }
        } catch (SQLException e) {
            resp = false;
            throw new SQLException("Llave duplicada");
        } finally {
            try {
                if (pstmt != null) {
                    pstmt.close();
                }
                connection.close();
            } catch (SQLException e) {
                resp = false;
                throw new SQLException("Estatutos invalidos o nulos");
            }
        }
        return resp;      
        }
}