/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/*

RuntimeTypeAdapterFactory tomado de:
https://github.com/google/gson/blob/master/extras/src/main/java/com/google/gson/typeadapters/RuntimeTypeAdapterFactory.java

*/
package Control;

/**
 *
 * @author Jose Carlos
 */

import AccesoDatos.ServiceAerolinea;
import ModeloNegocio.*;
import com.google.gson.*;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonElement;
import com.google.gson.reflect.TypeToken;
import com.google.gson.typeadapters.RuntimeTypeAdapterFactory;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Type;//
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name="Servlet", urlPatterns = {"/Servlet"})

public class AerolineaServlet extends HttpServlet{
    
    static private ServiceAerolinea dao;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        try (PrintWriter out = response.getWriter()) {

            response.setContentType("text/xml");
            RuntimeTypeAdapterFactory<Jsonable> rta = RuntimeTypeAdapterFactory.of(Jsonable.class,"_class")
            .registerSubtype(Ciudad.class,"Ciudad")
            .registerSubtype(Cliente.class,"Cliente")
            .registerSubtype(Avion.class,"Avion")
            .registerSubtype(Viaje.class,"Viaje")
            .registerSubtype(Pasajero.class,"Pasajero")
            .registerSubtype(Reservacion.class,"Reservacion")
            .registerSubtype(Tiquete.class,"Tiquete")
            .registerSubtype(Vuelo.class,"Vuelo");
            Gson gson = new GsonBuilder().registerTypeAdapterFactory(rta).setDateFormat("dd/MM/yyyy").create();
            String json;
            String criteria;
            int deleted;
            String accion = request.getParameter("action");
            System.out.println(accion);
            
            List<Ciudad> ciudades = new ArrayList();
            List<Vuelo> vuelos= new ArrayList();
            List<Avion> aviones= new ArrayList();
            List<Viaje> viajes= new ArrayList();
            Cliente cliente1;
            
            switch(accion){
                
                case "ciudadListAll":
                   ciudades = (List<Ciudad>) dao.getCiudadesTodas();
                   json = gson.toJson(ciudades);
                   out.write(json);
                    break;  
                    
                case "todosVuelos":
                    vuelos = (List<Vuelo>) dao.getVuelosTodos();
                    json = gson.toJson(vuelos);
                    out.write(json);                    
                    break;
                    
                case "todosAviones":
                    aviones = (List<Avion>) dao.getAvionesTodos();
                    json= gson.toJson(aviones);
                    out.write(json);
                    break;
                    
                case "getCiudadesNombre":
                    
                    criteria = request.getParameter("criteria");
                    ciudades = (List<Ciudad>) dao.getCiudadesNombre(criteria.toUpperCase());
                    json = gson.toJson(ciudades);
                    out.write(json);
                    break;
                    
                case "getCiudadesCodigo":
                    
                    criteria = request.getParameter("criteria");
                    ciudades = (List<Ciudad>) dao.getCiudadesCodigo(criteria.toUpperCase());
                    json = gson.toJson(ciudades);
                    out.write(json);
                    break;
                    
                case "getViajesCodigo":
                        
                    criteria = request.getParameter("criteria");
                    viajes = (List<Viaje>) dao.getViajesCodigo(criteria.toUpperCase());
                    json = gson.toJson(viajes);
                    out.write(json);
                    break;
                        
                case "getViajesFecha":
                    criteria = request.getParameter("criteria");
                    viajes = (List<Viaje>) dao.getViajesFecha(criteria);
                    json = gson.toJson(viajes);
                    out.write(json);
                    break;
                        
                        
                case "getVueloCodigo":
                    criteria = request.getParameter("criteria");
                    vuelos = (List<Vuelo>)dao.vueloBusquedaCodigo(criteria.toUpperCase());
                    json = gson.toJson(vuelos);
                    out.write(json);
                        
                    break;
                
                case "vueloListPromo":

                    vuelos = (List<Vuelo>) dao.getPromo();
                    json = gson.toJson(vuelos);
                    out.write(json);
                    break;
                    
                case "vueloListVuelos":
                   vuelos = dao.vuelosAMostrar();
                    json = gson.toJson(vuelos);
                    out.write(json);
                    break;                   
                    
                case "viajeSoloIDA":
                    
                    json = request.getParameter("origen");
                    Ciudad origen = gson.fromJson(json, Ciudad.class);
                    json = request.getParameter("destino");
                    Ciudad destino = gson.fromJson(json, Ciudad.class);
                    String fecha = request.getParameter("fecha");
                    viajes = dao.getViajesDisponibles(origen,destino,fecha);
                    json = gson.toJson(viajes);
                    out.write(json);
                    break;
                    
                    
                case "viajeRegreso":
                    json = request.getParameter("origen");
                    Ciudad origen1 = gson.fromJson(json, Ciudad.class);
                    json = request.getParameter("destino");
                    Ciudad destino1 = gson.fromJson(json, Ciudad.class);
                    String fecha1 = request.getParameter("fecha");
                    viajes = dao.getViajesDisponibles(origen1, destino1, fecha1);
                    json = gson.toJson(viajes);
                    out.write(json);
                    break;
                    
                case "viajeAmbos":
                    json = request.getParameter("origen");
                    Ciudad cOrigen = gson.fromJson(json,Ciudad.class);
                    json = request.getParameter("destino");
                    Ciudad cDestino = gson.fromJson(json, Ciudad.class);
                    String fechaIda = request.getParameter("fechaIda");
                    viajes = dao.getViajesDisponibles(cOrigen,cDestino,fechaIda);
                    json = gson.toJson(viajes);
                    out.write(json);
                    break;
                    
                case "userLogin":
                    json = request.getParameter("user"); 
                    Cliente cliente= gson.fromJson(json, Cliente.class); 
                    cliente = dao.userLogin(cliente);
                    
                    if(cliente.getTipo()!=0){
                        request.getSession().setAttribute("user", cliente);
                        
                        switch(cliente.getTipo()){
                            case 1://Cliente
                                System.out.println(cliente.getNombre());
                                System.out.println(cliente.getTipo());
                                break;
                            case 2://manager
                                System.out.println(cliente.getNombre());
                                System.out.println(cliente.getTipo());
                                break;
                        }
                    }
                        json=gson.toJson(cliente);
                        out.write(json);                    
                        break;//break del userLogin
            
                case "userLogout":
                    request.getSession().removeAttribute("user");
                    request.getSession().invalidate();
                     break;       
                     
                 case "clientGet":
                    
                    cliente1 = (Cliente)request.getSession().getAttribute("user");
                    json = gson.toJson(cliente1); 
                    out.write(json);
                    
                    break;     
                     
                case "SignIn":
                    json= request.getParameter("user");
                    Cliente client = gson.fromJson(json,Cliente.class);
                    client = dao.signIn(client);
                    
                    if(client.getTipo()!=0){
                        request.getSession().setAttribute("user", client);
                        
                        switch(client.getTipo()){
                            case 1://Cliente
                                System.out.println(client.getNombre());
                                System.out.println(client.getTipo());
                                break;
                            case 2://manager
                                System.out.println(client.getNombre());
                                System.out.println(client.getTipo());
                                break;
                        }
                    }
                        json=gson.toJson(client);
                        out.write(json);  
                        break;
                     
                case "newCiudad":
                    json = request.getParameter("ciudad"); 
                    Ciudad ciudad= gson.fromJson(json,Ciudad.class);
                    if(dao.newCiudad(ciudad)){
                        out.write(json);
                    }else{
                        json = "no";
                    }
                    out.write(json);
                    break;
                    
                    
                case "eliminarCiudad":
                    json = request.getParameter("codigo");
                    deleted = dao.eliminarCiudad(json);
                    out.write((deleted==1)?"0":"1");
                    
                    break;
                    
                case "eliminarVuelo":
                    json = request.getParameter("codigo");
                    deleted = dao.eliminarVuelo(json); 
                    out.write((deleted==1)?"0":"1");
                    
                    break;
                    
                case "eliminarViaje":
                    json = request.getParameter("codigo");
                    deleted = dao.eliminarViaje(json);
                    out.write((deleted==1)?"0":"1");
                    
                    break;
                    
                case "newVuelo":
                    
                    json = request.getParameter("vuelo");
                   Vuelo vuelo = gson.fromJson(json, Vuelo.class);
                    int inserted = dao.newVuelo(vuelo);
                    out.write((inserted==1)?"0":"1");
                    break;
                        
                case "newViaje":
                    json = request.getParameter("viaje");
                    Viaje viaje = gson.fromJson(json, Viaje.class);
                    
                    if(dao.newViaje(viaje)){
                        json = "yes";
                    }else{
                        json= "no";
                    }
                    out.write(json);

                    break;
                    
                case "comprar":
                        json = request.getParameter("viaje");
                        
                        Type type = new TypeToken<List<Viaje>>(){}.getType();
                        List<Viaje> losViajes = gson.fromJson(json, type);
                        json = request.getParameter("cliente");
                        Cliente client1 = gson.fromJson(json, Cliente.class); 
                        
                        List<Reservacion> reservaciones = new ArrayList<Reservacion>();
                        
                        for(int i = 0; i<losViajes.size(); i++){
                        Reservacion reservacion = new Reservacion();
                        dao.crearReservacion(losViajes.get(i), client1,reservacion);//Se crea la RESERVACIÓN
                        reservaciones.add(reservacion);
                        }
                                              
                      json=gson.toJson(reservaciones);
                      out.write(json);
                        
                    break;
                    
                case "crearTiquetes":
                        json = request.getParameter("reservaciones");
                        Type reservas = new TypeToken<List<Reservacion>>(){}.getType();
                        List<Reservacion> lasReservaciones = gson.fromJson(json, reservas); // Las reservaciones hechas por el usuario
                                            
                        json = request.getParameter("pasajeros");
                        Type pasantes = new TypeToken<List<Pasajero>>(){}.getType();
                        List<Pasajero> losPasajeros = gson.fromJson(json,pasantes); //Los viajeros que van a ir a esas reservaciones
                        
                        List<Tiquete> tiquetes = new ArrayList<Tiquete>();
                        
                        for(int i = 0; i<lasReservaciones.size(); i++){
                            
                            for(int j = 0; j<losPasajeros.size(); j++){
                                
                                Tiquete tiquete = new Tiquete();
                                dao.crearTiquete(losPasajeros.get(j), lasReservaciones.get(i), tiquete);
                                tiquetes.add(tiquete);
                                
                            }//For de los Pasajeros
                            
                            
                        }//For De las reservaciones
                        request.getSession().setAttribute("tiquetes", tiquetes);
                        json=gson.toJson(tiquetes);
                        out.write(json);
                        
                        break;
                    
                case "actualizarVuelo":
                        json = request.getParameter("vuelo");
                        Vuelo vuelo1 = gson.fromJson(json, Vuelo.class);
                
                        if(dao.actualizarVuelo(vuelo1)){
                             json = "yes";
                            }else{
                                json = "no";
                        }
                            out.write(json);
                            break;

                case "newAvion":
                    json = request.getParameter("avion"); 
                    Avion avion= gson.fromJson(json,Avion.class);
                    if(model.newAvion(avion)){
                        json = "yes";  
                    }else{
                        json = "no";    
                    }
                    out.write(json);
                    break;
                    
                case "getAvion":
                    json = request.getParameter("criteria");
                    Avion avion1 = new Avion();
                     avion1 = dao.avionBusquedaCodigo(json);
                     
                     if(avion1 != null){
                         json =  gson.toJson(avion1);
                         out.write(json);
                     }else{
                         out.write("null");
                     } 
                    break;
                    
                case "actualizarAvion":
                    json = request.getParameter("avion");
                    Avion v = gson.fromJson(json, Avion.class);

                    if(dao.actualizarAvion(v)){
                         json = "yes";
                        }else{
                            json = "no";
                    }
                        out.write(json);

                        break;
                        
                
            }
            
        }
        catch(Exception e){
            System.out.println(e);  
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    
    @Override
    public void init() throws ServletException{
        super.init();
        dao = new ServiceAerolinea();
    }   
    
}
