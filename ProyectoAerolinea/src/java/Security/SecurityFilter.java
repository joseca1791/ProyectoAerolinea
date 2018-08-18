package Security;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import javax.servlet.DispatcherType;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import Model.Cliente;

/**
 *
 * @author Greivin
 */
@WebFilter(filterName = "PurchaseFilter", urlPatterns = {"/*"}, dispatcherTypes = {DispatcherType.REQUEST}, initParams = {
    @WebInitParam(name = "TipoUsuario", value = "1")})
public class SecurityFilter implements Filter {

    List<String> clientActions = Arrays.asList("/Servlet_comprar");//Solo esto lo puede hacer un cliente
    List<String> managerActions = Arrays.asList("/ManagerAvion.jsp","/ManagerCiudad.jsp","/ManagerViaje.jsp","/ManagerCiudad.jsp","/ManagerVuelo.jsp");// Solo esto lo puede hacer un manager
    
    List<String>[] userActions;//Esto lo puede hacer cualquiera
    
    public SecurityFilter() {
        userActions = (List<String>[]) new List[3];
        userActions[1]=clientActions; 
        userActions[2]=managerActions;
    }    
    
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
        
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;
        HttpSession ses = req.getSession();
        String LOGIN= "/ProyectoAerolinea/IniciarSesion.jsp";
        String SEGURIDAD = "/ProyectoAerolinea/Seguridad.jsp";
        
        
        String uri= req.getRequestURI().substring(req.getContextPath().length());
        
        if (uri.equals("/Servlet")){// Si es un servlet
            String action = request.getParameter("action");
            if (action==null){
                resp.sendRedirect(SEGURIDAD);
            }
            uri = uri+"_"+action;
        }
        
        if (!(userActions[1].contains(uri) || userActions[2].contains(uri) )){ // es de acceso a cualquiera ? 
            chain.doFilter(request,response);
        }
        else {  // acesso restringido
             Cliente user = (Cliente)ses.getAttribute("user");
             if(user==null){
                 resp.sendRedirect(LOGIN);//Si no hay cliente, se va al login
             }
             else{
                 if (userActions[user.getTipo()].contains(uri)){    //La accion si es permitida
                     chain.doFilter(request,response);
                 }
                 else{
                     resp.sendRedirect(SEGURIDAD);  //Se va  a la SEGURIDAD
                 }
            }
        }
    }

    public void destroy() {        
    }

    public void init(FilterConfig filterConfig) {        
    }

}

