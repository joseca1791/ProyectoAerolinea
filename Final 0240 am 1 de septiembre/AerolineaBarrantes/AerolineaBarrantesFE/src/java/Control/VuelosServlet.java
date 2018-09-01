/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Control;

import AccesoDatos.ServiceAerolinea;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelaerolineabarrantes.Ciudades;
import modelaerolineabarrantes.Vuelos;

/**
 *
 * @author Jose Carlos
 */
@WebServlet(name="adminVuelos",urlPatterns = {"/adminVuelos"})
public class VuelosServlet extends HttpServlet {
        ServiceAerolinea aerolineaDAO;

    
    public VuelosServlet(){
       super();
    }
        
    @Override
    public void init() throws ServletException {
        super.init();
        aerolineaDAO = new ServiceAerolinea();
    }
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
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
        String action=request.getParameter("action");          
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
        String action=request.getParameter("action");
            try{
            switch(action){
                case "registrarVueloNuevo":
                    registrarVueloNuevo(request,response);
                    break;
        }     
        }
        catch(SQLException e){
                e.getStackTrace();
        }     
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

	private void registrarVueloNuevo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
            String origen=request.getParameter("ciudadOrigen");
            String destino=request.getParameter("ciudadDestino");
            Ciudades ciudadOrigen=(Ciudades)aerolineaDAO.listarCiudadesPorNombre(origen);
            Ciudades ciudadDestino=(Ciudades) aerolineaDAO.listarCiudadesPorNombre(destino);
            Vuelos vuelo=new Vuelos(request.getParameter("numeroVuelo"),ciudadOrigen,ciudadDestino,
            Integer.parseInt(request.getParameter("costoVuelo")),
            request.getParameter("tiempoVuelo"),Integer.parseInt(request.getParameter("promocion")));
            aerolineaDAO.agregarVuelo(vuelo);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/Principal.jsp");
            dispatcher.forward(request, response);
        }
}