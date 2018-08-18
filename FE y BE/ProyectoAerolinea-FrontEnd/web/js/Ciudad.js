function Ciudad(codigo,nombre){
    this.Ciudad(codigo,nombre);
}

Ciudad.prototype={
    codigo:"",
    nombre:"",
    
    Ciudad: function(codigo,nombre){
        this.codigo=codigo;
        this.nombre=nombre;
    },
    
    toString: function(){
        return this.codigo;
    }
};

Ciudad.from= function(plain){
    ciudad = new Ciudad(plain.codigo,plain.nombre);
    return ciudad;
};

Ciudad.to = function(ciudad){
    return{
        
        _class:'Ciudad',
        codigo:ciudad.codigo,
        nombre:ciudad.nombre
    };
};