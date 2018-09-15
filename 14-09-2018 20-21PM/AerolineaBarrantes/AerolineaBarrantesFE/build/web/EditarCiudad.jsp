<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/estilo.css" />
           <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
           <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
 
<title>Barrantes | Tu Sitio de Viajes</title>
</head>
<body>
    
    <nav class="navbar navbar-expand-md navbar-dark" style="background-color: #555" style="width: 100%">
  <!-- Brand -->
  <!-- Toggler/collapsibe Button -->
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
    <span class="navbar-toggler-icon"></span>
  </button>

  <!-- Navbar links -->
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
    <ul class="navbar-nav navIcons">
      <li class="nav-item ">
            <a class="nav-link navIcons text-white" style='margin-left: 30px' href="paginaPrincipal?action=mantenimientoAviones"><i class="fa fa-plane"> Aviones</i></a>
      </li>
      <li class="nav-item">
            <a class="nav-link navIcons text-white" href="paginaPrincipal?action=mantenimientoCiudades"><i class="fa fa-building"> Ciudades </i></a>
      </li>
      <li class="nav-item">
            <a class="nav-link navIcons text-white" href="paginaPrincipal?action=mantenimientoVuelos"><i class="fa fa-road"> Vuelos</i></a>
      </li> 
      <li class="nav-item">
            <a class="nav-link navIcons text-white" href="paginaPrincipal?action=listarVuelos"><i class="fa fa-ticket"> Tiquetes</i></a>
      </li> 
      <li class="nav-item">
            <a class="nav-link navIcons text-white" href="adminClientes?action=login"><i class="fa fa-user"> Iniciar Sesión</i></a>
      </li> 
      <li class="nav-item">
            <a class="nav-link navIcons text-white" href="paginaPrincipal?action=mantenimientoClientes"><i class="fa fa-user-plus"> Registrarse</i></a>
      </li>       
    </ul>
  </div> 
</nav>
<h1> <font face = "calibri" size = 6 color = #FFFFFF>Editar Ciudad</font></h1>
	<form action="adminCiudades?action=confirmarEditarCiudad" method="post" >
		<table>
                        <tr>
				<td><label><font face = "calibri" size = 4 color = #FFFFFF>Codigo de Ciudad original: </font></label></td>
				<td><input type="text" name="codigoOriginal" value=" <c:out value="${ciudad.codigo}"></c:out>" readonly="readonly"></td>
			</tr>                       

			<tr>
				<td><label><font face = "calibri" size = 4 color = #FFFFFF>Codigo de Ciudad nuevo:</font> </label></td>
				<td><input type="text" name="codigoCiudad" value="<c:out value="${ciudad.codigo}"></c:out>" ></td>
			</tr>
			<tr>
				<td><label><font face = "calibri" size = 4 color = #FFFFFF>Nombre nuevo: </font> </label></td>
				<td><input type="text" name="nombreCiudad" value='<c:out value="${ciudad.nombre}"></c:out>' ></td>
			</tr>
		</table>
	   <br>
		 <button class="btn"> <i class="fa fa-check"> </i> Aceptar edición  </button>
                </br>
	</form>

        <br>
            <a href="paginaPrincipal?action=index" > <button type="button" class="btn btn-info btn-block"> <i class="fa fa-home"></i> Regresar al Menu Principal </button> </a>
        </br>   
            
                    <footer class="page-footer bg-info pt-4">
            <div class="container">
                <ul class="list-unstyled list-inline text-center py-3">
                    <li class="list-inline-item">
                        <h5 class="mb-1">¿No está registrado?</h5>
                    </li>
                    <li class="list-inline-item">
                        <a href="AdministrarClientes.jsp" class="btn btn-secondary btn-rounded">¡Registrarme!</a>
                    </li>
                    <li class="list-inline-item">
                        <a href="AcercaDe.jsp" class="btn btn-secondary btn-rounded">Acerca de nosotros</a>
                    </li>
                </ul>
            </div>
            <div class="page-footer bg-dark text-white text-center py-3">
                @ 2018 Autores: Jose Carlos Barrantes y Andres Barrantes.
            </div>
        </footer>    
</body>
</html>