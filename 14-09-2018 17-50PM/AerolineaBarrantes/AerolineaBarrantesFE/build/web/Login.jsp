<%-- 
    Document   : Login
    Created on : Aug 30, 2018, 10:54:48 PM
    Author     : Jose Carlos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            <a class="navbar-brand" href="Principal.jsp">
                <img src="img/logo2.png" style="width: 50px">
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
                <span class="navbar-toggler-icon"></span>
            </button>
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
            <h1><font color = #ffffff>Inicio de sesión</h1>
        </div>
        
        <nav>
            <div >
        	<form class ="container nav" style="padding: 20px" action="adminClientes?action=loginRequest" method="post" >
                    <div class="col-sm-6">
                        <div class="col">
                            <label for="nombreUsuario">Nombre de Usuario:</label>
                            <input type="text" class="form-control" id="nombreUsuario" placeholder="Ingresa tu nombre de usuario" name="nombre_usuario">
                        </div>                           
                        <div class="col">
                            <label for="contraseña">Contraseña:</label>
                            <input type="password" class="form-control" id="contraseña" placeholder="Ingresa tu contraseña" name="contrasena">
                            <input type="checkbox" onclick="verContraseña()"> Ver la contraseña
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="col">
                            <br><br><br><button class="btnLogin"> <i class="fa fa-fighter-jet"> </i> Login  </button>
                        </div>
                    </div>
                </form>
            </div>
	</nav> 

       
          
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
        
        
        <SCRIPT LANGUAGE="JavaScript">
        function verContraseña() {
            var x = document.getElementById("contraseña");
                if (x.type === "password") {
                 x.type = "text";
                } else {
                 x.type = "password";
                }
        }
        </script>
    </body>
</html>