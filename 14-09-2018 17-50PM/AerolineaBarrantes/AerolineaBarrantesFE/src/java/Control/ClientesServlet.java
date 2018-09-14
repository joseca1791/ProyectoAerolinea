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
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelaerolineabarrantes.Clientes;

/**
 *
 * @author Jose Carlos
 */
@WebServlet(name = "adminClientes", urlPatterns = {"/adminClientes"})
public class ClientesServlet extends HttpServlet {
 ServiceAerolinea aerolineaDAO;
    
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
            case "login":
                login(request,response);
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
            case "registrarClienteNuevo":
                registrarClienteNuevo(request,response);
                break;
            case "loginRequest":
                loginRequest(request,response);
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

      private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException{
            RequestDispatcher dispatcher = request.getRequestDispatcher("/Login.jsp");
            dispatcher.forward(request, response);
    }
        
        private void loginRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException{
            Clientes cliente=new Clientes(request.getParameter("nombre_usuario"),"",
            "",(String)request.getParameter("contrasena"),"","","","",0);
            cliente=aerolineaDAO.buscarCliente(cliente);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/Principal.jsp");
            request.getSession().setAttribute("currentSessionUser", cliente);
            dispatcher.forward(request, response);
    }
        private void registrarClienteNuevo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException{
            Clientes cliente=new Clientes(request.getParameter("nombreClienteAplicacion"),request.getParameter("nombreCliente"),
            request.getParameter("apellidosCliente"),request.getParameter("claveCliente"),request.getParameter("emailCliente"),
            request.getParameter("fechaNacimientoCliente"),request.getParameter("direccionCliente"),request.getParameter("telefonoCliente"),1);
            aerolineaDAO.agregarCliente(cliente);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/Principal.jsp");
            dispatcher.forward(request, response);
    }
}
