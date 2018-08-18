var Proxy = Proxy || {};

Proxy.getCiudades = function (callBack){
    
    var AJAX_req = new XMLHttpRequest();
    url = "/ProyectoAerolinea/Servlet?action=ciudadListAll";
     AJAX_req.open("GET",url,true);
    AJAX_req.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    AJAX_req.onreadystatechange = function(){     
        if(AJAX_req.readyState === 4 && AJAX_req.status === 200){
            var object = JSON.parse(AJAX_req.responseText,JsonUtils.revive);
            callBack(object);
        }   
    };  
    AJAX_req.send(); 
};

Proxy.getTodosVuelos = function (callBack){
    
    var AJAX_req = new XMLHttpRequest();
    url = "/ProyectoAerolinea/Servlet?action=todosVuelos";
     AJAX_req.open("GET",url,true);
    AJAX_req.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    AJAX_req.onreadystatechange = function(){     
        if(AJAX_req.readyState === 4 && AJAX_req.status === 200){
            var object = JSON.parse(AJAX_req.responseText,JsonUtils.revive);
            callBack(object);
        }   
    };  
    AJAX_req.send(); 
};

Proxy.getTodosAviones = function (callBack){
    
    var AJAX_req = new XMLHttpRequest();
    url = "/ProyectoAerolinea/Servlet?action=todosAviones";
     AJAX_req.open("GET",url,true);
    AJAX_req.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    AJAX_req.onreadystatechange = function(){     
        if(AJAX_req.readyState === 4 && AJAX_req.status === 200){
            var object = JSON.parse(AJAX_req.responseText,JsonUtils.revive);
            callBack(object);
        }   
    };  
    AJAX_req.send(); 
};


Proxy.getCiudadesNombre = function (criteria,callBack){
    
    var AJAX_req = new XMLHttpRequest();
    url = "/ProyectoAerolinea/Servlet?action=getCiudadesNombre";
     AJAX_req.open("POST",url,true);
    AJAX_req.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    AJAX_req.onreadystatechange = function(){     
        if(AJAX_req.readyState === 4 && AJAX_req.status === 200){
            var object = JSON.parse(AJAX_req.responseText,JsonUtils.revive);
            callBack(object);
        }   
    };  
    AJAX_req.send("criteria="+criteria); 
};

Proxy.getViajesCodigo = function (criteria,callBack){
    
    var AJAX_req = new XMLHttpRequest();
    url = "/ProyectoAerolinea/Servlet?action=getViajesCodigo";
     AJAX_req.open("POST",url,true);
    AJAX_req.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    AJAX_req.onreadystatechange = function(){     
        if(AJAX_req.readyState === 4 && AJAX_req.status === 200){
            var object = JSON.parse(AJAX_req.responseText,JsonUtils.revive);
            callBack(object);
        }   
    };  
    AJAX_req.send("criteria="+criteria); 
};

Proxy.getViajesFecha = function (criteria,callBack){
    
    var AJAX_req = new XMLHttpRequest();
    url = "/ProyectoAerolinea/Servlet?action=getViajesFecha";
     AJAX_req.open("POST",url,true);
    AJAX_req.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    AJAX_req.onreadystatechange = function(){     
        if(AJAX_req.readyState === 4 && AJAX_req.status === 200){
            var object = JSON.parse(AJAX_req.responseText,JsonUtils.revive);
            callBack(object);
        }   
    };  
    AJAX_req.send("criteria="+criteria); 
};

Proxy.getCiudadesCodigo = function (criteria,callBack){
    
    var AJAX_req = new XMLHttpRequest();
    url = "/ProyectoAerolinea/Servlet?action=getCiudadesCodigo";
     AJAX_req.open("POST",url,true);
    AJAX_req.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    AJAX_req.onreadystatechange = function(){     
        if(AJAX_req.readyState === 4 && AJAX_req.status === 200){
            var object = JSON.parse(AJAX_req.responseText,JsonUtils.revive);
            callBack(object);
        }   
    };  
    AJAX_req.send("criteria="+criteria); 
};

Proxy.getVueloCodigo = function (criteria,callBack){
    
    var AJAX_req = new XMLHttpRequest();
    url = "/ProyectoAerolinea/Servlet?action=getVueloCodigo";
     AJAX_req.open("POST",url,true);
    AJAX_req.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    AJAX_req.onreadystatechange = function(){     
        if(AJAX_req.readyState === 4 && AJAX_req.status === 200){
            var object = JSON.parse(AJAX_req.responseText,JsonUtils.revive);
            callBack(object);
        }   
    };  
    AJAX_req.send("criteria="+criteria); 
};




Proxy.getPromo = function(callBack){
    
    var AJAX_req = new XMLHttpRequest();
    url = "/ProyectoAerolinea/Servlet?action=vueloListPromo";
    AJAX_req.open("GET",url,true);
    AJAX_req.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    AJAX_req.onreadystatechange = function(){     
        if(AJAX_req.readyState === 4 && AJAX_req.status === 200){
            var object = JSON.parse(AJAX_req.responseText,JsonUtils.revive);
            callBack(object);
        }   
    }; 
    AJAX_req.send();  
};

Proxy.getVuelos = function(callBack){
  
  var AJAX_req = new XMLHttpRequest();
    url = "/ProyectoAerolinea/Servlet?action=vueloListVuelos";
    AJAX_req.open("GET",url,true);
    AJAX_req.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    AJAX_req.onreadystatechange = function(){     
        if(AJAX_req.readyState === 4 && AJAX_req.status === 200){
            var object = JSON.parse(AJAX_req.responseText,JsonUtils.revive);
            callBack(object);
        }   
    }; 
    AJAX_req.send();  
    
};

Proxy.getAvion = function (criteria,callBack){
    
    var AJAX_req = new XMLHttpRequest();
    url = "/ProyectoAerolinea/Servlet?action=getAvion";
     AJAX_req.open("POST",url,true);
    AJAX_req.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    AJAX_req.onreadystatechange = function(){     
        if(AJAX_req.readyState === 4 && AJAX_req.status === 200){
            var object = JSON.parse(AJAX_req.responseText,JsonUtils.revive);
            callBack(object);
        }   
    };  
    AJAX_req.send("criteria="+criteria); 
};

/*Proxy.vuelosSearch = function (origen,destino,callBack){
  
    var AJAX_req = new XMLHttpRequest();
    url = "/ProyectoAerolinea/Servlet?action=vueloListSearch";
    AJAX_req.open("POST",url,true);
    AJAX_req.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    AJAX_req.onreadystatechange = function(){
        if(AJAX_req.readyState === 4 && AJAX_req.status === 200){
            var object = JSON.parse(AJAX_req.responseText,JsonUtils.revive);
            callBack(object);
        }   
    };    
    AJAX_req.send("origen="+origen+"&destino="+destino);
};*/

Proxy.viajeSoloIDA = function (origen,destino,fecha,callBack){
    JsonOrigen = JSON.stringify(origen,JsonUtils.replacer);
    JsonDestino = JSON.stringify(destino,JsonUtils.replacer);
    var AJAX_req = new XMLHttpRequest();
    url = "/ProyectoAerolinea/Servlet?action=viajeSoloIDA";
    AJAX_req.open("POST",url,true);
    AJAX_req.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    AJAX_req.onreadystatechange = function(){
        if(AJAX_req.readyState === 4 && AJAX_req.status === 200){
            var object = JSON.parse(AJAX_req.responseText,JsonUtils.revive);
            callBack(object);
        }   
    };    
    AJAX_req.send("origen="+JsonOrigen+"&destino="+JsonDestino+"&fecha="+fecha);
};

Proxy.viajeRegreso = function (destino,origen,fecha,vector,callBack){
    JsonOrigen = JSON.stringify(destino,JsonUtils.replacer);
    JsonDestino = JSON.stringify(origen,JsonUtils.replacer);
    var AJAX_req = new XMLHttpRequest();
    url = "/ProyectoAerolinea/Servlet?action=viajeRegreso";
    AJAX_req.open("POST",url,true);
    AJAX_req.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    AJAX_req.onreadystatechange = function(){
        if(AJAX_req.readyState === 4 && AJAX_req.status === 200){
            
            if(AJAX_req.responseText == "[]"){
               var object = JSON.parse(AJAX_req.responseText,JsonUtils.revive);
               callBack(object);
            }else{
            
            var object = JSON.parse(AJAX_req.responseText,JsonUtils.revive);
            
            for(i = 0; i<object.length; i++){
                vector.push(object[i]);
            }
            
            callBack(vector);
        }
        }   
    };    
    AJAX_req.send("origen="+JsonOrigen+"&destino="+JsonDestino+"&fecha="+fecha);
};

Proxy.userLogin = function (user,callBack){
jsonText = JSON.stringify(user,JsonUtils.replacer);
    var AJAX_req = new XMLHttpRequest();
    url="/ProyectoAerolinea/Servlet?action=userLogin";
    AJAX_req.open("POST",url,true);
    AJAX_req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    AJAX_req.onreadystatechange = function(){
        if( AJAX_req.readyState === 4 && AJAX_req.status === 200 ){
            jsonText=AJAX_req.responseText;
            var object = JSON.parse( jsonText,JsonUtils.revive );
            callBack(object);
        }
    };
    AJAX_req.send("user="+jsonText);   
};

Proxy.userLogout = function(callBack){
    var AJAX_req = new XMLHttpRequest();
    url="/ProyectoAerolinea/Servlet?action=userLogout";
    AJAX_req.open( "POST", url, true );
    AJAX_req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    AJAX_req.onreadystatechange = function(){
        if( AJAX_req.readyState === 4 && AJAX_req.status === 200 ){
            callBack();
        }
    };
    AJAX_req.send();   
};

Proxy.SignIn = function(user,callBack){
    jsonText = JSON.stringify(user,JsonUtils.replacer);
    var AJAX_req = new XMLHttpRequest();
    url="/ProyectoAerolinea/Servlet?action=SignIn";
    AJAX_req.open("POST",url,true);
    AJAX_req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    AJAX_req.onreadystatechange = function(){
        if( AJAX_req.readyState === 4 && AJAX_req.status === 200 ){
            jsonText=AJAX_req.responseText;
            var object = JSON.parse( jsonText,JsonUtils.revive );
            callBack(object);
        }
    };
    AJAX_req.send("user="+jsonText);  
};

Proxy.newCiudad = function(ciudad,callBack){
    jsonText = JSON.stringify(ciudad,JsonUtils.replacer);
    var AJAX_req = new XMLHttpRequest();
    url="/ProyectoAerolinea/Servlet?action=newCiudad";
    AJAX_req.open("POST",url,true);
    AJAX_req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    AJAX_req.onreadystatechange = function(){
        if( AJAX_req.readyState === 4 && AJAX_req.status === 200 ){
            jsonText=AJAX_req.responseText;
            callBack(jsonText);
        }
    };
    AJAX_req.send("ciudad="+jsonText);  
};

Proxy.eliminarCiudad = function(codigo,callBack){
    var AJAX_req = new XMLHttpRequest();
    url="/ProyectoAerolinea/Servlet?action=eliminarCiudad";
    AJAX_req.open("POST",url,true);
    AJAX_req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    AJAX_req.onreadystatechange = function(){
        if( AJAX_req.readyState === 4 && AJAX_req.status === 200 ){
            if(parseInt(AJAX_req.responseText)==0){
                callBack(0);
            }else{
                callBack(1);
            }
            
        }
    };
    AJAX_req.send("codigo="+codigo);  
};

Proxy.eliminarVuelo = function(codigo,callBack){
    var AJAX_req = new XMLHttpRequest();
    url="/ProyectoAerolinea/Servlet?action=eliminarVuelo";
    AJAX_req.open("POST",url,true);
    AJAX_req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    AJAX_req.onreadystatechange = function(){
        if( AJAX_req.readyState === 4 && AJAX_req.status === 200 ){
            if(parseInt(AJAX_req.responseText)==0){
                callBack(0);
            }else{
                callBack(1);
            }
            
        }
    };
    AJAX_req.send("codigo="+codigo); 
};

Proxy.eliminarViaje = function(codigo,callBack){
    var AJAX_req = new XMLHttpRequest();
    url="/ProyectoAerolinea/Servlet?action=eliminarViaje";
    AJAX_req.open("POST",url,true);
    AJAX_req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    AJAX_req.onreadystatechange = function(){
        if( AJAX_req.readyState === 4 && AJAX_req.status === 200 ){
            if(parseInt(AJAX_req.responseText)==0){
                callBack(0);
            }else{
                callBack(1);
            }
            
        }
    };
    AJAX_req.send("codigo="+codigo); 
};

Proxy.newVuelo = function(vuelo,imagen,callBack){
    jsonText = JSON.stringify(vuelo,JsonUtils.replacer);
    var AJAX_req = new XMLHttpRequest();
    url="/ProyectoAerolinea/Servlet?action=newVuelo";
    AJAX_req.open("POST",url,true);
    AJAX_req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    AJAX_req.onreadystatechange = function(){
        if( AJAX_req.readyState === 4 && AJAX_req.status === 200 ){
            if(parseInt(AJAX_req.responseText)==0){
                Proxy.addImagen(vuelo.codigo,imagen,callBack);
            }else{
                callBack(1);
            }
        }
    };
    AJAX_req.send("vuelo="+jsonText);  
};

Proxy.addImagen= function(codigo,imagen,callBack){
    var AJAX_req = new XMLHttpRequest(); 
    url="/ProyectoAerolinea/VueloUpload";
    AJAX_req.open( "POST", url, true );
    AJAX_req.onreadystatechange = function(){
        if( AJAX_req.readyState === 4 && AJAX_req.status === 200 ){
            callBack(0);
        }
    };
    var formdata = new FormData();
    formdata.append("codigo", codigo);
    formdata.append("imagen", imagen); 
    AJAX_req.send(formdata);    
};

Proxy.newViaje = function(viaje,callBack){
    jsonText = JSON.stringify(viaje,JsonUtils.replacer);
    var AJAX_req = new XMLHttpRequest();
    url="/ProyectoAerolinea/Servlet?action=newViaje";
    AJAX_req.open("POST",url,true);
    AJAX_req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    AJAX_req.onreadystatechange = function(){
        if( AJAX_req.readyState === 4 && AJAX_req.status === 200 ){
            jsonText=AJAX_req.responseText;
            callBack(jsonText);
        }
    };
    AJAX_req.send("viaje="+jsonText);  
};

Proxy.newAvion = function(avion,callBack){
    jsonText = JSON.stringify(avion,JsonUtils.replacer);
    var AJAX_req = new XMLHttpRequest();
    url="/ProyectoAerolinea/Servlet?action=newAvion";
    AJAX_req.open("POST",url,true);
    AJAX_req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    AJAX_req.onreadystatechange = function(){
        if( AJAX_req.readyState === 4 && AJAX_req.status === 200 ){
            jsonText=AJAX_req.responseText;
            callBack(jsonText);
        }
    };
    AJAX_req.send("avion="+jsonText);  
};


Proxy.actualizarVuelo = function(vuelo,callBack){
    jsonText = JSON.stringify(vuelo,JsonUtils.replacer);
    var AJAX_req = new XMLHttpRequest();
    url="/ProyectoAerolinea/Servlet?action=actualizarVuelo";
    AJAX_req.open("POST",url,true);
    AJAX_req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    AJAX_req.onreadystatechange = function(){
        if( AJAX_req.readyState === 4 && AJAX_req.status === 200 ){
            jsonText=AJAX_req.responseText;
            callBack(jsonText);
        }
    };
    AJAX_req.send("vuelo="+jsonText);  
};

Proxy.actualizarAvion = function(avion,callBack){
    jsonText = JSON.stringify(avion,JsonUtils.replacer);
    var AJAX_req = new XMLHttpRequest();
    url="/ProyectoAerolinea/Servlet?action=actualizarAvion";
    AJAX_req.open("POST",url,true);
    AJAX_req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    AJAX_req.onreadystatechange = function(){
        if( AJAX_req.readyState === 4 && AJAX_req.status === 200 ){
            jsonText=AJAX_req.responseText;
            callBack(jsonText);
        }
    };
    AJAX_req.send("avion="+jsonText);  
};

Proxy.dolar = function(callBack){
   var AJAX_req = new XMLHttpRequest();
    url="/ProyectoAerolinea/ConsultaTipoCambio";
    AJAX_req.open( "POST", url, true );
    AJAX_req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    AJAX_req.onreadystatechange = function(){
        if( AJAX_req.readyState === 4 && AJAX_req.status === 200 ){
            jsonText = AJAX_req.responseText;
            callBack(jsonText);
        }
    };
    AJAX_req.send();   
}

Proxy.clientGet = function(callBack){
    var AJAX_req = new XMLHttpRequest();
    url="/ProyectoAerolinea/Servlet?action=clientGet";
    AJAX_req.open( "POST", url, true );
    AJAX_req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    AJAX_req.onreadystatechange = function(){
        if( AJAX_req.readyState === 4 && AJAX_req.status === 200 ){
            jsonText=AJAX_req.responseText;
            var object = JSON.parse( jsonText,JsonUtils.revive );
            callBack(object);
        }
    };
    AJAX_req.send();   
};

Proxy.comprar = function(viajes,cliente,callBack){
    jsonViaje = JSON.stringify(viajes,JsonUtils.replacer);
    jsonCliente = JSON.stringify(cliente,JsonUtils.replacer);
    
    var AJAX_req = new XMLHttpRequest();
    url="/ProyectoAerolinea/Servlet?action=comprar";
    AJAX_req.open("POST",url,true);
    AJAX_req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    AJAX_req.onreadystatechange = function(){
        if( AJAX_req.readyState === 4 && AJAX_req.status === 200 ){
            
            var reservacion = JSON.parse(AJAX_req.responseText,JsonUtils.revive); 
            callBack(reservacion);
        }
    };
    AJAX_req.send("viaje="+jsonViaje+"&cliente="+jsonCliente);  
};

Proxy.tiquetes = function(reservaciones,pasajeros,callBack){
    jsonReservacion = JSON.stringify(reservaciones,JsonUtils.replacer);
    jsonPasajero = JSON.stringify(pasajeros,JsonUtils.replacer);
    var AJAX_req = new XMLHttpRequest();
    url = "/ProyectoAerolinea/Servlet?action=crearTiquetes";
    AJAX_req.open("POST",url,true);
    AJAX_req.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    
    AJAX_req.onreadystatechange = function(){
        if( AJAX_req.readyState === 4 && AJAX_req.status === 200 ){
           Proxy.pdf();
           callBack();
        }
    };
    AJAX_req.send("reservaciones="+jsonReservacion+"&pasajeros="+jsonPasajero);
};

Proxy.pdf = function (){
    var AJAX_req = new XMLHttpRequest();
    url = "/ProyectoAerolinea/PdfServlet";
     AJAX_req.open("GET",url,true);
    AJAX_req.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    AJAX_req.send();
};

Proxy.viajeAmbos = function (origen,destino,fechaIda,fechaRegreso,callBack){
    JsonOrigen = JSON.stringify(origen,JsonUtils.replacer);
    JsonDestino = JSON.stringify(destino,JsonUtils.replacer);
    var AJAX_req = new XMLHttpRequest();
    url = "/ProyectoAerolinea/Servlet?action=viajeSoloIDA";
    AJAX_req.open("POST",url,true);
    AJAX_req.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    AJAX_req.onreadystatechange = function(){
        if(AJAX_req.readyState === 4 && AJAX_req.status === 200){
            
            if(AJAX_req.responseText == "[]"){
            var object = JSON.parse(AJAX_req.responseText,JsonUtils.revive);
            callBack(object);
            }else{
                var object1 = JSON.parse(AJAX_req.responseText,JsonUtils.revive);
                Proxy.viajeRegreso(destino,origen,fechaRegreso,object1,callBack);
                
                //Proxy de nuevo para 
            }
            
            
        }   
    };    
    AJAX_req.send("origen="+JsonOrigen+"&destino="+JsonDestino+"&fecha="+fechaIda);
};