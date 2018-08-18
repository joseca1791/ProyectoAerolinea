
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Barrantes | Mantenimiento de Aviones</title>
        <%@ include file="Imports.jspf"%> 
    </head>
    <%@include file = "NavigateManager.jspf" %>	
    <!--Fin navegacion-->
    <body>
        
        
<section>
<form>
<div class = "container" id="buscador">
<div class ="row">
<div class="col-sm-12 ">
<i> <h1> <font face = "calibri" color = #81202a> Mantenimiento de Aviones </font></h1> </i>
<br/></div></div><br/>
    
<form id="Formulario">
<div class ="row">     <!--Aquí está todo el form-->

<div class="col-sm-2">
<label>Código Avión:</label>
</div>

<div class="col-sm-2">
<input type="text" id="codigoTxt" required />
</div>

<div class="col-sm-1">
<label>Modelo:</label>
</div>

<div class="col-sm-3">
<input type="text" id="modeloTxt" required />
</div>
    
<div class="col-sm-1">
<label>Capacidad:</label>
</div>  
    
<div class="col-sm-2">
<input type="number" id="capacidadTxt" class="form-control" onkeypress="return Numeros(event)" min=1 value=1 />
</div>
</div></br></br>

<div class = "row">

<div class="row">
	<div class="col-sm-6 ">
            <input type="button" onclick="controller.newAvion();" class="btn" id="registrarBtn" value="Registrar Avión"/>
		</div>	
    
    <div class="col-sm-6 ">
        <input type="button" onclick="controller.busquedaAvion();" class="btn" id="buscarBtn" value="Buscar Avión"/>
		</div>	
    
    
		</div>

    
    <!--Edición de Avion-->
<div class="row" id="EdicionVuelo">
	<div class="col-sm-6 ">
            <input type="button"  onclick="controller.editarAvion();" class="btn" id="registrarBtn" value="Actualizar Avión"/>
		</div>	
    
    <div class="col-sm-6 ">
        <input type="button" onclick="controller.cancelarEdicion();" class="btn" id="buscarBtn" value="Cancelar Edición"/>
		</div>	

		</div>
<!--Edicion de Avion-->
    
    
    
</div>
</form>	
</section>           
        
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
                },
                newAvion:function(){
                    var view = this.view;
                    var codigo = document.getElementById("codigoTxt");
                    var modelo = document.getElementById("modeloTxt");
                    var capacidad = document.getElementById("capacidadTxt");
                    
                    codigo.classList.remove("Error");
                    modelo.classList.remove("Error");
                    capacidad.classList.remove("Error");
                    var error = false;
                    
                    if(codigo.value.trim() ==""){
                        codigo.className="Error";
                        error = true;
                    }
                    
                    if(modelo.value.trim() ==""){
                        modelo.className="Error";
                        error = true;
                    }
                    
                    if(capacidad.value.trim() ==""){
                        capacidad.className="Error";
                        error = true;
                    }
                    
                    if(!error){
                        
                    
                    
                    avion = new Avion(codigo.value.trim(),modelo.value.trim(),capacidad.value.trim());
                    Proxy.newAvion(avion,function(result){
                        
                        if(result == "no"){
                            codigo.className = "Error";
                            view.no();
                        }else{
                            view.yes();
                            document.getElementById("codigoTxt").value="";
                            document.getElementById("modeloTxt").value="";
                            document.getElementById("capacidadTxt").value=1;
                        }
                        
                        
                    });
                    }//if !Error
                },
                busquedaAvion:function(){
                    
                    var view = this.view;
                    var codigo = document.getElementById("codigoTxt");
                    var modelo = document.getElementById("modeloTxt");
                    var capacidad = document.getElementById("capacidadTxt");
                    codigo.classList.remove("Error");
                    modelo.classList.remove("Error");
                    capacidad.classList.remove("Error");
                    
                    if(codigo.value.trim() == ""){
                        codigo.className = "Error";
                    }else{
                        
                        Proxy.getAvion(document.getElementById("codigoTxt").value.trim(),function(result){
                           
        
                        if(result == null){
                            view.noFound();
                            codigo.className="Error";
                        }else{
                            model.avion = result;
                            codigo.disabled=true;
                            codigo.value = model.avion.codigo_Avion;
                            modelo.value = model.avion.modelo;
                            capacidad.value= model.avion.capacidad;
                            document.getElementById("EdicionVuelo").style.display  = "block";
                            document.getElementById("registrarBtn").disabled=true;
                        }
        
                        });
                    }//Else
                    
                },
                cancelarEdicion:function(){
                    
                    document.getElementById("codigoTxt").disabled=false;
                 document.getElementById("registrarBtn").disabled=false;
                 document.getElementById("codigoTxt").value="";
                  document.getElementById("modeloTxt").value="";
                  document.getElementById("capacidadTxt").value=0;
                  document.getElementById("EdicionVuelo").style.display  = "none";
                    
                },//,
                editarAvion:function(){
                 var view = this.view;
                 var codigo = document.getElementById("codigoTxt");
                 var modelo = document.getElementById("modeloTxt");
                 var capacidad = document.getElementById("capacidadTxt");
                 var error = false;
                 modelo.classList.remove("Error");
                 capacidad.classList.remove("Error");
                 
                 if(modelo.value.trim() == ""){
                     modelo.className = "Error";
                     error = true;
                 }
                 
                 if(capacidad.value.trim() == ""){
                     capacidad.className = "Error";
                     error = true;
                 }
                 
                 if(!error){
                     
                     avion = new Avion(codigo.value.trim(),modelo.value.trim(),capacidad.value.trim());
                     Proxy.actualizarAvion(avion,function(result){
                        
                        view.actualizado();
                     });
                     
                     
                 }//if !Error
                 

                }
                
                
            };//Prototype
            
        </script>
        
        <script>//View
           
           var model;
           var controller;
           
           function pageLoad(event){
               model = new Model();
               controller = new Controller(model,window);
           }
           
           function no(){
                window.alert("Codigo de Avión Ya existe");
            }
            
            function noFound(){
                window.alert("Codigo de Avión No Existe");
            }
            
            function yes(){
                window.alert("Avión Registrado");
            }
            
            function actualizado(){
                window.alert("Avión actualizado");
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
