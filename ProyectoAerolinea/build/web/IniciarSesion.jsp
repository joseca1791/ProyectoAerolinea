<html>
<head>
  <meta charset="utf-8">

<title> Barrantes | Tu Sitio de Viajes </title>
<%@ include file="Imports.jspf"%>           <!-- Los estilos y los javascripts a llamar -->
</head>

<body>
 <%@include file = "Navigate.jspf" %>
 <!--Fin Navegación-->
		
		<!-- Iniciar Sesion-->
		
<section>
<form>
<div class = "container" id="buscador">
<div class ="row">
<div class="col-sm-12 ">
 <i> <h1> <font face = "calibri" color = #81202a> Iniciar Sesión </font></h1> </i>
<br/></div></div>


<form id="Formulario">
<div class ="row">     <!--Aquí está todo el form-->

<div class="col-sm-2">
<label>Nombre de Usuario:</label>
</div>

<div class="col-sm-4">
<input type="text" id="nombreUsuarioTxt" required />
</div>

<div class="col-sm-2">
<label>Contraseña:</label>
</div>

<div class="col-sm-4">
<input type="password" id="passwordTxt" required />
</div>
</div></br></br>

<div class = "row">

<div class="row">
	<div class="col-sm-12 ">
		<input type="button" onclick="controller.login();" class="btn" id="registrarBtn" value="Iniciar Sesión"/>
		</div>	
		</div>

</div>
</form>	
		
    
    <script>//Model
          function Model() {
    this.Model();
  }
  
  Model.prototype={
	Model: function(){
        }
  };       
    </script>
    
    <script> //Controller
        
        function Controller(model,view){
            this.Controller(model,view);
        }
        
        Controller.prototype={
	Controller: function(model,view){
		this.model=model;
		this.view=view;
	},
        login: function(){
            var view=this.view;
            
            var nombreUser = document.getElementById("nombreUsuarioTxt");
            var clave = document.getElementById("passwordTxt");
            
            nombreUser.classList.remove("Error");
            clave.classList.remove("Error");
             var error = false;                                   //Verificar que los campos no esten vacios
             
            if(nombreUser.value.trim() == ""){
                nombreUser.className="Error";
                error = true;
             }
            if(clave.value.trim() == ""){
                clave.className="Error";
                error = true;
            }                               //FIN Verificar que los campos no esten vacios
          
          if(!error){
          
            usuario = new Cliente(nombreUser.value.trim(),"","",clave.value.trim(),
            "","","","",0);
            Proxy.userLogin(usuario,function(usuario){
                
             switch(usuario.tipo){
                 case 0: //usuario no existe
                 view.showErrorMessage();
                 break;
                 
            case 1: //cliente
                document.location = "/ProyectoAerolinea/PaginaPrincipal.jsp";
                break;
                
            case 2: //manager
                document.location = "/ProyectoAerolinea/ManagerCiudad.jsp";
                break;
             }   
                
                
            });
            
        }
            
            }//Del Login
        };//DEl prototype
        </script>
        
    
        <script>//View
            
            var model;
            var controller;
            
            function pageLoad(event){
                model= new Model();
                controller = new Controller(model,window);
            }
            
            function showErrorMessage(){
                window.alert("Usuario no Existe");
            }
    
    	document.addEventListener("DOMContentLoaded",pageLoad);

                 </script>
    
    
    
		</body>
		</html>