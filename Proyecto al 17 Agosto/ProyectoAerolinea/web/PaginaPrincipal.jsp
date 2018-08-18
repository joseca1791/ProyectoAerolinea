<html>
    <head>
        <meta charset="utf-8">

        <title> Barrantes | Tu Sitio de Viajes </title>
        <%@ include file="Imports.jspf"%>           <!-- Los estilos y los javascripts a llamar -->
    </head>

    <body>
        <%@include file = "Navigate.jspf" %>


        <!--Formulario busqueda de Viajes-->

        <section>
            <form >
                <div class = "container" id="buscador">
                    <div class ="row">
                        <div class="col-sm-12 ">
                            <h1> <font face = "calibri" color = #81202a><i> Grandes Experiencias </i></font></h1>
                            <br/></div></div>

                    <div class ="row">

                        <div class="col-sm-6">
                            <label>Origen</label>
                            <i class="fa fa-map-marker" aria-hidden="true"></i>
                            <select id="origenTxt"></select>
                        </div>

                        <div class="col-sm-6">
                            <label>Destino</label>
                            <i class="fa fa-map-marker"></i>
                            <select id="destinoTxt"></select>
                        </div>
                    </div><br/>


                    <div class="row">

                        <div class="col-sm-3">
                            <label>¿En qué fechas? </label><i class="fa fa-calendar" ></i>
                            <input   class ="datepicker form-control" readonly placeholder="Partida" id="partidaTxt"/><br/>
                        </div>
                              
                        <div class="col-sm-3">
                            <label><br/></label>
                            <input  class="datepicker form-control" readonly placeholder="Regreso" id="regresoTxt" disabled />
                        </div>


                        <div class="col-sm-3">
                            <label>Pasajeros</label><i class="fa fa-users"></i>
                            <input id="adultosTxt" type="number" value=1 onkeypress="return Numeros(event)" min="1" max="8" class="form-control" maxlength="2">
                            <br/></div>

                       
                        
                        
                    </div>


                    <div class="row">
                        <div class="col-sm-3 ">
                            <input type="radio"  name="tipo" value="Ida" id="ida" checked onclick="controller.habilitar();">Solo Ida</input></div>
                        <div class="col-sm-3 ">
                            <input type="radio"  name="tipo" value="Ida/Vuelta" id="ambas" onclick="controller.habilitar();">&nbsp;Ida/Vuelta</input>
                        </div></div>

                    <div class="row">
                        <div class="col-sm-12 ">
                            <i> <input type="button"  class="btn" onclick="controller.buscar();" id="buscarBtn"  <font face = "calibri"  value="Buscar" > </font> </i>
                        </div>	
                    </div>

                </div>
            </form>
        </section>

        <!-- FIN Formulario Busqueda de Viajes -->


        <!-- Para busqueda de Vuelos -->
        <section id ="ELbuscador">
            <div class ="container" id="buscador">
                <div class = "row">
                    <div class = "row">
                        <div class ="col-sm-3">
                            <h1> <font face = "calibri" color = #81202a><i> Viajes Disponibles </i></font></h1></div>
                    </div>

                    <div class ="col-sm-2">
                        Origen</div>
                    <div class ="col-sm-2">
                        Destino</div>
                    <div class ="col-sm-2">
                        Precio</div>
                    <div class ="col-sm-2">
                        Fecha</div>
                    <div class ="col-sm-2">
                        Espacios Disponibles</div>    
                    <div class ="col-sm-2">
                        Añadir</div>
                </div>

                <div class = "row"  id = "vuelosDisp" >
                    <!--Aqui es donde se carga dinamicamente mediante el script-->
                </div>
            </div>
        </section>
        <!--Fin Busqueda de vuelos-->

        
        <!-- Para Seleccionar el nombre de los pasajeros-->

        <section>
            <div class ="container" id="viajeros"><!--El GENERAL-->

            </div>
        </section>


        <!--Fin seleccionar el nombre de los pasajeros-->
        
        
        
        <!-- PROMOCIONES-->
        <section>
            <div class="container" id="slider">
                <div class="row">
                    <h1><font face = "calibri" color = #81202a><i> Ofertas</i> </font</h1>
                </div>

                <ul class="bxslider" id="bxslider">

                </ul>
            </div>

        </section>
        <!--Fin Slider de Promociones-->




        <!--FIN PROMOCIONES-->

        <!--Pie de Pagina-->

        <br/><br/><br/>	 
        <footer>
            <a href="Nosotros.jsp"> <p> <font face = "calibri" color = #81202a> <i>  Acerca de Nosotros </i></font></p> </a>
        </footer>




        <script>	//model


            function vuelosModel() {
                this.vuelosModel();
            }

            vuelosModel.prototype = {

                vuelosModel: function () {

                }
            };
        </script>



        <script>	//Controller

            function Controller(model, view) {
                this.Controller(model, view);
            }


            Controller.prototype = {

                Controller: function (model, view) {

                    this.model = model;
                    this.view = view;
                    this.getCiudades();
                    this.getPromos();
                    this.clientGet();

                },

                getCiudades: function () {
                    Proxy.getCiudades(function (result) {
                        this.model.ciudades = result;
                        this.model.cart = [];
                        var origen = document.getElementById("origenTxt");
                        var destino = document.getElementById("destinoTxt");
                        for (i = 0; i < model.ciudades.length; i++) {
                            origen.options[i] = new Option(model.ciudades[i].nombre);
                            destino.options[i] = new Option(model.ciudades[i].nombre);
                        }


                    });
                },

                getPromos: function () {
                    view = this.view;
                    Proxy.getPromo(function (result) {
                        this.model.promo = result;
                        view.showPromos();
                    }
                    );


                },
                
                clientGet:function(){
                    var model   = this.model;
                    Proxy.clientGet(function(result){
                        model.cliente = result;
                        
                        
                    });
                    
                    
                },
                buscar: function () {

                    var error = false;
                    var origen = document.getElementById("origenTxt");
                    var destino = document.getElementById("destinoTxt");
                    var ida = document.getElementById("ida");
                    var ambas = document.getElementById("ambas");
                    var partida = document.getElementById("partidaTxt");
                    var regreso = document.getElementById("regresoTxt");
                    ida.classList.remove("invalid");
                    ambas.classList.remove("invalid");
                    partida.style.borderColor = "";
                    regreso.style.borderColor = "";
                    document.getElementById("viajeros").style.display="none";
                     this.model.cart.splice(0, this.model.cart.length); // Eliminar los viajes del carrito
                    
                    
                    if (!ida.checked && !ambas.checked) {
                        ida.className = "invalid";
                        ambas.className = "invalid";
                        error = true;
                    }

                    if (partida.value == "") {
                        partida.style.borderColor = "red";
                        error = true;
                    }

                    if (regreso.value == "" && !ida.checked) {
                        regreso.style.borderColor = "red";
                        error = true;
                    }

                    if (!error) {
                        var model = this.model;
                        var view = this.view;

                        if (ida.checked) {//SOLO IDA

                            var origenPos = origen.selectedIndex;
                            ciudadOrigen = model.ciudades[origenPos];
                            var destinoPos = destino.selectedIndex;
                            ciudadDestino = model.ciudades[destinoPos];
                            Proxy.viajeSoloIDA(ciudadOrigen, ciudadDestino, partida.value, function (result) {

                                this.model.buscados = result;
                                view.showBuscados();

                            });
                        } else {//FIN SOLO IDA    else{}

                            var origenPos = origen.selectedIndex;
                            ciudadOrigen = model.ciudades[origenPos];
                            var destinoPos = destino.selectedIndex;
                            ciudadDestino = model.ciudades[destinoPos];

                            Proxy.viajeAmbos(ciudadOrigen, ciudadDestino, partida.value, regreso.value, function (result) {
                                this.model.buscados = result;
                                view.showBuscados();
                            });
                        }

                    }//AQUI TERMINA !ERROR


                }, //DEL FUNCTION BUSCAR,

                addViaje: function (codigo, i) {

                    var boton = document.getElementById("checkBtn" + i);
                    

                    if (boton.checked) {

                        var viajeSeleccionado = this.model.buscados.find(function (p) {
                            return p.codigo == codigo;
                        });
                        this.model.cart.push(viajeSeleccionado);

                    } else {
                        this.model.cart.splice(i, 1);

                    }
                    
        
                }, //Del addViaje,

                habilitar: function () {

                    var opcion = document.getElementById("ambas");

                    if (opcion.checked) {
                        document.getElementById("regresoTxt").disabled = false;
                    } else {
                        document.getElementById("regresoTxt").disabled = true;

                    }

                }, //del Habilitar

                proceder:function(){
                    
                    if(this.model.cart.length == 0){
                    
                this.view.alert("No has seleccionado ningun viaje");}
                    else{
                    
                    
                 document.getElementById("ELbuscador").style.display="none";
                   var principal =  document.getElementById("viajeros");
                   var pasajeros = parseInt(document.getElementById("adultosTxt").value);
                    principal.innerHTML = "";
                    
                    for(i=0; i< pasajeros; i++){
                        this.view.showPasajeros(principal,i); // yo mando el conteiner
                    }
                    this.view.botones(principal,pasajeros,this.model.cart);
                    
                    
                  for(j = 1; j<=pasajeros; j++){
                      
                   var lugar = document.getElementById("asiento"+j);
                   
                   for( n = 0; n<this.model.cart[0].avion.capacidad; n++){
                       lugar.options[n] = new Option(n+1);
                   }
               }
                    
                    
                    principal.style.display="block";
        }//El else de si cart >0 
                },//Del proceder,
                
                cancel:function(){
                    
                    var busqueda = document.getElementById("ELbuscador");
                    var viajeros = document.getElementById("viajeros");
                    
                    busqueda.style.display="block";
                    viajeros.style.display="none";
                    
                },//del cancel,
                dolar:function(){
                    Proxy.dolar(function(result){
                       
                        var cambio = result;
                        var precio = parseInt(cambio);
                        var pasajeros = parseInt(document.getElementById("adultosTxt").value);
                        this.view.dolar(precio,pasajeros,this.model.cart);
                        
                    });
                },//Del Dolar
                comprar:function(){
                                              
                    var cliente = this.model.cliente;
                    var model = this.model;
                    var view = this.view;
                    if(cliente == null){
                        this.view.alert("Debes iniciar sesión para poder comprar");
                    }else{
                        
                            if(cliente.tipo == 2){
                            document.getElementById("btnComprar").disabled = true;
                        }
                    
                    var pasajeros = parseInt(document.getElementById("adultosTxt").value);
                    var error = false;
                    
                    for(i = 1; i<=pasajeros; i++){
                        
                        var espacio = document.getElementById("nombrePasajeroTxt"+i);
                        espacio.classList.remove("Error");
                        if(espacio.value.trim() == ""){
                            espacio.className = "Error";
                            error  = true;
                        }
                        
                        espacio = document.getElementById("apellidoPasajeroTxt"+i);
                        espacio.classList.remove("Error");
                        if(espacio.value.trim() == ""){
                            espacio.className = "Error";
                            error = true;
                        }
                        
                        espacio = document.getElementById("pasaporteTxt"+i);
                        espacio.classList.remove("Error");
                        if(espacio.value.trim() == ""){
                            espacio.className = "Error";
                            error = true;
                        }
                    }
                    
                    espacio = document.getElementById("tarjetaTxt");
                    espacio.classList.remove("Error");
                    if(espacio.value.trim() == ""){
                        espacio.className= "Error";
                        error = true;
                    }
                    
                    espacio = document.getElementById("seguridadTxt");
                    espacio.classList.remove("Error");
                    if(espacio.value.trim()==""){
                        espacio.className= "Error";
                        error = true;
                    }
                    
                    espacio = document.getElementById("vencimientoTxt");
                    espacio.classList.remove("Error");
                    if(espacio.value.trim() == ""){
                        espacio.className ="Error";
                        error = true;
                    }
               //Para evitar repetir campos     
                    var viajantes = parseInt(document.getElementById("adultosTxt").value);
                    model.ocupados = [];
                    if(viajantes > 1){
                        for(i = 1; i<= viajantes; i++){//Cuantos pasajeros hay
                            espacio = document.getElementById("asiento"+i).value;
                            if(model.ocupados.includes(espacio)){
                                view.alert("Asiento Duplicado");
                                error = true;
                            }else{
                                model.ocupados.push(espacio);
                           }
                            
                        }
                    }
                    
                    if(!error){
                        
                  model.reservaciones = [];
                  model.reservacionesHechas = [];
                  model.viajeros = [];
                model.tiquetes = [];
                 
                  for(a = 0; a<model.cart.length; a++){// For de Reservaciones
                      model.reservaciones.push(model.cart[a]);
                  }//Fin For de Reservaciones
                        
                 Proxy.comprar(model.reservaciones,model.cliente,function(result){
                          
                      model.reservacionesHechas = result;    
                      
                      
                      var pasajeros = parseInt(document.getElementById("adultosTxt").value);
      
                      for(j = 1 ; j<=pasajeros; j++){//Hacer los pasajeros
                          pasajero = new Pasajero(document.getElementById("pasaporteTxt"+j).value.trim(),document.getElementById("nombrePasajeroTxt"+j).value.trim(),
                       document.getElementById("apellidoPasajeroTxt"+j).value.trim(),document.getElementById("asiento"+j).value.trim());
                       model.viajeros.push(pasajero);
                      }
                      
                      Proxy.tiquetes(model.reservacionesHechas,model.viajeros,function(result){
                         
                      this.view.alert("Gracias por tu compra, Feliz Viaje!!!");
                      document.location="/ProyectoAerolinea/PaginaPrincipal.jsp";

                      });//Del proxy.tiquetes
      
                    });//Del Proxy.comprar
                    
                    }//Del !Error
                }//Del else que sí está loggeado
                }//Del Comprar Function
                
                
                
            };//Del prototype


        </script>

        
        
        
        
        



        <script>	//View

            var model;
            var controller;

            function pageLoad(event) {
                model = new vuelosModel();
                controller = new Controller(model, window);


                $(".datepicker").datepicker({dateFormat: 'dd/mm/yy', minDate: -0});


                //$("#buscarBtn").click(function(){controller.buscar()});

            }


            function showPromos() {


                var listado = document.getElementById("bxslider");
                listado.innerHTML = "";


                for (i = 0; i < model.promo.length; i++) {
                    listPromos(listado, model.promo[i]);
                }
                $('.bxslider').bxSlider({
                    auto: true,
                    captions: true
                });
            }

            function listPromos(listado, prom) {



                var li = document.createElement("li");

                var link = document.createElement("a");
                link.setAttribute("href", "Ofertas.jsp");

                var imagen = document.createElement("img");
                imagen.src = "imagenes/"+prom.codigo+".png";
                imagen.title = prom.origen.nombre + "-" + prom.destino.nombre;


                link.appendChild(imagen);
                li.appendChild(link);
                listado.appendChild(li);


            }


            function showBuscados() {

                var listado2 = document.getElementById("vuelosDisp");
                listado2.innerHTML="";

                var form = document.getElementById("ELbuscador");
                form.style.display = "block";


                if (model.buscados.length < 1) {
                    No_Disponibles(listado2);
                } else {


                    for (i = 0; i < model.buscados.length; i++) {
                        listViaje(listado2, model.buscados[i], i);
                    }

                    var divRow = document.createElement("div");
                    divRow.setAttribute("class", "row");
                    var div7 = document.createElement("div");
                    div7.setAttribute("class", "col-sm-12");

                    var c = "<input type = 'button' class = 'btn' onclick='controller.proceder();'  id = 'buscarBtn' value = 'Proceder Compra'></input>";
                    div7.innerHTML = c;
                    divRow.appendChild(div7);
                    listado2.appendChild(divRow);
                }


            }

            function listViaje(listado2, busqueda, i) {

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
                div5.setAttribute("class", "col-sm-2");
                c = "<p>" + (busqueda.avion.capacidad - busqueda.vendidas) + "</p>";//Cierro div3

                div5.innerHTML = c;
                listado2.appendChild(div5);


                var div6 = document.createElement("div");
                div6.setAttribute("class", "col-sm-2");
                c = "<input type = 'checkbox' onClick='controller.addViaje(\"" + busqueda.codigo + "\"," + i + ");' id = 'checkBtn" + i + "'></input><br/><br/><br/>";
                div6.innerHTML = c;
                listado2.appendChild(div6);

            }

            function showPasajeros(principal,i){      //principal es viajeros (conteiner)
               var pos = i+1;
                
                var divPrincipal = document.createElement("div");
                divPrincipal.setAttribute("class","row");
                
                var c = "<div class = 'row'>"+
                        "<div class = 'col-sm-3'>"+
                        "<h1>Viajero "+pos+"</h1><br/></div>  </div>"+
                        
                        
                        "<div class = 'row'>"+
                        "<div class = 'col-sm-1'>"+
                        "<label>Nombre:</label></div>"+
                        "<div class = 'col-sm-2'>"+
                        "<input type = 'text' id='nombrePasajeroTxt"+pos+"'></input></div>"+
                        
                        "<div class = 'row'>"+
                        "<div class = 'col-sm-1'>"+
                        "<label>Apellido:</label></div>"+
                        "<div class = 'col-sm-2'>"+
                        "<input type = 'text' id = 'apellidoPasajeroTxt"+pos+"'></input></div>"+
                        
                        "<div class = 'row'>"+
                        "<div class = 'col-sm-1'>"+
                        "<label>Pasaporte:</label></div>"+
                        "<div class = 'col-sm-2'>"+
                        "<input type = 'text' id = 'pasaporteTxt"+pos+"'></input></div>"+
                        
                        "<div class = 'row'>"+
                        "<div class = 'col-sm-1'>"+
                        "<label>Asiento:</label></div>"+
                        "<div class = 'col-sm-2'>"+
                        "<select  id='asiento"+pos+"' >  </select></div>"+
                        
                        "</div><br/><br/>";

                divPrincipal.innerHTML = c;
                principal.appendChild(divPrincipal);
                
               };
               
               function botones(principal,pasajeros,carrito){
                   
                
                   var precio = 0;
                   
                   for(i =0 ; i<carrito.length; i++){
                       precio += (pasajeros * carrito[i].vuelo.precio);
                   }
                   
                   var div = document.createElement("div");
                   div.setAttribute("class","row");
                   
                   var c = "<div class = 'row'>"+
                           "<div class = 'col-sm-2'>"+
                           "<label>Precio Total: <p>$: "+precio+"</p></label></div>"+
                           
                            
                           "<div class = 'col-sm-2'>"+
                           "<input type = 'button' onclick='controller.dolar();' class = 'btn1' value= 'Ver en colones'></input></div>"+
                           
                           "<div class = 'col-sm-2' id = 'dolar'>"+
                           "</div>"+
                           
                   
                   "</div>";
                   
                   div.innerHTML = c;
                   principal.appendChild(div);
                   
                   
                   
                    var divPrincipal = document.createElement("div");
                divPrincipal.setAttribute("class","row");
                
                
              var  c="<div class = 'row'>"+
                  "<div class = 'col-sm-4'>"+
                  "<label>Número de Tarjeta:</label>"+
                 "<input type = 'text' id='tarjetaTxt'></input></div>"+
                 
                 "<div class = 'col-sm-4'>"+
                  "<label>CódigoSeguridad:</label>"+
                 "<input type = 'text' id='seguridadTxt'></input></div>"+
                 
                 "<div class = 'col-sm-4'>"+
                 "<label>Vencimiento:</label>"+
                 "<input class = 'datepicker' id='vencimientoTxt'/></div>"+
                
                  
                
                "</div><br/><br/>"+
                        
                        
               "<div class = 'row'>"+
                        "<div class = 'col-sm-2'>"+
                        "<input type= 'button' onclick='controller.cancel();' class='btn' value = 'Cancelar'></input></div>"+
                      "<div class = 'col-sm-8'></div>"+
                      "<div class = 'col-sm-2'>"+
                    "<input type= 'button' id = 'btnComprar' onclick='controller.comprar();' class='btn' value = 'Comprar'></input></div>"+

                
                "</div>";
                
                divPrincipal.innerHTML = c;
                principal.appendChild(divPrincipal);
               }

               function dolar(colones,pasajeros,carrito){
                   
                     var precio = 0;
                   
                   for(i =0 ; i<carrito.length; i++){
                       precio += (pasajeros * (carrito[i].vuelo.precio * colones));
                   }
                   
                   var ventana = document.getElementById("dolar");
                   ventana.innerHTML = "<p>"+precio+" Colones</p>";
                   
               }

            function No_Disponibles(listado2) {

                var div = document.createElement("div");
                div.setAttribute("class", "col-sm-12");
                var p = document.createElement("p");
                p.innerHTML = "No hay vuelos disponibles a estos destinos";
                div.appendChild(p);

                listado2.appendChild(div);
            }



            document.addEventListener("DOMContentLoaded", pageLoad)

        </script>

        <script>

            function Numeros(e) {


                var key = window.Event ? e.which : e.keyCode
                return (key >= 48 && key <= 57 || key == 43)

            }
        </script>  

    </body>
</html>


