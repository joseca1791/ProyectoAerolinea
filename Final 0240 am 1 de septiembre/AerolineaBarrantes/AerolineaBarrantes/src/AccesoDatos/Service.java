/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AccesoDatos;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Service {

    protected static Connection connection = null;

    public Service() {
    }

    public static void getConnection(String url, String user, String pass){
            try {
            String URL_conexion = url;
            String username = user;
            String password = pass;
            Class.forName(MANEJADOR_DB).newInstance();
            connection = DriverManager.getConnection(URL_conexion, username, password);
        } catch (ClassNotFoundException | IllegalAccessException | InstantiationException | SQLException e) {
            System.err.println(e.getMessage());
            System.exit(-1);
        }
    }
    
    public static void getConnection() {
        try {
            String URL_conexion = "jdbc:oracle:thin:@localhost:1521:xe";
            String username = "jose";
            String password = "josetati1";
            Class.forName(MANEJADOR_DB).newInstance();
            connection = DriverManager.getConnection(URL_conexion, username, password);
        } catch (ClassNotFoundException | IllegalAccessException | InstantiationException | SQLException e) {
            System.err.println(e.getMessage());
            System.exit(-1);
        }
    }

    public static void closeConnection() throws Exception {
        if (connection == null) {
            throw new Exception("No se ha encontrado conexion.", null);
        } else {
            try {
                connection.close();
                connection = null;
            } catch (SQLException e) {
                throw new SQLException("Error al cerrar la conexion.", e);
            }
        }
    }

    private static final String MANEJADOR_DB = "oracle.jdbc.OracleDriver";
}
