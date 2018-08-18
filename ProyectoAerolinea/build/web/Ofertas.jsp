<html>
<head>
<meta charset="utf-8">

<title> Barrantes | Tu Sitio de Viajes </title>
<%@ include file="Imports.jspf"%>           <!-- Los estilos y los javascripts a llamar -->
</head>

<body>

 <%@include file = "Navigate.jspf" %>
		<!-- FIn Navegacion-->
	
	<!--Las Ofertas -->
	
	
	
	<section>
	<div class="container" id="buscador">
	<div class ="row">
	<div class="col-sm-12 ">
            <i> <h1> <font face = "calibri" color = #81202a> Ofertas del Mes </font></h1> </i>
	</div></div>
	
								<!--Cancï¿½n-->
	<div class ="row"></br></br>
	
	
	<div id = "dp">

	<!-- Aquí se carga lo del javascript -->
	
	</div>
	
		</div>
	</div>
	</section>
	</body>
	</html>
	
	
	<script>	//Model
	
	
	function ofertasModel(){
		this.ofertasModel();
	}
	
	
	ofertasModel.prototype ={
	
	
	ofertasModel : function(){
            }
        };
	
</script>

<script> 		//View

var model;
var controller;
function pageLoad(event){

model = new ofertasModel();
controller = new ofertasController(model,window);
}

function showOfertas(){

var listado = document.getElementById("dp");
listado.innerHTML = "";

for(i = 0; i<model.promo.length; i++){
listOfertas(listado,model.promo[i]);
}

}

function listOfertas(listado,oferta){

var div=document.createElement("div");
	div.setAttribute("class","col-md-4 col-sm-6");
	
	var d1=document.createElement("div");
	d1.setAttribute("class","single-about-detail");
	
	var d2=document.createElement("div");
	d2.setAttribute("class","about-img");
	
	var img=document.createElement("img");
	img.setAttribute("class","img-responsive");
	img.src="imagenes/"+oferta.codigo+".png";		
	d2.appendChild(img);
	
	var d3=document.createElement("div");
	d3.setAttribute("class","about-details");
	
	var h3=document.createElement("h3");
	h3.innerHTML=oferta.origen.nombre +"-" + oferta.destino.nombre;
	d3.appendChild(h3);
        
        
	
	var p2=document.createElement("p");
	p2.setAttribute("align","left");
	p2.innerHTML="A sólo $" +oferta.precio;
	d3.appendChild(p2);
                                                                //EL BOTON DE AGREGAR
      /*  var boton = document.createElement("input");
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
    
function ofertasController(model,view){
    this.ofertasController(model,view);
}
    
    
  ofertasController.prototype={
      
   ofertasController: function(model,view){
       this.model=model;
       this.view=view;
       
       Proxy.getPromo(function(result){
           
           model.promo= result;
           view.showOfertas();
       })
       
       
   }
      
      
      
  }  
    
</script>

