function Pasajero(pasaporte,nombre,apellido,asiento){
    this.Pasajero(pasaporte,apellido,nombre,asiento);
}

Pasajero.prototype={
    pasaporte:"",
    apellido:"",
    nombre:"",
    asiento:0,
    
    
    Pasajero: function(pasaporte,apellido,nombre,asiento){
        this.pasaporte = pasaporte;
        this.apellido = apellido;
        this.nombre = nombre;
        this.asiento = asiento;
    },
    
        toString:function(){
            return this.pasaporte;
        }
};

Pasajero.from = function(plain){
    pasajero = new Pasajero(plain.pasaporte,plain.nombre,plain.apellido,plain.asiento);
    return pasajero;
};

Pasajero.to = function(pasajero){
    return{
        _class: 'Pasajero',
        pasaporte:pasajero.pasaporte,
        nombre:pasajero.nombre,
        apellido:pasajero.apellido,
        asiento:pasajero.asiento
    };
};