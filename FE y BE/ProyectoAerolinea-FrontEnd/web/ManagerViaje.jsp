
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Barrantes | Mantenimiento de  Viajes</title>
        <%@ include file="Imports.jspf"%>  
    </head>
        <%@include file = "NavigateManager.jspf" %>	
    <body>
       <section>
<form>
<div class = "container" id="buscador">
<div class ="row">
<div class="col-sm-12 ">
<i> <h1> <font face = "calibri" color = #81202a> Mantenimiento de Viajes </font></h1> </i>
<br/></div></div><br/>
    
<form id="Formulario">
<div class ="row">     <!--Aquí está todo el form-->

<div class="col-sm-2">
<label>Código Viaje:</label>
</div>

<div class="col-sm-4">
<input type="text" id="codigoTxt" />
</div>

<div class="col-sm-1">
<label>Vuelo:</label>
</div>

<div class="col-sm-5">
    <select id="vueloTxt"></select>
</div>
</div></br></br>


<div class="row">
<div class="col-sm-2">
<label>Avión</label>
</div>
 <div class="col-sm-4">
    <select id="avionTxt"></select>
</div>  
      
<div class="col-sm-1">
    <label>Fecha:</label>
</div>    

<div class="col-sm-4">
    <input  class="datepicker form-control" id="fechaTxt" readonly/>
</div>

    
</div></br></br>

<div class = "row">

<div class="row">
	<div class="col-sm-6 ">
            <input type="button" onclick="controller.newViaje();" class="btn" id="registrarBtn" value="Registrar Viaje"/>
		</div>	
    
    <div class="col-sm-6 ">
        <input type="button" class="btn" onclick="controller.buscarViaje();" id="buscarBtn" value="Buscar Viaje"/>
		</div>	
    
    
		</div>

    
 <!--Edición de Viajes-->
<div class="row" id="EdicionVuelo">
	<div class="col-sm-6 ">
            <input type="button"  onclick="" class="btn" id="registrarBtn" value="Actualizar Viaje"/>
		</div>	
    
    <div class="col-sm-6 ">
        <input type="button" onclick="controller.cancelarEdicion();" class="btn" id="buscarBtn" value="Cancelar Edición"/>
		</div>	

		</div>
<!--Edicion de Viajes-->   
    
    
</div>
</form>	
</section>  
        
        
        <section id ="ELbuscador">
	 <div class ="container" id="buscador">
	 <div class = "row">
	 <div class = "row">
	 <div class ="col-sm-3">
	 <i> <h1> <font face = "calibri" color = #81202a>  Viajes </font></h1> </i></div>
	 </div>
	 
	 <div class ="col-sm-2">
                        Origen</div>
                    <div class ="col-sm-2">
                        Destino</div>
                    <div class ="col-sm-2">
                        Precio</div>
                    <div class ="col-sm-2">
                        Fecha</div>
                    <div class ="col-sm-3">
                        Avión</div>    
                    <div class ="col-sm-1">
                        Eliminar</div>
             
             
              <div class = "row"  id = "viajesDisp">
	 
	 </div>
        
         </div></section>
        
        
        <script>//model
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
                this.view=view;
                this.getTodosVuelos();
                this.getTodosAviones();
            },
            getTodosVuelos:function(){
                
                Proxy.getTodosVuelos(function(result){
                    model.vuelos = result;
                    var vuelo = document.getElementById("vueloTxt");
                    
                    for(i=0; i < model.vuelos.length; i++){
          vuelo.options[i] = new Option("'"+model.vuelos[i].codigo+"'  "+model.vuelos[i].origen.nombre+" - "+model.vuelos[i].destino.nombre);              
                    }
                
                });
                
                
            },
            getTodosAviones:function(){
                Proxy.getTodosAviones(function(result){
                   
                   model.aviones = result;
                   var avion = document.getElementById("avionTxt");
                   
                   for(i= 0; i< model.aviones.length; i++){
                       avion.options[i] = new Option("'"+model.aviones[i].codigo_Avion+"'  "+model.aviones[i].modelo);
                   }
        
                });
            },
            newViaje:function(){
                
                var view = this.view;
                var codigo = document.getElementById("codigoTxt");
                var vuelo = document.getElementById("vueloTxt");
                var avion = document.getElementById("avionTxt");
                var fecha = document.getElementById("fechaTxt");
                var error = false;
                codigo.classList.remove("Error");
                fecha.style.borderColor = "";
                
                if(codigo.value.trim() ==""){
                    codigo.className = "Error";
                    error = true;
                }
                
                if(fecha.value.trim() == ""){
                    fecha.style.borderColor = "red";
                    error = true;
                }
                
                if(!error){
                    
                    var posVuelo = vuelo.selectedIndex;
                    codigoVuelo = model.vuelos[posVuelo].codigo;
                    var posAvion = avion.selectedIndex;
                    codigoAvion = model.aviones[posAvion].codigo_Avion;
                    
                    vuelo = model.vuelos[posVuelo];
                    avion = model.aviones[posAvion];
                    
                    viaje = new Viaje(codigo.value.trim(),vuelo,avion,fechaTxt.value,0);
                    Proxy.newViaje(viaje,function(result){
                        
                        if(result == "no"){
                            codigo.className = "Error";
                            view.no();
                            
                        }else{
                            view.yes();
                            codigo.value = "";
                            fecha.value = "";
                            document.getElementById("ELbuscador").style.display = "none";
                        }
                        
                    });
                    
                }
                
                
            },
            
        buscarViaje:function(){
            var view = this.view;
            var codigo = document.getElementById("codigoTxt");
            var fecha = document.getElementById("fechaTxt");
            codigo.classList.remove("Error");
            fecha.style.borderColor = "";
           
            
            if(codigo.value.trim() == "" && fecha.value == ""){
                codigo.className = "Error";
                fecha.style.borderColor = "";
                //view.ocultar();
            }else if(fecha.value == "" && codigo.value.trim() != ""){
                //busqueda por codigo de viaje
                criteria = codigo.value.trim();
                Proxy.getViajesCodigo(criteria,function(result){
                   model.viajes = result;
                   view.showViajes();
                });
            }else if(codigo.value.trim() == "" && fecha.value != ""){
                //busqueda por fecha
                criteria = fecha.value;
                Proxy.getViajesFecha(criteria,function(result){
                    model.viajes = result;
                    view.showViajes();
                });
            }else{
                //busqueda por fecha
                //busqueda por codigo de viaje
                criteria = codigo.value.trim();
                Proxy.getViajesCodigo(criteria,function(result){
                   model.viajes = result;
                   view.showViajes();
                });
                  view.alert("Buscando por Código de viaje");
            }
            
        },
        
        eliminarViaje:function(codigo){
            var view = this.view;
            
            Proxy.eliminarViaje(codigo,function(status){
                
                switch(status){
                    case 0:
                        view.yesDeleted();
                     document.getElementById("ELbuscador").style.display = "none";
                     document.getElementById("codigoTxt").value ="";
                     
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
                model= new Model();
                controller = new Controller(model,window);
                $( ".datepicker" ).datepicker({dateFormat: 'dd/mm/yy', minDate: -0});
            }
            
            function no(){
                window.alert("Código de Viaje Ya Existe");
            }
            
            function yes(){
                window.alert("Viaje Añadido!!!");
            }
            
            function showViajes(){
                var listado2 = document.getElementById("viajesDisp");
                listado2.innerHTML="";
                var form = document.getElementById("ELbuscador");
                form.style.display = "block";
                
                 if (model.viajes.length < 1) {
                    No_Disponibles(listado2);
                } else {


                    for (i = 0; i < model.viajes.length; i++) {
                        listViaje(listado2, model.viajes[i]);
                    }//For
                }//Else
            }//Show Viajes
            
            function listViaje(listado2,busqueda){
                
                var div = document.createElement("div");
                div.setAttribute("class", "col-sm-2");

                var c = "<p>" + busqueda.vuelo.origen.nombre + "</p>";//Cierro div

                div.innerHTML = c;
                listado2.appendChild(div);


                var div2 = document.createElement("div");
                div2.setAttribute("class", "col-sm-2");

                c = "<p>" + busqueda.vuelo.destino.nombre + "</p>";//Cierro div2
                div2.innerHTML = c;
                listado2.appendChild(div2);

                var div3 = document.createElement("div");
                div3.setAttribute("class", "col-sm-2");
                c = "<p>" + busqueda.vuelo.precio + "</p>";//Cierro div3

                div3.innerHTML = c;
                listado2.appendChild(div3);

                var div4 = document.createElement("div");
                div4.setAttribute("class", "col-sm-2");
                c = "<p>" + busqueda.fecha + "</p>";//Cierro div3

                div4.innerHTML = c;
                listado2.appendChild(div4);
                
                var div5 = document.createElement("div");
                div5.setAttribute("class","col-sm-3");
                c = "<p>"+ busqueda.avion.codigo_Avion +" - "+ busqueda.avion.modelo + "</p>";
                div5.innerHTML=c;
                listado2.appendChild(div5);
                
                var div6 = document.createElement("div");
                div6.setAttribute("class","col-sm-1");
                c = "<input type='button' value ='Borrar' onClick='controller.eliminarViaje(\""+ busqueda.codigo +"\");' class ='btn' id='eliminarBtn'></input><br/></br>";
                div6.innerHTML=c;
                listado2.appendChild(div6);
                
            }
            
            
            function No_Disponibles(listado2) {

                var div = document.createElement("div");
                div.setAttribute("class", "col-sm-12");
                var p = document.createElement("p");
                p.innerHTML = "No hay Viajes disponibles con estos datos";
                div.appendChild(p);

                listado2.appendChild(div);
            }
            
            function yesDeleted(){
                window.alert("Viaje Eliminado!!!");
            }
            
            function noDeleted(){
                window.alert("No se puede eliminar el viaje, dado que tiene reservaciones");
            }
            	 document.addEventListener("DOMContentLoaded",pageLoad)
        </script>
        
        
        
        
    </body>
</html>
