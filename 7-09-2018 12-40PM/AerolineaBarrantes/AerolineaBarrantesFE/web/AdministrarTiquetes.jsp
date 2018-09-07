
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
         
            <div class="container nav" style="overflow-x:auto;">
            <h1><font face = "calibri" size = 6 color = #FFFFFF>Lista de Vuelos</font></h1>
            </div>
                 
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
     
     <br>
            <a style="padding-left:10px;" href="paginaPrincipal?action=index" > <button class="btn"> <i class="fa fa-home"></i> Menu Principal </button> </a>
        </br>    
   </body>
</html>
