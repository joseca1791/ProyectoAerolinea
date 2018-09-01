<%-- 
    Document   : Administrar Aviones
    Created on : Aug 28, 2018, 7:14:20 PM
    Author     : Jose Carlos
--%>
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
<div class ="container nav">
        <h1> <font face = "calibri" size = 6 color = #81202a>Mantenimiento de  Aviones </font> </h1>
          </div>
		</nav> 
               
          

	<table id="customers" border="1" width="50%">
		<tr>
		 <th><font face = "calibri" size = 6 color = #81202a> Codigo Avion  </font></th>
		 <th><font face = "calibri" size = 6 color = #81202a> Modelo  </font></th>
		 <th><font face = "calibri" size = 6 color = #81202a>Capacidad</font> </th>
		 <th colspan=2 align="center"><font face = "calibri" size = 6 color = #81202a>Modificar</font></th>
		</tr>
		<c:forEach var="aviones" items="${lista}">
			<tr>
                            <td><font face = "calibri" size = 6 color = #81202a><c:out value="${aviones.codigo_Avion}"/></font></td>
				<td><font face = "calibri" size = 6 color = #81202a><c:out value="${aviones.modelo}"/></font></td>
				<td><font face = "calibri" size = 6 color = #81202a><c:out value="${aviones.capacidad}"/></font></td>
				<td><a href="adminAviones?action=editarAvion&codigoAvion=<c:out value="${aviones.codigo_Avion}" />"> <button class="btn"> <i class="fa fa-edit"></i> Editar</button></a></td>
				<td><a href="adminAviones?action=eliminarAvion&codigoAvion=<c:out value="${aviones.codigo_Avion}"/>"><button class="btn"> <i class="fa fa-trash"></i> Eliminar</button></a>  </td>				
			</tr>
		</c:forEach>
	</table>    
                <br>
            
		
			 <a href="adminAviones?action=administrarAviones"> <button class="btn"> <i class="fa fa-plus"></i> Nuevo  </button> </a> 		
                         </br>
	  
           <br>
                <a href="paginaPrincipal?action=index" > <button class="btn"> <i class="fa fa-home"></i> Menu Principal </button> </a>
            </br>    
    </body>
</html>
