
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
        
<div class ="container nav" style="overflow-x:auto;">
        <h1><font face = "calibri" size = 6 color = #FFFFFF >Registro de nuevos clientes</font></h1>
        </div>
        
        
        
        
    
<div class ="container nav">
        <form id="AgregarAvion" action="adminClientes?action=registrarClienteNuevo" method="post">
        <table border="1" width="50%">
          
            <br>
                    <label><font face = "calibri" size = 4 color = #FFFFFF>Usuario:</font> </label>
                    <input type="text" name="nombreClienteAplicacion" id="nombreClienteAplicacion" required/>
            </br>
            
            
             <br>
                    <label><font face = "calibri" size = 4 color = #FFFFFF>Nombre: </font></label>
                    <input type="text" name="nombreCliente" id="nombreCliente" required/>
                
            </br>
           
             <br>
                    <label><font face = "calibri" size = 4 color = #FFFFFF>Apellidos:</font> </label>
                    <input type="text" name="apellidosCliente" id="apellidosCliente" required/>
               
            </br>
            
            
            <br>
                    <label><font face = "calibri" size = 4 color = #FFFFFF>Clave:</font> </label>
                    <input type="password" name="claveCliente" id="claveCliente" required/>
            </br>
            
            
             <br>
             
                    <label><font face = "calibri" size = 4 color = #FFFFFF>Correo:</font> </label>
                    <input type="email" name="emailCliente" id="emailCliente" required/>
                
            </br>
                <br>
                    <label><font face = "calibri" size = 4 color = #FFFFFF>Fecha Nacimiento:</font> </label>
                    <input type="time" name="fechaNacimientoCliente" id="fechaNacimientoCliente" required/>
               
             </br>
             
             <br>
                
                    <label><font face = "calibri" size = 4 color = #FFFFFF>Dirección:</font> </label>
                    <input type="text" name="direccionCliente" id="direccionCliente" required/>
             </br>
             
             <br>
             
                    <label><font face = "calibri" size = 4 color =#FFFFFF>Telefono:</font> </label>
                    <input type="tel" name="telefonoCliente" id="telefonoCliente" required/>
             </br>             
           
             
             
        </table>
        </div>

            
            <br>
                   <button class="btn"> <i class="fa fa-check"> </i> Registrarme  </button>
            </br>
       
        </form>   
        
        
		<br> 
                        <td align="center"> <a href="adminClientes?action=login"><button class="btn"> <i class="fa fa-user"></i>Iniciar Sesión</button></a><font face = "calibri" size = 5 color = #FFFFFF> ¿Ya es miembro?</font></td>
		
                </br>
	
                        
                <br>
        
                        <a href="paginaPrincipal?action=index" > <button class="btn"> <i class="fa fa-home"></i> Menu Principal </button> </a>
        
                </br>
   


</body>
</html>
