<html>
<head>
<meta charset="utf-8">

<title> Barrantes | Tu Sitio de Viajes </title>
<%@ include file="Imports.jspf" %>               <!-- Los estilos y los javascripts a llamar -->
</head>

<body>
 <%@include file = "Navigate.jspf" %>		
		<!-- FIn Navegacion-->



<section>
<div class = "container" id="buscador">

<div class ="row">

	<div class="col-sm-12 ">
	 <i> <h1> <font face = "calibri" color = #81202a> Nuestros Vuelos </font></h1> </i>
	</div> </div>
	
	<div class="row">
	<div id ="dp">
	
	<!-- Aqui va la info -->
	
	
	</div>
	
		</div>
	
		</div> <!--Del conteiner-->
		
</body>
</html>



<script>	//model

function vuelosModel(){
	this.vuelosModel();
}
	
	vuelosModel.prototype={
	
	vuelosModel: function(){     
                                }
        };


</script>

<script>	//view

var model;
var controller;
function pageLoad(event){

model = new vuelosModel();
controller = new vuelosController(model,window);

}

function showVuelos(){

var listado = document.getElementById("dp");
listado.innerHTML = "";

for(i = 0; i<model.vuelos.length; i++){
listVuelos(listado,model.vuelos[i]);
}

}

function listVuelos(listado,vue){

var div=document.createElement("div");
	div.setAttribute("class","col-md-4 col-sm-6");
	
	var d1=document.createElement("div");
	d1.setAttribute("class","single-about-detail");
	
	var d2=document.createElement("div");
	d2.setAttribute("class","about-img");
	
	var img=document.createElement("img");
	img.setAttribute("class","img-responsive");
	img.src="imagenes/"+vue.codigo+".png";		
	d2.appendChild(img);
	
	var d3=document.createElement("div");
	d3.setAttribute("class","about-details");
	
	var h3=document.createElement("h3");
	h3.innerHTML=vue.origen.nombre +"-" + vue.destino.nombre;
	d3.appendChild(h3);
	
	
	var p2=document.createElement("p");
	p2.setAttribute("align","left");
	p2.innerHTML="A sólo $" +vue.precio;
	d3.appendChild(p2);

                                                            //EL BOTON DE AGREGAR
       /* var boton = document.createElement("input");
        boton.setAttribute("type","button");
        boton.setAttribute("class","btn");
        boton.setAttribute("id","buscarBtn");
        boton.setAttribute("value","Agregar Destino");
	d3.appendChild(boton);*/


	
	d1.appendChild(d2);
	d1.appendChild(d3);
	div.appendChild(d1);
	
	listado.appendChild(div);

}
	  document.addEventListener("DOMContentLoaded",pageLoad)

</script>

<script>	//controller
    
    function vuelosController(model,view){      
        this.vuelosController(model,view);    
    }
    
    vuelosController.prototype={
        
    vuelosController: function(model,view){
        this.model=model;
        this.view=view;
        
       Proxy.getVuelos(function (result){
           model.vuelos = result;
           view.showVuelos();
       })
    }
        
        
    }
    
</script>

