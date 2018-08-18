<html>
<head>
<meta charset="utf-8">


<title> Barrantes | Tu Sitio de Viajes </title>
<%@ include file="Imports.jspf"%>           <!-- Los estilos y los javascripts a llamar -->
</head>

<body>
 <%@include file = "Navigate.jspf" %>		
		<!-- FIn Navegacion-->
		
<section>
<form>
<div class = "container" id="buscador">

<div class ="row">
<div class="col-sm-12 ">
 <i> <h1> <font face = "calibri" color = #81202a> Bienvenido al Equipo </font></h1> </i>
</div></div>
    <br> </br>
<form id="Formulario">
<div class ="row">     <!--Aquí está todo el form-->

<div class="col-sm-2">
<label>Nombre:</label>
</div>

<div class="col-sm-4">
<input type="text" id="nombreTxt" required />
</div>

<div class="col-sm-2">
<label>Apellidos:</label>
</div>

<div class="col-sm-4">
<input type="text" id="apellidosTxt" required />
</div>
</div><br/>

<div class="row">
<div class="col-sm-2">
<label>Nombre de Usuario:</label>
</div>

<div class="col-sm-4">
<input type="text" id="usuarioTxt" required />
</div>

<div class="col-sm-2">
<label>Contraseña:</label>
</div>

<div class="col-sm-4">
<input type="text" id="claveTxt"  required />
</div>
</div><br/>

<div class="row">	
<div class="col-sm-2">
<label>Correo Electrónico:</label>
</div>

<div class="col-sm-4">
<input type="text" id="correoTxt" required />
</div>

<div class="col-sm-2">
<label>Fecha de Nacimiento:</label>
</div>

<div class="col-sm-4">
<input type="text" id="nacimientoTxt"  class="datepicker" maxlength="10"  required />
</div>
</div><br/>

<div class="row">
<div class="col-sm-2">
<label>Dirección:</label>
</div>

<div class="col-sm-4">
<input type="text" id="direccionTxt"  required />
</div>

<div class="col-sm-2">
<label>Teléfono de Trabajo:</label>
</div>

<div class="col-sm-4">
<input type="text" id="telTxt" onkeypress="return Numeros(event)"  maxlength="12" required />
</div>
</div></br>


<div class="row">
	<div class="col-sm-12 ">
            <input type="button" onclick="controller.signIn();" class="btn" id="registrarBtn" value="Registrarse"/>
		</div>	
		</div>

</div>
</form>
</section>


</body>
</html>


<script> //Model
    function Model(){
        this.Model();
    }
    
    Model.prototype={
        Model:function(){            }
    };
    
    </script><!--Model-->

    
    <script> //Controller
        
        function Controller(model,view){
            this.Controller(model,view);
        }
        
        Controller.prototype={
            Controller: function(model,view){
                this.model=model;
                this.view=view;
            },
            
            signIn: function(){
                var view = this.view;
                
                var nombre = document.getElementById("nombreTxt");
                var apellido = document.getElementById("apellidosTxt");
                var usuario = document.getElementById("usuarioTxt");
                var clave = document.getElementById("claveTxt");
                var correo = document.getElementById("correoTxt");
                var nacimiento = document.getElementById("nacimientoTxt");
                var direccion = document.getElementById("direccionTxt");
                var telefono = document.getElementById("telTxt");
                
                
                nombre.classList.remove("Error");
                apellido.classList.remove("Error");
                usuario.classList.remove("Error");
                clave.classList.remove("Error");
                correo.classList.remove("Error");
                nacimiento.classList.remove("Error");
                direccion.classList.remove("Error");
                telefono.classList.remove("Error");
                var error = false;
                
                if(nombre.value.trim() ==""){
                    nombre.className="Error";
                    error = true;
                }
                
                if(apellido.value.trim()==""){
                    apellido.className="Error";
                    error=true;
                }
                
                if(usuario.value.trim()==""){
                    usuario.className="Error";
                    error=true;
                }
                
                if(clave.value.trim()==""){
                    clave.className="Error";
                    error=true;
                }
                
                if(correo.value.trim()==""){
                    correo.className="Error";
                    error=true;
                }
                
                if(nacimiento.value.trim()==""){
                    nacimiento.className="Error";
                    error = true;
                }
                
                if(direccion.value.trim()==""){
                    direccion.className="Error";
                    error = true;
                }
                
                if(telefono.value.trim()==""){
                    telefono.className="Error";
                    error=true;
                }
                
                if(!error){
                    
                cliente = new Cliente(usuario.value.trim(),nombre.value.trim(),apellido.value.trim(),
                clave.value.trim(),correo.value.trim(),nacimiento.value.trim(),direccion.value.trim(),
                telefono.value.trim(),1);
                
                Proxy.SignIn(cliente,function(result){
                        
                    switch(result.tipo){
                        case 0: //Nombre de Usuario ya existe
                            view.YaExiste();
                            usuario.className="Error";
                            break;
                            
                        case 1:
                        view.Ingresado();
                        document.location="/ProyectoAerolinea/PaginaPrincipal.jsp"
                        break;
                    }
                    
                   });
                    
                    
                }//!Error
                
            }//SIGN_IN
            
      
        };
        
        </script>
        
        
        <script> //View
            var model;
            var controller;
            
            function pageLoad(event){
                model = new Model();
                controller = new Controller(model,window);
            }
            
            function Ingresado(){
                window.alert("Te has registrado");
            }
            
            function YaExiste(){
                window.alert("El nombre de Usuario Ya existe");
            }
            
       document.addEventListener("DOMContentLoaded",pageLoad);
        </script>
    
<script>

$(function() {
	$(".datepicker").datepicker({dateFormat: 'dd/mm/yy', changeMonth: true, changeYear: true, yearRange: '-100:+0'});
});

function Numeros(e){
 
	var key = window.Event ? e.which : e.keyCode
	return (key >= 48 && key <= 57 ||key==43 )

}

</script>