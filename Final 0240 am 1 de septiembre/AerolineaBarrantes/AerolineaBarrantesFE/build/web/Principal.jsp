<%-- 
    Document   : Principal
    Created on : Aug 28, 2018, 11:06:44 PM
    Author     : Jose Carlos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" type="text/css" href="css/estilo.css" />
         <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
         <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
         <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <title>Barrantes | Tu Sitio de Viajes</title>
    </head>
    <body>
        <div class="icon-bar" id="icon-bar" stype="overflow-x:auto;">
            <a class="active" href="paginaPrincipal?action=mantenimientoAviones"> <i class="fa fa-plane"> Aviones </i></a>
            <a href="paginaPrincipal?action=mantenimientoCiudades" ><i class="fa fa-building"> Ciudades </i></a>
            <a href="paginaPrincipal?action=mantenimientoVuelos"><i class="fa fa-road">Vuelos</i></a>
            <a href="paginaPrincipal?action=listarVuelos"><i class="fa fa-ticket">Tiquetes</i></a>
            <a href="adminClientes?action=login"><i class="fa fa-user"> Iniciar Sesión</i></a>
            <a href="paginaPrincipal?action=mantenimientoClientes"><i class="fa fa-user-plus"> Registrarse</i></a>
        </div>

        <!--Formulario busqueda de Viajes-->
        <nav>
            <div class ="container nav" id="container nav" style="padding:20px">
                <section>
                    <h1> <font face = "calibri" color = #81202a size="16" ><i> Barrantes Trips </i></font></h1>
                    <h1 class="h1-VuelosDisponibles">Vuelos disponibles</h1>
                        <br>
                        <form action="paginaPrincipal?action=listarVuelos" method="post">
                        <button type="submit" class="btnSearch"> <i class="fa fa-search"> </i> Buscar  </button>
                        </form>
                        </br>
                </section>
            </div>
        </nav> 
        
        <!-- FIN Formulario Busqueda de Viajes -->
        <div id="myCarousel" class="carousel slide" data-ride="carousel">
        <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
            </ol>

        <!-- Wrapper for slides -->
        <div class="carousel-inner" align="center">
        <div class="item active">
            <img src="img/brasilia.jpg" alt="Brasilia" height="550" width="550" align="center">
        </div>
        <div class="item">
            <img src="img/sanjose.jpg" alt="San Jose" height="550" width="550" align="center">
        </div>
        <div class="item">
            <img src="img/estambul.jpg" alt="Estambul" height="550" width="550" align="center">
        </div>
        </div>

        <!-- Left and right controls -->
            <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#myCarousel" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>     
    </body>
</html>
