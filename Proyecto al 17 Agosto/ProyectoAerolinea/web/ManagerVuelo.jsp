
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Barrantes| Mantenimiento de Vuelos</title>
        <%@ include file="Imports.jspf"%>  
    </head>
    <%@include file = "NavigateManager.jspf" %>	
    <!--Fin Navegacion-->
    <body>
      
        
<section>
<form>
<div class = "container" id="buscador">

<div class ="row">
<div class="col-sm-12 ">
<i> <h1> <font face = "calibri" color = #81202a> Mantenimiento de Vuelos </font></h1> </i><br/>
</div></div>

<form id="Formulario">
<div class ="row">     <!--Aquí está todo el form-->

<div class="col-sm-2">
<label>Número de Vuelo:</label>
</div>

<div class="col-sm-4">
<input type="text" id="numeroTxt" maxlength="10"/>
</div>

<div class="col-sm-2">
<label>Costo$</label>
</div>

<div class="col-sm-4">
    <input type="text" id="costoTxt" maxlength="12" onkeypress="return Numeros(event)"> </input>
</div>
</div><br/>

<div class="row">
<div class="col-sm-2">
<label>Ciudad de Origen:</label>
</div>

<div class="col-sm-4">
    <select  id="origenTxt"></select>
</div>

<div class="col-sm-2">
<label>Ciudad de Destino:</label>
</div>

<div class="col-sm-4">
    <select id="destinoTxt"></select>
</div>
</div><br/>

<div class="row">	
<div class="col-sm-2">
<label>Tiempo</label>
</div>

<div class="col-sm-1">
    <input type="number" class="form-control" onkeypress="return Numeros(event)" value=0 min=0 id="tiempoHRTxt"> </input>
</div>

<div class="col-sm-1">
    <label>Hr/Min</label>
</div>

<div class="col-sm-1">
    <input type="number" class="form-control" onkeypress="return Numeros(event)"  value=0 min=0 max=59 id="tiempoMINTxt"> </input>
</div>
 <div class="col-sm-1">
</div>
    
<div class="col-sm-2">
<label>¿Vuelo en Promoción?</label>
</div>

<div class="col-sm-4">
<input type="checkbox" id="promoTxt" required />
</div>
</div><br/><br/>


<div class ="row">
<div class ="col-sm-2">
    <label>Imagen</label></div>    
    
<div class ="col-sm-4">
    <input type="file" id="imagen"></input></div>  


<div class ="col-sm-2">
    <input type ="button" value="Eliminar" class = "btn" id="eliminarBtn" onclick="controller.eliminarVuelo();" disabled></input></div>
    
</div><br/>

<div class="row">
	<div class="col-sm-6 ">
            <input type="button"  onclick="controller.newVuelo();" class="btn" id="registrarBtn" value="Registrar Vuelo"/>
		</div>	
    
    <div class="col-sm-6 ">
        <input type="button" onclick="controller.buscarVuelo();" class="btn" id="buscarBtn" value="Buscar Vuelo(Número)"/>
		</div>	

		</div>

<!--Edición de Vuelos-->
<div class="row" id="EdicionVuelo">
	<div class="col-sm-6 ">
            <input type="button"  onclick="controller.editarVuelo();" class="btn" id="registrarBtn" value="Actualizar Vuelo"/>
		</div>	
    
    <div class="col-sm-6 ">
        <input type="button" onclick="controller.cancelarEdicion();" class="btn" id="buscarBtn" value="Cancelar Edición"/>
		</div>	

</div></br></br>
<!--Edicion de Vuelos-->

</div>
</form>
</section>        
        <!--Fin formulario vuelos-->
        
        
 <section id ="ELbuscador">
	 <div class ="container" id="buscador">
	 <div class = "row">
	 <div class = "row">
	 <div class ="col-sm-3">
	<i> <h1> <font face = "calibri" color = #81202a> Vuelos </font></h1> </i></div>
	 </div>
	 
	 <div class ="col-sm-2">
	 Código</div>
	 <div class ="col-sm-2">
	 Origen</div>
         <div class ="col-sm-2">
	 Destino</div>
         <div class ="col-sm-2">
	 Costo</div>
         <div class ="col-sm-2">
	 Tiempo</div>    
	 </div>   
             
             
              <div class = "row"  id = "vuelosDisp">
	 
	 </div>
        
         </div></section>        
        
        
        <script>//Model
            function Model(){
                this.Model();
            }
            
            Model.prototype={
                Model:function(){
                    
                }
            };
            
            </script>
        
         <script>//Controller
             
             
             function Controller(model,view){
                 this.Controller(model,view);
             }
             
             Controller.prototype={
                 Controller:function(model,view){
                     this.model = model;
                     this.view = view;
                     this.getCiudades();
                 },
                 getCiudades:function(){
                     Proxy.getCiudades(function(result){
                     model.ciudades=result;
                     var origen = document.getElementById("origenTxt");
                     var destino = document.getElementById("destinoTxt");
                     for(i = 0; i < model.ciudades.length; i++){
                         origen.options[i] = new Option(model.ciudades[i].nombre);
                         destino.options[i] = new Option(model.ciudades[i].nombre);
                     }
                 });
             },
             newVuelo:function(){
                 var view = this.view;
                 var numero = document.getElementById("numeroTxt");
                 var costo = document.getElementById("costoTxt");
                 var origen = document.getElementById("origenTxt");
                 var destino = document.getElementById("destinoTxt");
                 var hora = document.getElementById("tiempoHRTxt");
                 var minutos = document.getElementById("tiempoMINTxt");
                 var promo = document.getElementById("promoTxt");
                 var imagen = document.getElementById("imagen").files[0];
                 var error = false;
                 var promocion = 0;
                 numero.classList.remove("Error");
                 costo.classList.remove("Error");
                 origen.classList.remove("Error");
                 destino.classList.remove("Error");
                 hora.classList.remove("Error");
                 minutos.classList.remove("Error");
                 
                 if(numero.value.trim() == ""){
                     numero.className = "Error";
                     error = true;
                 }
                 
                 if(costo.value.trim() == ""){
                     costo.className = "Error";
                     error = true;
                 }
                 
                 if(hora.value.trim() == ""){
                     hora.className="Error";
                     error = true;
                 }
                 if(minutos.value.trim() == ""){
                     minutos.style.borderColor = "red";
                     error = true;
                 }
                 
                 if(origen.value == destino.value){
                     origen.className ="Error";
                     destino.className = "Error";
                     error = true;
                 }
                 
                 if(hora.value == 0 && minutos.value == 0){
                     minutos.style.borderColor = "red";
                     error = true;
                 }
                 
                 if(imagen == undefined){
                     error = true;
                     view.alert("Imagen no seleccionada");
                 }
                 
                 if(!error){
                     var origen = document.getElementById("origenTxt");
                     var destino = document.getElementById("destinoTxt");
                     
                    ciudadOrigen = model.ciudades.find(function(x){return x.nombre == origen.value.trim();});
                    ciudadDestino = model.ciudades.find(function(x){return x.nombre == destino.value.trim();});
                     
                     if(promo.checked){
                         promocion = 1;
                     }
                     
                vuelo = new Vuelo(numero.value,ciudadOrigen,ciudadDestino,costo.value,hora.value+":"+minutos.value,promocion);
                Proxy.newVuelo(vuelo,imagen,function(status){
                   
                   
                   switch(status){
                       case 0:
                           view.yes();
                           document.getElementById("numeroTxt").value="";
                            document.getElementById("costoTxt").value="";
                            document.getElementById("tiempoHRTxt").value=0;
                            document.getElementById("tiempoMINTxt").value=0;
                            if(document.getElementById("promoTxt").checked){
                            document.getElementById("promoTxt").click();}
                            break;
                            
                        case 1:
                            numero.className = "Error";
                            view.no();
                
                   }
                });
                 
                 }//if error
                 
             },
             buscarVuelo:function(){
                 
                 var view = this.view;
                 var numero = document.getElementById("numeroTxt");
                 var costo = document.getElementById("costoTxt");
                 var origen = document.getElementById("origenTxt");
                 var destino = document.getElementById("destinoTxt");
                 var hora = document.getElementById("tiempoHRTxt");
                 var minutos = document.getElementById("tiempoMINTxt");
                 var promocion = document.getElementById("promoTxt");

                 numero.classList.remove("Error");
                 costo.classList.remove("Error");
                 origen.classList.remove("Error");
                 destino.classList.remove("Error");
                 hora.classList.remove("Error");
                 minutos.style.borderColor ="";
                 if(numero.value.trim() == ""){
                     numero.className = "Error";
                 }else{
                   Proxy.getVueloCodigo(numero.value.trim(),function(result){
                      
                      if(result.length < 1){
                          view.noFound();
                          numero.className = "Error";
                      }else{
                      model.vuelo = result;
                      
                      numero.disabled=true;
                      numero.value = model.vuelo[0].codigo;
                      document.getElementById("costoTxt").value = model.vuelo[0].precio;
                      document.getElementById("origenTxt").value = model.vuelo[0].origen.nombre;
                      document.getElementById("destinoTxt").value = model.vuelo[0].destino.nombre;
                      document.getElementById("tiempoHRTxt").value = model.vuelo[0].tiempo.substring(0,1);
                      document.getElementById("tiempoMINTxt").value = model.vuelo[0].tiempo.substring(2,4);
                      
                      switch(model.vuelo[0].promo){
                          case 0:
                              if(promocion.checked){
                                  promocion.click();
                              }                              
                              break;
                              
                          case 1:
                              
                              if(!promocion.checked){
                                  promocion.click();
                              }  
                          
                          break;
                      }
                      
                      
                      document.getElementById("EdicionVuelo").style.display  = "block";
                      document.getElementById("registrarBtn").disabled=true;
                      document.getElementById("eliminarBtn").disabled=false;
                  }
                   });  
                 }
                 
 
             },
             cancelarEdicion:function(){
                 document.getElementById("numeroTxt").disabled=false;
                 document.getElementById("registrarBtn").disabled=false;
                 document.getElementById("eliminarBtn").disabled=true;
                 document.getElementById("numeroTxt").value="";
                  document.getElementById("costoTxt").value="";
                  document.getElementById("tiempoHRTxt").value=0;
                  document.getElementById("tiempoMINTxt").value=0;
                  document.getElementById("EdicionVuelo").style.display  = "none";
                  
                  if(document.getElementById("promoTxt").checked){
                      document.getElementById("promoTxt").click();
                  }
                  
             },//,
             
             editarVuelo:function(){
                 
                 var view = this.view;
                 var numero = document.getElementById("numeroTxt");
                 var costo = document.getElementById("costoTxt");
                 var origen = document.getElementById("origenTxt");
                 var destino = document.getElementById("destinoTxt");
                 var hora = document.getElementById("tiempoHRTxt");
                 var minutos = document.getElementById("tiempoMINTxt");
                 var error = false;
                 
                 
                 
                 if(costo.value.trim() == ""){
                     costo.className = "Error";
                     error = true;
                 }
                 
                 if(hora.value.trim() == ""){
                     hora.className="Error";
                     error = true;
                 }
                 if(minutos.value.trim() == ""){
                     minutos.className = "Error";
                     error = true;
                 }
                 
                 if(origen.value == destino.value){
                     origen.className ="Error";
                     destino.className = "Error";
                     error = true;
                 }
                 
                 if(hora.value == 0 && minutos.value == 0){
                     minutos.className = "Error";
                     error = true;
                 }
                 
                 if(!error){
                  
                  var origen = document.getElementById("origenTxt");
                     var destino = document.getElementById("destinoTxt");
                     var promo = document.getElementById("promoTxt");
                     var promocion = 0;
                    ciudadOrigen = model.ciudades.find(function(x){return x.nombre == origen.value.trim();});
                    ciudadDestino = model.ciudades.find(function(x){return x.nombre == destino.value.trim();});
                     
                     if(promo.checked){
                         promocion = 1;
                     }
                     
                vuelo = new Vuelo(numero.value,ciudadOrigen,ciudadDestino,costo.value,hora.value+":"+minutos.value,promocion);
                Proxy.actualizarVuelo(vuelo,function(result){
                   
                   view.actualizado();
        
                });
            
            
                 }
             },//,
             eliminarVuelo:function(){
                 var view = this.view;
                 var codigo = document.getElementById("numeroTxt").value;
                 
                 Proxy.eliminarVuelo(codigo,function(status){
                    
                    switch(status){
                        
            case 0:
                view.yesDeleted();
                document.getElementById("numeroTxt").disabled=false;
                 document.getElementById("registrarBtn").disabled=false;
                 document.getElementById("eliminarBtn").disabled=true;
                 document.getElementById("numeroTxt").value="";
                  document.getElementById("costoTxt").value="";
                  document.getElementById("tiempoHRTxt").value=0;
                  document.getElementById("tiempoMINTxt").value=0;
                  document.getElementById("EdicionVuelo").style.display  = "none";
                  
                  if(document.getElementById("promoTxt").checked){
                      document.getElementById("promoTxt").click();
                  }
                break;
                        
            case 1:
                view.noDeleted();
    
                    }
        
                 });
                 
             }
         };
            </script>
            
            
             <script>//View
            var model;
            var controller;
            
            function pageLoad(event){
                model = new Model();
                controller = new Controller(model,window);
            }
            
            function no(){
                window.alert("Codigo de Vuelo ya Existe");
            }
            
            function noFound(){
                window.alert("Codigo de Vuelo No Existe");
            }
            
            function yes(){
                window.alert("Vuelo Añadido!!!!");
            }
            
            function actualizado(){
                window.alert("Vuelo actualizado");
            }
             
                 function yesDeleted(){
                     window.alert("Vuelo Eliminado!!!");
                 }
                 
                 function noDeleted(){
                     window.alert("No se puede eliminar el Vuelo, puesto tiene un Viaje asociado");
                 }
                 
                document.addEventListener("DOMContentLoaded",pageLoad);
            </script>
        
            
            <script>
                
    function Numeros(e){


	var key = window.Event ? e.which : e.keyCode
	return (key >= 48 && key <= 57)

}
          </script>  
    </body>
</html>
