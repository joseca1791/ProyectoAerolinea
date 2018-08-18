function Avion(codigo_Avion,modelo,capacidad){
    this.Avion(codigo_Avion,modelo,capacidad);
}

Avion.prototype={
    codigo_Avion:"",
    modelo:"",
    capacidad:0,
    
    Avion: function(codigo_Avion,modelo,capacidad){
        this.codigo_Avion=codigo_Avion;
        this.modelo = modelo;
        this.capacidad= capacidad;
    },
    
    toString: function(){
        return this.codigo_Avion;
    }
};

Avion.from= function(plain){
    avion = new Avion(plain.codigo_Avion,plain.modelo,plain.capacidad);
    return avion;
};

Avion.to = function(avion){
    return{
        
        _class:'Avion',
        codigo_Avion:avion.codigo_Avion,
        modelo:avion.modelo,
        capacidad:avion.capacidad
    };
};


