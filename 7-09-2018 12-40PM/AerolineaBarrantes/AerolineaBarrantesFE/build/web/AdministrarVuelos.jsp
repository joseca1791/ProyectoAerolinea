
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <link rel="stylesheet" type="text/css" href="css/estilo.css" />
           <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>Barrantes | Tu Sitio de Viajes</title>
    </head>
    
    
    
    
    <body>
        
<div class ="container nav" style="overflow-x:auto;">
        <h1><font face = "calibri" size = 6 color = #FFFFFF > Mantenimiento de vuelos </font></h1>
</div>
        
         
<div class ="container nav">
    
    
            <form id="AgregarVuelo" action="adminVuelos?action=registrarVueloNuevo" method="post">
                
                <br>
                    <label><font face = "calibri" size = 4 color =  #FFFFFF> Número de Vuelo: </font> </label>
                    <input type="text" name="numeroVuelo" id="numeroVuelo" required/>
                </br>
                
                
                <br>
                    <label><font face = "calibri" size = 4 color = #FFFFFF> Costo </font> </label>
                    <input type="number" name="costoVuelo" id="costoVuelo" required/>
                </br>
                
                
                
 	        <br>
                    <label><font face = "calibri" size = 4 color =  #FFFFFF> Ciudad Origen </font></label>
                        <select name="ciudadOrigen" id="ciudadOrigen">
                            <c:forEach var="ciudades" items="${ciudades}">                            
                            <option>${ciudades.nombre}</option>
                            </c:forEach>
                        </select>     
                </br>
                
                
                
                
 	        <br>
                    <label><font face = "calibri" size = 4 color =  #FFFFFF> Ciudad Destino </font></label>
                        <select name="ciudadDestino" id="ciudadDestino">
                            <c:forEach var="ciudades" items="${ciudades}">                            
                            <option>${ciudades.nombre}</option>
                            </c:forEach>
                        </select>      
                </br>
                
                
                
	        <br>
                    <label><font face = "calibri" size = 4 color =  #FFFFFF> Tiempo </font></label>
                    <input type="time" name="tiempoVuelo" id="tiempoVuelo" required/>
                </br>
                
                
                
                
                <br>
                    <label><font face = "calibri" size = 4 color =  #FFFFFF> ¿Está en promoción? </font></label>
                    <input type="hidden" value="0" name="promocion" id="promocion">
                    <input type="checkbox" value="1" name="promocion" id="promocion"/>
                </br>                                      
</div>
	                   
        
        
        
 	         <br>
                      <button class="btn"> <i class="fa fa-check"> </i> Agregar Vuelo  </button>	
                 </br>   
          		
                 </form>

                 <br>
                       <a href="paginaPrincipal?action=index" > <button class="btn"> <i class="fa fa-home"></i> Menu Principal </button> </a>
                  </br>    
                  
                  
    </body>