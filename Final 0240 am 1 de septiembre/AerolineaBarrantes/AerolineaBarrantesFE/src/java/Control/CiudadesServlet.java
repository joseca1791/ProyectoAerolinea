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

import modelaerolineabarrantes.Ciudades;
import AccesoDatos.ServiceAerolinea;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import modelaerolineabarrantes.Clientes;

/**
 *
 * @author Jose Carlos
 */
@WebServlet(name = "adminCiudades", urlPatterns = {"/adminCiudades"})
public class CiudadesServlet extends HttpServlet {
    ServiceAerolinea aerolineaDAO;
    
        public CiudadesServlet(){
        super();
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
    
            @Override
    public void init() throws ServletException {
        super.init();
        aerolineaDAO = new ServiceAerolinea();
    }
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
        try{
        switch(action){
            case "administrarCiudades":
                administrarCiudades(request,response);
                break;
            case "editarCiudad":
                editarCiudad(request,response);
                break;
            case "eliminarCiudad":
                eliminarCiudad(request,response);
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
            case "registrarCiudadNueva":
                registrarCiudadNueva(request,response);
                break;  
            case "confirmarEditarCiudad":
                confirmarEditarCiudad(request,response);
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

	private void administrarCiudades(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/CiudadNueva.jsp");
		dispatcher.forward(request, response);
	}
        private void registrarCiudadNueva(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException{
                Ciudades ciudad=new Ciudades(request.getParameter("codigoCiudad"),request.getParameter("nombreCiudad"));
                aerolineaDAO.agregarCiudad(ciudad);
                RequestDispatcher dispatcher = request.getRequestDispatcher("/AdministrarCiudades.jsp");
                List<Ciudades> listaCiudades= (List<Ciudades>) aerolineaDAO.listarCiudades("a");
		request.setAttribute("lista", listaCiudades);
		dispatcher.forward(request, response);
        }
        private void editarCiudad(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		List<Ciudades> listaCiudades=(List<Ciudades>) aerolineaDAO.listarCiudadesPorId(request.getParameter("codigoCiudad"));
		request.setAttribute("ciudad", listaCiudades.get(0));
		RequestDispatcher dispatcher = request.getRequestDispatcher("/EditarCiudad.jsp");
		dispatcher.forward(request, response);
	}
        private void confirmarEditarCiudad(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
                Ciudades ciudad=new Ciudades(request.getParameter("codigoCiudad"),request.getParameter("nombreCiudad"));
                String codigoOriginal=request.getParameter("codigoOriginal").trim();
                aerolineaDAO.editarCiudad(ciudad,codigoOriginal);
                RequestDispatcher dispatcher = request.getRequestDispatcher("/AdministrarCiudades.jsp");
                List<Ciudades> listaCiudades= (List<Ciudades>) aerolineaDAO.listarCiudades("a");
		request.setAttribute("lista", listaCiudades);
		dispatcher.forward(request, response);
        }
        private void eliminarCiudad(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException{
                String code=request.getParameter("codigoCiudad");
                aerolineaDAO.eliminarCiudad(code);
                RequestDispatcher dispatcher = request.getRequestDispatcher("/AdministrarCiudades.jsp");
                List<Ciudades> listaCiudades= (List<Ciudades>) aerolineaDAO.listarCiudades("a");
		request.setAttribute("lista", listaCiudades);
		dispatcher.forward(request, response);
        }    
      
}
