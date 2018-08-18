function Cliente(nombre_usuario,nombre,apellidos,clave,correo,nacimiento,direccion,telefono,tipo){
    this.Cliente(nombre_usuario,nombre,apellidos,clave,correo,nacimiento,direccion,telefono,tipo);
}

Cliente.prototype={
    nombre_usuario:"",
    nombre:"",
    apellidos:"",
    clave:"",
    correo:"",
    nacimiento:"",
    direccion:"",
    telefono:"",
    tipo:0,
    
    Cliente: function(nombre_usuario,nombre,apellidos,clave,correo,nacimiento,direccion,telefono,tipo){
        this.nombre_usuario = nombre_usuario;
        this.nombre=nombre;
        this.apellidos=apellidos;
        this.clave=clave;
        this.correo=correo;
        this.nacimiento=nacimiento;
        this.direccion=direccion;
        this.telefono=telefono;
        this.tipo=tipo;
    },
    
    toString:function(){
        return this.nombre_usuario;
    }
};

Cliente.from = function(plain){
    cliente = new Cliente(plain.nombre_usuario,plain.nombre,plain.apellidos,plain.clave,plain.correo,plain.nacimiento,
        plain.direccion,plain.telefono,plain.tipo);
        return cliente;
};

Cliente.to= function(cliente){
    return{
        _class : 'Cliente',
        nombre_usuario: cliente.nombre_usuario,
        nombre:cliente.nombre,
        apellidos:cliente.apellidos,
        clave:cliente.clave,
        correo:cliente.correo,
        nacimiento:cliente.nacimiento,
        direccion:cliente.direccion,
        telefono:cliente.telefono,
        tipo:cliente.tipo
        

    };
};