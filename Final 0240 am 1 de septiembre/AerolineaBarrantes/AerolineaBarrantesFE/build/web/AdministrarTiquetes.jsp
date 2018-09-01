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
        <title>Barrantes | Tu Sitio de Viajes</title>
    </head>
    <body>
        <nav>
            <div class="container nav" >
            <h1><font face = "calibri" size = 6 color = #81202a>Lista de Vuelos</font></h1>
            </div>
        <br>
            <a style="padding-left:10px;" href="paginaPrincipal?action=index" > <button class="btn"> <i class="fa fa-home"></i> Menu Principal </button> </a>
        </br>             
        </nav>            
        <div class="tableVuelos" style="overflow-x:auto;">
                        <table align="center" style="width:100%">
                            <tr>
                                <th>Vuelo</th>
                                <th>Origen</th>
                                <th>Destino</th>
                                <th>Costo</th>
                                <th>¿Elegir vuelo?</th>
                            </tr>
                            <c:forEach var="vuelos" items="${vuelos}">
                             <tr>
                                <td align="center"><c:out value="${vuelos.codigo}"/></td>
                                <td align="center"><c:out value="${vuelos.getOrigen().getNombre()}"/></td>
                                <td align="center"><c:out value="${vuelos.getDestino().getNombre()}"/></td>
                                <td align="center">$<c:out value="${vuelos.precio}"/></td>
                                <td align="center"><input type="button" value="Elegir vuelo" onclick="visible()" class="select" id="select"</td>
                            </tr>                                
                            </c:forEach>
                        </table>
        </div>
        <nav>
        <div class="container nav" id="calendario" style="padding-bottom:10px">
            <h1 class="calendario"><font face = "calibri" size = 6 color = #81202a>Escoge fechas para pasear.</font></h1>
            <form id="lasfechas" method="post">
            <a>Salida:</a><input type="date" value="Fecha Salida" class="calendario" required><br>
            <a>Llegada:</a><input type="date" value="Fecha Salida" class="calendario" required><br><br>
            <input type="submit" value="Escoger Fechas" onclick="visibleViaje()" class="fechas" id="fechas">
            </form>
        </div>
        </nav>
        <nav>
        <div class="container nav" id="agregarViaje" style="padding-bottom:10px">
            <h1 class="calendario"><font face = "calibri" size = 6 color = #81202a>¡Felicidades! Buen viaje.</font></h1>            
        </div>
        </nav>
        
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
