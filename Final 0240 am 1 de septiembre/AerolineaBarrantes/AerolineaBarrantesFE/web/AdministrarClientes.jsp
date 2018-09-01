<%-- 
    Document   : AdministrarClientes
    Created on : Aug 30, 2018, 12:39:42 PM
    Author     : Jose Carlos
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/estilo.css" />
           <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>Barrantes | Tu Sitio de Viajes</title>
    </head>
    <body>
        <nav>
<div class ="container nav">
        <h1><font face = "calibri" size = 6 color = #81202a>Registro de nuevos clientes</font></h1>
        </div>
		</nav> 
          <nav>
<div class ="container nav">
        <form id="AgregarAvion" action="adminClientes?action=registrarClienteNuevo" method="post">
        <table border="1" width="50%">
          
            <br>
                    <label><font face = "calibri" size = 6 color = #81202a>Usuario:</font> </label>
                    <input type="text" name="nombreClienteAplicacion" id="nombreClienteAplicacion" required/>
                    </br>
            
            
                  <br>
                    <label><font face = "calibri" size = 6 color = #81202a>Nombre: </font></label>
                    <input type="text" name="nombreCliente" id="nombreCliente" required/>
                
            </br>
           
                 <br>
                    <label><font face = "calibri" size = 6 color = #81202a>Apellidos:</font> </label>
                    <input type="text" name="apellidosCliente" id="apellidosCliente" required/>
                
            
            </br>
               <br>
                    <label><font face = "calibri" size = 6 color = #81202a>Clave:</font> </label>
                    <input type="password" name="claveCliente" id="claveCliente" required/>
                </br>
             <br>
                
                    <label><font face = "calibri" size = 6 color = #81202a>Correo:</font> </label>
                    <input type="email" name="emailCliente" id="emailCliente" required/>
                
            </br>
                <br>
                    <label><font face = "calibri" size = 6 color = #81202a>Fecha Nacimiento:</font> </label>
                    <input type="time" name="fechaNacimientoCliente" id="fechaNacimientoCliente" required/>
               
             </br>
             <br>
                
                    <label><font face = "calibri" size = 6 color = #81202a>Dirección:</font> </label>
                    <input type="text" name="direccionCliente" id="direccionCliente" required/>
                           </br>
  <br>
             
               
                    <label><font face = "calibri" size = 6 color = #81202a>Telefono:</font> </label>
                    <input type="tel" name="telefonoCliente" id="telefonoCliente" required/>
                       </br>             
                       
        </table>
             </div>
		</nav> 
            
            <br>
       <button class="btn"> <i class="fa fa-check"> </i> Registrarme  </button>
       </br>
       
        </form>   
        
        
		<br>  
   
                        <td align="center"> <a href="adminClientes?action=login"><button class="btn"> <i class="fa fa-user"></i>Iniciar Sesión</button></a><font face = "calibri" size = 6 color = #81202a> ¿Ya es miembro?</font></td>
		    
           
                
                </br>
	
                        
                        <br>
        
        <a href="paginaPrincipal?action=index" > <button class="btn"> <i class="fa fa-home"></i> Menu Principal </button> </a>
        
        </br>
    </body>
</html>
