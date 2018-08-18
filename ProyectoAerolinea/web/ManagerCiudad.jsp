<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Barrantes | Mantenimiento de Ciudades</title>
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
<i> <h1> <font face = "calibri" color = #81202a> Mantenimiento de Ciudades </font></h1> </i>
<br/></div></div><br/>
    
<form id="Formulario">
<div class ="row">     <!--Aquí está todo el form-->

<div class="col-sm-2">
<label>Código Ciudad:</label>
</div>

<div class="col-sm-4">
<input type="text" id="codigoTxt" required />
</div>

<div class="col-sm-2">
<label>Nombre Ciudad:</label>
</div>

<div class="col-sm-4">
<input type="text" id="nombreTxt" required />
</div>
</div></br></br>

<div class = "row">

<div class="row">
	<div class="col-sm-6 ">
            <input type="button" onclick="controller.newCiudad();" class="btn" id="registrarBtn" value="Registrar Ciudad"/>
		</div>	
    
    <div class="col-sm-6 ">
        <input type="button" onclick="controller.busquedaCiudad();" class="btn" id="buscarBtn" value="Buscar Ciudad"/>
		</div>	
    
    
		</div>

</div>
</form>	
</section>     
        <!--Fin agregar nueva ciudad-->


      
 <section id ="ELbuscador">
	 <div class ="container" id="buscador">
	 <div class = "row">
	 <div class = "row">
	 <div class ="col-sm-3">
	<i> <h1> <font face = "calibri" color = #81202a> Ciudades </font></h1> </i></div>
	 </div>
	 
	 <div class ="col-sm-5">
	 Código</div>
	 <div class ="col-sm-5">
	 Nombre</div>
	 </div>   
             
             
              <div class = "row"  id = "ciudadesDisp">
	 
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
                this.view=view;
            },
            newCiudad:function(){
                var view = this.view;
                var codigo = document.getElementById("codigoTxt");
                var nombre= document.getElementById("nombreTxt");
                
                nombre.classList.remove("Error");
            codigo.classList.remove("Error");
             var error = false;  
                
                
                if(codigo.value.trim() == ""){
                    codigo.className = "Error";
                    error = true;
                }
                
                if(nombre.value.trim() == ""){
                    nombre.className = "Error";
                    error = true;
                }
                
                
                if(!error){
                    
                    ciudad = new Ciudad(codigo.value.trim(),nombre.value.trim());
                    
                    Proxy.newCiudad(ciudad,function(result){
                        
                        if(result == "no"){
                            codigo.className = "Error";
                            view.no();
                        }else{
                            view.yes();
                            document.getElementById("codigoTxt").value="";
                            document.getElementById("nombreTxt").value="";
                            document.getElementById("ELbuscador").style.display = "none";
                        }
                        
                        
                    });
                }
                
            },
            
            busquedaCiudad:function(){
                 var view = this.view;
                var codigo = document.getElementById("codigoTxt");
                var nombre= document.getElementById("nombreTxt");
                
                nombre.classList.remove("Error");
            codigo.classList.remove("Error");                
                
                if(codigo.value.trim() == "" && nombre.value.trim() == ""){
                    codigo.className = "Error";
                    nombre.className = "Error";
                    view.ocultar();
                }else if(codigo.value.trim() == "" && nombre.value.trim() != ""){
                        //busqueda por nombre
                    criteria = nombre.value.trim();
                    Proxy.getCiudadesNombre(criteria,function(result){
                    
                    model.ciudades = result;
                     view.showCiudades();   
                    });
                    //fin busqueda por nombre

                }else if(codigo.value.trim() != "" && nombre.value.trim() ==""){
                    //busqueda por codigo
                    criteria =codigo.value.trim();
                    Proxy.getCiudadesCodigo(criteria,function(result){
                        
                     model.ciudades = result;
                     view.showCiudades();
                    });
                    
                    //fin busqueda por codigo

                }else{ //Si ambos campos están vacios se busca por el codigo
                     criteria =codigo.value.trim();
                    Proxy.getCiudadesCodigo(criteria,function(result){
                        
                     model.ciudades = result;
                     view.showCiudades();
                    });
                }
                          
                               
            },
            eliminarCiudad:function(codigo){
                var view = this.view;
                
                Proxy.eliminarCiudad(codigo,function(status){
                    
                    switch(status){
                        
            case 0:
                view.yesDeleted();
                document.getElementById("ELbuscador").style.display = "none";
                document.getElementById("codigoTxt").value="";
                document.getElementById("nombreTxt").value="";
                break;
                
            case 1:
                view.noDeleted();
                break;
                        
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
            }
            
            function no(){
                window.alert("Codigo de Ciudad Ya existe");
            }
            
            function yes(){
                window.alert("Ciudad Registrada");
            }
            
            function yesDeleted(){
                window.alert("Ciudad Eliminada");
            }
            
            function noDeleted(){
                window.alert("No puedes eliminar esta Ciudad, debido a que tiene un vuelo asociado");
            }
            
            function showCiudades(){
                var listado = document.getElementById("ciudadesDisp");
                listado.innerHTML="";
                
                var form = document.getElementById("ELbuscador");
                form.style.display = "block";
                
                
                if(model.ciudades.length < 1){
                No_Disponibles(listado);
                }
                else{

            for(i=0; i<model.ciudades.length; i++){
                listCiudad(listado,model.ciudades[i]);
                }
                
                        }//else
            }//show ciudades
                
function listCiudad(listado2, busqueda){



var div = document.createElement("div");
div.setAttribute("class","col-sm-5");
var c = "<p>"+busqueda.codigo+"</p>";

div.innerHTML = c;
listado2.appendChild(div);

var div2 = document.createElement("div");
div2.setAttribute("class","col-sm-5");

c = "<p>"+busqueda.nombre+"</p>";
div2.innerHTML = c;
listado2.appendChild(div2);


var div3 = document.createElement("div");
div3.setAttribute("class","col-sm-2");

c = "<input type ='button' onClick='controller.eliminarCiudad(\""+ busqueda.codigo +"\");' class = 'btn' value = 'Eliminar' id = 'eliminarbtn'></input><br/><br/>";
div3.innerHTML=c;
listado2.appendChild(div3);


}  
            
            
    function No_Disponibles(listado2){

var div = document.createElement("div");
div.setAttribute("class","col-sm-12");
var p = document.createElement("p");
p.innerHTML ="No existen ciudades con ese criterio";
div.appendChild(p);

listado2.appendChild(div);
}   
       
      function ocultar(){
          var form = document.getElementById("ELbuscador");
          form.style.display = "none";
      }
       
            document.addEventListener("DOMContentLoaded",pageLoad);
        </script>
        
        
        
    </body>
</html>
