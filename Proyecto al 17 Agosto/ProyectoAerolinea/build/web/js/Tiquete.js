function Tiquete(numero_tiquete,nombre_dueno,apellido_dueno,pasaporte,asiento,reservacion){
    this.Tiquete(numero_tiquete,nombre_dueno,apellido_dueno,pasaporte,asiento,reservacion);
   }
   
   Tiquete.prototype={
       numero_tiquete:0,
       nombre_dueno:"",
       apellido_dueno:"",
       pasaporte:"",
       asiento:0,
       reservacion:"",
       
       Tiquete:function(numero_tiquete,nombre_dueno,apellido_dueno,pasaporte,asiento,reservacion){
           this.numero_tiquete = numero_tiquete;
           this.nombre_dueno = nombre_dueno;
           this.apellido_dueno = apellido_dueno;
           this.pasaporte = pasaporte;
           this.asiento = asiento;
           this.reservacion= reservacion;
       },
       
       toString: function(){
           return this.numero_tiquete;
       }
       
   };

Tiquete.from = function(plain){
    tiquete = new Tiquete(plain.numero_tiquete,plain.nombre_dueno,plain.apellido_dueno,plain.pasaporte,plain.asiento,plain.reservacion);
    return tiquete;
};

Tiquete.to = function(tiquete){
    return{
      _class:'Tiquete',
      numero_tiquete:tiquete.numero_tiquete,
      nombre_dueno: tiquete.nombre_dueno,
      apellido_dueno: tiquete.apellido_dueno,
      pasaporte: tiquete.pasaporte,
      asiento:tiquete.asiento,
      reservacion:tiquete.reservacion
    };
};
