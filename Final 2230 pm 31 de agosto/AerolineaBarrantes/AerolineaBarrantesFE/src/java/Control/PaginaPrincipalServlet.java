/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Control;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modelaerolineabarrantes.Aviones;
import modelaerolineabarrantes.Ciudades;
import AccesoDatos.ServiceAerolinea;
/**
 *
 * @author Jose Carlos
 */
@WebServlet(name="paginaPrincipal",urlPatterns = {"/paginaPrincipal"})
public class PaginaPrincipalServlet extends HttpServlet {
        ServiceAerolinea aerolineaDAO;
        
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
        try (PrintWriter out = response.getWriter()) {
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
//        aerolineaDAO=new ServiceAerolinea();
        String action=request.getParameter("action");
        try{
            switch(action){
                case "index":
                    index(request,response);
                    break;
                case "mantenimientoAviones":
                    mantenimientoAviones(request,response);
                    break;
                case "mantenimientoCiudades":
                    mantenimientoCiudades(request,response);
                    break;
                case "mantenimientoClientes":
                    mantenimientoClientes(request,response);
                    break;
                case "mantenimientoVuelos":
                    mantenimientoVuelos(request,response);
                    break;
            }
        }
        catch(Exception e){
            e.getStackTrace();
        }
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

    private void mantenimientoAviones(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
                RequestDispatcher dispatcher = request.getRequestDispatcher("/AdministrarAviones.jsp");
                List<Aviones> listaAviones= (List<Aviones>) aerolineaDAO.listarAviones("a");
		request.setAttribute("lista", listaAviones);
		dispatcher.forward(request, response); 
    }

    private void mantenimientoCiudades(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException{
                RequestDispatcher dispatcher = request.getRequestDispatcher("/AdministrarCiudades.jsp");
                List<Ciudades> listaCiudades= (List<Ciudades>) aerolineaDAO.listarCiudades("a");
		request.setAttribute("lista", listaCiudades);
		dispatcher.forward(request, response); 
    }

    private void mantenimientoClientes(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException{
                RequestDispatcher dispatcher = request.getRequestDispatcher("/AdministrarClientes.jsp");
                dispatcher.forward(request, response); 
    }
    
    private void index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
                RequestDispatcher dispatcher = request.getRequestDispatcher("/Principal.jsp");
		dispatcher.forward(request, response);    
    }
    
    private void mantenimientoVuelos(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException{
		RequestDispatcher dispatcher = request.getRequestDispatcher("/AdministrarVuelos.jsp");
                List<Ciudades> ciudades=aerolineaDAO.listarCiudades("n");
                request.setAttribute("ciudades", ciudades);
		dispatcher.forward(request, response);    
    }
    
    
}
