<%-- 
    Document   : Principal
    Created on : Aug 28, 2018, 11:06:44 PM
    Author     : Jose Carlos
--%>

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
       
     <div class="icon-bar">
  <a class="active" href="paginaPrincipal?action=mantenimientoAviones"> <i class="fa fa-plane"> Aviones </i></a>
  <a href="paginaPrincipal?action=mantenimientoCiudades" ><i class="fa fa-building"> Ciudades </i></a>
  <a href="paginaPrincipal?action=mantenimientoVuelos"><i class="fa fa-road">Vuelos</i></a>
  <a href="paginaPrincipal?action=index"><i class="fa fa-ticket">Tiquetes</i></a>
  <a href="adminClientes?action=login"><i class="fa fa-user"> Iniciar Sesión</i></a>
   <a href="paginaPrincipal?action=mantenimientoClientes"><i class="fa fa-user-plus"> Registrarse</i></a>
</div>
    
    
            <!--Formulario busqueda de Viajes-->
 <nav>
<div class ="container nav">
        <section>
            <form >
           
                   
              
                            <h1> <font face = "calibri" color = #81202a size="6" ><i> Barrantes Trips </i></font></h1>
                           

             
                          <br>
                            <label><font face = "calibri" color = #81202a size="6" >Origen</font></label>
                            <select id="origenTxt"></select>
                       
 </br>
                     
                            <label><font face = "calibri" color = #81202a size="6" >Destino</font></label>
                            <select id="destinoTxt"></select>
                          </br>   
                          
                            <br>
                   
                            <label><font face = "calibri" color = #81202a size="6" >¿En qué fechas?</font> </label>
                            <input   class ="datepicker form-control" readonly placeholder="Partida" id="partidaTxt"/>
                            <input  class="datepicker form-control" readonly placeholder="Regreso" id="regresoTxt" />
                       
     </br>   
  <br>
                      
                            <label><font face = "calibri" color = #81202a size="6" >Pasajeros</font></label>
                            <input id="adultosTxt" type="number" >
                       
   </br>   
                       
                        
                       <div class="row">
                        <div class="col-sm-3 ">
                            <input type="radio"  name="tipo" value="Ida" id="ida"><font face = "calibri" color = #81202a size="6" >Solo Ida</font></input></div>
                        <div class="col-sm-3 ">
                            <input type="radio"  name="tipo" value="Ida/Vuelta" id="ambas" ><font face = "calibri" color = #81202a size="6" >Ida/Vuelta</font></input>
                        </div></div>

                      
                   

</div>
		</nav> 
                             <br>
		 <button class="btn"> <i class="fa fa-search"> </i> Buscar  </button>
                </br>
    
            </form>
            
        </section>

        <!-- FIN Formulario Busqueda de Viajes -->
    
        
        
        
        
        
        
    </body>
    

</html>
