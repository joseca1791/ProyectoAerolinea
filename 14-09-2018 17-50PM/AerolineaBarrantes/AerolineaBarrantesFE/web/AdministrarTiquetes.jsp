<%-- 
    Document   : AdministrarTiquetes
    Created on : Sep 1, 2018, 1:09:37 AM
    Author     : Jose Carlos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
    <a class="navbar-brand" href="Principal.jsp">
      <img src="img/logo2.png" style="width: 50px">
    </a>
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

        <div style="background-color: rgb(66,127,174)" class="jumbotron container1 text-center" >
            <h1><font color = #ffffff>Selecciona tu vuelo para crear un tiquete</font></h1>
        </div>
        
        <nav>
        <br>
            <a href="paginaPrincipal?action=index" > <button type="button" class="btn btn-info btn-block"> <i class="fa fa-home"></i> Regresar al Menu Principal </button> </a>
        </br>             
        </nav>            
        <div class="tableVuelos" style="overflow-x:auto;">
                        <table align="center" style="width:50%">
                            
                     <tr>
                             <th><font face = "calibri" size = 4 color = #FFFFFF> Vuelo </font></th>
                             <th><font face = "calibri" size = 4 color = #FFFFFF> Origen </font></th>
                             <th><font face = "calibri" size = 4 color = #FFFFFF> Destino </font></th>
                             <th><font face = "calibri" size = 4 color = #FFFFFF> Costo </font></th>
                             <th><font face = "calibri" size = 4 color = #FFFFFF> ¿Elegir vuelo? </font></th>
                    </tr>
                    
                    
                            <c:forEach var="vuelos" items="${vuelos}">
                             <tr>
                                <td><font face = "calibri" size = 4 color = #FFFFFF><c:out value="${vuelos.codigo}"/></font></td>
                                <td><font face = "calibri" size = 4 color = #FFFFFF><c:out value="${vuelos.getOrigen().getNombre()}"/></font></td>
                                <td><font face = "calibri" size = 4 color = #FFFFFF><c:out value="${vuelos.getDestino().getNombre()}"/></font></td>
                                <td><font face = "calibri" size = 4 color = #FFFFFF>$<c:out value="${vuelos.precio}"/></font></td>
                                <td><button class="btn"  value="Elegir vuelo" onclick="visible()"> <i class="fa fa-check-circle"> </i> Elegir Vuelo</button></td>
                            </tr>     
                            
                            </c:forEach>
        </table>
        </div>
        <nav>
        <div class="container nav" id="calendario" style="padding-bottom:10px">
            <h1 class="calendario"><font face = "calibri" size = 6 color = #81202a>Selecciona las fechas</font></h1>
            <form id="lasfechas" method="post">
                <br></br>
             <br><a>Salida:</a><input type="date" value="Fecha Salida" class="calendario" required></br>
            <br><a>Llegada:</a><input type="date" value="Fecha Salida" class="calendario" required></br>
                <br></br>
            <input type="submit" value="Escoger Fechas" onclick="visibleViaje()" class="fechas" id="fechas">
            </form>
        </div>
        </nav>
        <nav>
        <div class="container nav" id="agregarViaje" style="padding-bottom:10px">
            <h1 class="calendario"><font face = "calibri" size = 6 color = #81202a>¡Felicidades! Buen viaje.</font></h1>            
        </div>
        </nav>
        
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

        <SCRIPT LANGUAGE="JavaScript">
        function visible()
        {
            {document.getElementById("calendario").style.visibility="visible";}

        }
        function visibleViaje(){
            {document.getElementById("agregarViaje").style.visibility="visible";}
        }
     </script>
   </body>
</html>
