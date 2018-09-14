

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            <h1><font color = #ffffff>Registro de nuevos clientes</font></h1>
        </div>
        
        <div class ="container nav" style="padding:15px">
            <form id="AgregarAvion" action="adminClientes?action=registrarClienteNuevo" method="post" style="width: 100%">
                <div class="form-group">
                        <label for="nombreClienteAplicacion">Usuario</label>
                        <input type="text" class="form-control"  name="nombreClienteAplicacion" id="nombreClienteAplicacion" required placeholder="Indique un nombre de usuario">
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="nombreCliente">Nombre</label>
                        <input type="text" class="form-control" name="nombreCliente" id="nombreCliente" required  id="nombreCliente" placeholder="Indique su nombre">
                    </div>
                    <div class="form-group col-md-6">
                        <label for="apellidosCliente">Apelidos</label>
                        <input type="text" class="form-control" name="apellidosCliente" id="apellidosCliente" required  id="apellidosCliente" placeholder="Indique sus apellidos">
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="claveCliente">Contraseña</label>
                        <input type="password" class="form-control" name="claveCliente" id="claveCliente" required id="claveCliente" placeholder="Indique una contraseña">
                    </div>
                    <div class="form-group col-md-6">
                        <br><br><input type="checkbox" onclick="verContraseña()"> Ver la contraseña
                    </div>
                </div>
                <div class="form-group">
                        <label for="emailCliente">Correo electrónico</label>
                        <input type="email" class="form-control" name="emailCliente" id="emailCliente" required placeholder="Indique su correo electrónico">
                </div>
                <div class="form-group">
                        <label for="fechaNacimientoCliente">Fecha de Nacimiento</label>
                        <input type="date" class="form-control" name="fechaNacimientoCliente" id="fechaNacimientoCliente" required placeholder="Indique su fecha de nacimiento">
                </div>
                <div class="form-group">
                        <label for="direccionCliente">Dirección</label>
                        <input type="text" class="form-control"  name="direccionCliente" id="direccionCliente" required placeholder="Indique su dirección">
                </div>
                <div class="form-group">
                        <label for="telefonoClient">Teléfono</label>
                        <input type="text" class="form-control"  name="telefonoClient" id="telefonoClient" required placeholder="Indique su número de teléfono">
                </div>
                <button type="submit" class="btn">Registrarme</button>
            </form>
                <div class="form-row">
                <div class="form-group col-md-6">
                         <br><label>¿Ya es miembro? </label>
                        <a href="adminClientes?action=login"><button class="btn"><i class="fa fa-user"></i>Iniciar Sesión</button></a>
                    </div>
                </div>
            </div>    
        <br>
            <a href="paginaPrincipal?action=index" > <button type="button" class="btn btn-info btn-block"> <i class="fa fa-home"></i> Regresar al Menu Principal </button> </a>
        </br>   
            
        <footer class="page-footer bg-info pt-4">
            <div class="container">
                <ul class="list-unstyled list-inline text-center py-3">
                    <li class="list-inline-item">
                        <h5 class="mb-1">Está en la página de registro. </h5>
                    </li>
                    <li class="list-inline-item">
                        <a href="AdministrarClientes.jsp" class="btn btn-secondary btn-rounded disabled" >¡Registrarme!</a>
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
            var x = document.getElementById("claveCliente");
                if (x.type === "password") {
                 x.type = "text";
                } else {
                 x.type = "password";
                }
        }
        </script>        
    </body>
</html>
