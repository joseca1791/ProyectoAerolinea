function Viaje(codigo,vuelo,avion,fecha,vendidas){
    this.Viaje(codigo,vuelo,avion,fecha,vendidas);
}

Viaje.prototype={
    codigo:"",
    vuelo:"",
    avion:"",
    fecha:"",
    vendidas:0,
    
    Viaje: function(codigo,vuelo,avion,fecha,vendidas){
        this.codigo=codigo;
        this.vuelo=vuelo;
        this.avion = avion;
        this.fecha = fecha;
        this.vendidas=vendidas;
    },
    
    toString: function(){
        return this.codigo;
    }
};

Viaje.from= function(plain){
    viaje= new Viaje(plain.codigo,plain.vuelo,plain.avion,plain.fecha,plain.vendidas);
    return viaje;
};

Viaje.to = function(viaje){
    return{
        
        _class:'Viaje',
        codigo:viaje.codigo,
        vuelo:viaje.vuelo,
        avion:viaje.avion,
        fecha:viaje.fecha,
        vendidas:viaje.vendidas
    };
};