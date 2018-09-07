
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
        <h1><font face = "calibri" size = 6 color = #FFFFFF> Iniciar sesión </font></h1>
         </div>
	
      
                         
<div class ="container nav">
    
        	<form action="adminClientes?action=loginRequest" method="post" >
		<table>
			<tr>
				<td><label><font face = "calibri" size = 4 color = #FFFFFF>Nombre de usuario: </font></label></td>
                                <td><input type="text" name="nombre_usuario"></td>
			</tr>
                        
			<tr>
				<td><label><font face = "calibri" size = 4 color = #FFFFFF>Contraseña:</font> </label></td>
                                <td><input type="password" name="contrasena"></td>
			</tr>
		</table>
	 </div>
	
		<br>
		     <button class="btn"> <i class="fa fa-fighter-jet"> </i> Login  </button>
                </br>
              
	</form>
       
          
                <br>
               <a href="paginaPrincipal?action=index" > <button class="btn"> <i class="fa fa-home"></i> Menu Principal </button> </a>
                </br>
    </body>
</html>