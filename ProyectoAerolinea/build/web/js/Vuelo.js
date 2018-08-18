function Vuelo (codigo,origen,destino,precio,tiempo,promo){ 
  this.Vuelo(codigo,origen,destino,precio,tiempo,promo);
}

Vuelo.prototype={

    codigo:"",
    origen:"",
    destino:"",
    precio:0,
    tiempo:"",
    promo:0,
    
    Vuelo:function(codigo,origen,destino,precio,tiempo,promo){
        this.codigo=codigo;
        this.origen=origen;
        this.destino=destino;
        this.precio=precio;
        this.tiempo=tiempo;
        this.promo=promo;
    },
    
    toString:function(){
        return this.codigo;
    } 
};

Vuelo.from = function (plain){
    vuelo = new Vuelo(plain.codigo,plain.origen,plain.destino,plain.precio,plain.tiempo,plain.promo);
    return vuelo;
};

Vuelo.to = function(vuelo){
    return{
        _class: 'Vuelo',
        codigo: vuelo.codigo,
        origen: vuelo.origen,
        destino: vuelo.destino,
        precio: vuelo.precio,
        tiempo:vuelo.tiempo,
        promo:vuelo.promo
    };
};