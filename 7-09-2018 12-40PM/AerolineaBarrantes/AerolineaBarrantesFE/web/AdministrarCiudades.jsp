
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  
  
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
<div class ="container nav" style="overflow-x:auto;">
        <h1> <font face = "calibri" size = 6 color = #FFFFFF> Mantenimiento de  Ciudades </font> </h1>
       
     </div>
     </nav> 
           

	 <div class="tableVuelos" style="overflow-x:auto;">
                        <table align="center" style="width:50%">
		 <tr>
		 <th><font face = "calibri" size = 4 color = #FFFFFF> C�digo </font></th>
		 <th><font face = "calibri" size = 4 color = #FFFFFF> Nombre </font></th>
		 <th colspan=2 align="center"><font face = "calibri" size = 4 color = #FFFFF></font></th>
		 </tr>


		<c:forEach var="ciudades" items="${lista}">
			<tr>
				<td><font face = "calibri" size = 4 color = #FFFFFF ><c:out value="${ciudades.codigo}"/></font></td>
				<td><font face = "calibri" size = 4 color = #FFFFFF ><c:out value="${ciudades.nombre}"/></font></td>
				<td><a href="adminCiudades?action=editarCiudad&codigoCiudad=<c:out value="${ciudades.codigo}" />"><button class="btn"> <i class="fa fa-edit"></i>Editar</button></a></td>
				<td><a href="adminCiudades?action=eliminarCiudad&codigoCiudad=<c:out value="${ciudades.codigo}"/>"><button class="btn"> <i class="fa fa-trash"></i>Eliminar</button></a> </td>				
			</tr>
		</c:forEach>
	</table>  
         </div>  
        
                <br>  
                   <a  href="adminCiudades?action=administrarCiudades"> <button class="btn"> <i class="fa fa-plus"></i> Nuevo  </button> </a> 
                </br>
	
             <br>
                <a href="paginaPrincipal?action=index" > <button class="btn"> <i class="fa fa-home"></i> Menu Principal </button> </a>
            </br>       
              
                
    </body>
</html>
