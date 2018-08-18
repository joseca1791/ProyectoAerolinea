function Reservacion(numero_reservacion,viaje,cliente){
    this.Reservacion(numero_reservacion,viaje,cliente);
}

Reservacion.prototype={
  numero_reservacion:0,
  viaje:"",
  cliente:"",
  
  Reservacion: function(numero_reservacion,viaje,cliente){
      this.numero_reservacion = numero_reservacion;
      this.viaje = viaje;
      this.cliente = cliente;
  },
  toString:function(){
      return this.numero_reservacion;
  }
};

Reservacion.from = function(plain){
    reservacion = new Reservacion(plain.numero_reservacion,plain.viaje,plain.cliente);
    return reservacion;
};

Reservacion.to = function(reservacion){
  return{
      _class: 'Reservacion',
      numero_reservacion:reservacion.numero_reservacion,
      viaje:reservacion.viaje,
      cliente:reservacion.cliente
  }  ;
};