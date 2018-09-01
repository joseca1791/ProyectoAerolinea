<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/estilo.css" />
           <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Barrantes | Tu Sitio de Viajes</title>
</head>
<body>
<h1> <font face = "calibri" size = 6 color = #81202a>Editar Avión</font></h1>
	<form action="adminAviones?action=confirmarEditarAvion" method="post" >
		<table>
                        <tr>
				<td><label> <font face = "calibri" size = 6 color = #81202a>Codigo de Avión original: </font> </label></td>
				<td><input type="text" name="codigoOriginal" value=" <c:out value="${avion.codigo_Avion}"></c:out>" readonly="readonly"></td>
			</tr>                       

			<tr>
				<td><label><font face = "calibri" size = 6 color = #81202a>Codigo de Avión nuevo: </font> </label></td>
				<td><input type="text" name="codigoAvion" value="<c:out value="${avion.codigo_Avion}"></c:out>" ></td>
			</tr>
			<tr>
				<td><label><font face = "calibri" size = 6 color = #81202a>Modelo nuevo: </font> </label></td>
				<td><input type="text" name="modeloAvion" value='<c:out value="${avion.modelo}"></c:out>' ></td>
			</tr>
			<tr>
				<td><label><font face = "calibri" size = 6 color = #81202a> Capacidad nueva: </font> </label></td>
                                <td><input type="text" name="capacidadAvion" value='<c:out value="${avion.capacidad}"></c:out>' ></td>
			</tr>
		</table>
                        <br>
		 <button class="btn"> <i class="fa fa-check"> </i> Aceptar edición  </button>
                </br>
	</form>

</body>
</html>

