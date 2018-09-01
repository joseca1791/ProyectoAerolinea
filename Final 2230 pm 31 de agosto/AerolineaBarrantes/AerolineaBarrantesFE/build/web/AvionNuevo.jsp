<%-- 
    Document   : avionNuevo
    Created on : Aug 28, 2018, 8:02:13 PM
    Author     : Jose Carlos
--%>

<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/estilo.css" />
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>Agregar nuevo avión</title>
    </head>
    <body>
        <section>
              
           <form id="AgregarAvion" action="adminAviones?action=registrarAvionNuevo" method="post">
               <br>
                    <label><font face = "calibri" size = 6 color = #81202a>Código: </font></label>
                    <input type="text" name="codigoAvion" id="codigoAvion" required/>
                    
                                       </br>

                                       
                       <br>
                             
                    <label><font face = "calibri" size = 6 color = #81202a>Modelo: </font></label>
                    <input type="text" name="modeloAvion" id="modeloAvion" required/>
                    
                      </br>
                      
                       <br>
                    <label><font face = "calibri" size = 6 color = #81202a>Capacidad: </font></label>
                    <input type="number" name="capacidadAvion" id="capacidadAvion" required/>
                    
                    </br>
                       <br>
                     <button class="btn"> <i class="fa fa-check"> </i> Agregar Avion  </button>
                      </br>
            </form>
        </section>   
        <br>
      <a href="paginaPrincipal?action=index" > <button class="btn"> <i class="fa fa-home"></i> Menu Principal </button> </a>
      </br>
    </body>
</html>
