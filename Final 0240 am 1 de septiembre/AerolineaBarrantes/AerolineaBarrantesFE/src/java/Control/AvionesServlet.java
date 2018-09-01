/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Control;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modelaerolineabarrantes.Aviones;
import AccesoDatos.ServiceAerolinea;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.RequestDispatcher;

/**
 *
 * @author Jose Carlos
 */

@WebServlet(name="adminAviones",urlPatterns = {"/adminAviones"})
public class AvionesServlet extends HttpServlet {
    ServiceAerolinea aerolineaDAO;

    public AvionesServlet(){
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
        try{
        switch(action){
            case "administrarAviones":
                administrarAviones(request,response);
                break;
            case "editarAvion":
                editarAvion(request,response);
                break;                  
            case "eliminarAvion":
                eliminarAvion(request,response);
                break;
        }     
        }
        catch(SQLException e){
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
        String action=request.getParameter("action");
        try{
        switch(action){
            case "registrarAvionNuevo":
                registrarAvionNuevo(request,response);
                break;  
            case "confirmarEditarAvion":
                confirmarEditarAvion(request,response);
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

	private void administrarAviones(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/AvionNuevo.jsp");
		dispatcher.forward(request, response);
	}
        private void registrarAvionNuevo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException{
                Aviones avion=new Aviones(request.getParameter("codigoAvion"),request.getParameter("modeloAvion"),Integer.parseInt(request.getParameter("capacidadAvion")));
                aerolineaDAO.agregarAvion(avion);
                RequestDispatcher dispatcher = request.getRequestDispatcher("/AdministrarAviones.jsp");
                List<Aviones> listaAviones= (List<Aviones>) aerolineaDAO.listarAviones("a");
		request.setAttribute("lista", listaAviones);
		dispatcher.forward(request, response);
        }
        private void editarAvion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		List<Aviones> listaAviones=(List<Aviones>) aerolineaDAO.obtenerAvionPorId(request.getParameter("codigoAvion"));
		request.setAttribute("avion", listaAviones.get(0));
		RequestDispatcher dispatcher = request.getRequestDispatcher("/EditarAvion.jsp");
		dispatcher.forward(request, response);
	}
        private void confirmarEditarAvion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
                Aviones avion= new Aviones(request.getParameter("codigoAvion"),request.getParameter("modeloAvion"),Integer.parseInt(request.getParameter("capacidadAvion")));
                String codigoOriginal=request.getParameter("codigoOriginal").trim();
                aerolineaDAO.editarAvion(avion,codigoOriginal);
                RequestDispatcher dispatcher = request.getRequestDispatcher("/AdministrarAviones.jsp");
                List<Aviones> listaAviones= (List<Aviones>) aerolineaDAO.listarAviones("a");
		request.setAttribute("lista", listaAviones);
		dispatcher.forward(request, response);
        }
        private void eliminarAvion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException{
                String code=request.getParameter("codigoAvion");
                aerolineaDAO.eliminarAvion(code);
                RequestDispatcher dispatcher = request.getRequestDispatcher("/AdministrarAviones.jsp");
                List<Aviones> listaAviones= (List<Aviones>) aerolineaDAO.listarAviones("a");
		request.setAttribute("lista", listaAviones);
                dispatcher.forward(request, response);
        }  
}
