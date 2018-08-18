function Promo (codigo,origen,destino,precio,tiempo,imagen){ 
  this.Promo(codigo,origen,destino,precio,tiempo,imagen);
}

Promo.prototype={

    codigo:"",
    origen:"",
    destino:"",
    precio:0,
    tiempo:"",
    imagen:"",
    
    Promo:function(codigo,origen,destino,precio,tiempo,imagen){
        this.codigo=codigo;
        this.origen=origen;
        this.destino=destino;
        this.precio=precio;
        this.tiempo=tiempo;
        this.imagen=imagen;
    },
    
    toString:function(){
        return this.codigo;
    } 
};

Promo.from = function (plain){
    promo = new Promo(plain.codigo,plain.origen,plain.destino,plain.precio,plain.tiempo,plain.imagen);
    return promo;
};

Promo.to = function(promo){
    return{
        _class: 'Promo',
        codigo: promo.codigo,
        origen: promo.origen,
        destino: promo.destino,
        precio: promo.precio,
        tiempo:promo.tiempo,
        imagen:promo.imagen
    };
};