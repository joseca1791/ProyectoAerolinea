var JsonUtils = JsonUtils || {};
//Añadir uno nuevo al Imports!!!
JsonUtils.revive = function (k,v){
    
    if(v instanceof Object && v._class == 'Ciudad'){
        return Ciudad.from(v);
    }
    if(v instanceof Object && v._class == 'Vuelo'){
        return Vuelo.from(v);
    }  
    
    if(v instanceof Object && v._class == 'Promo'){
        return Promo.from(v);
    }
    
    if(v instanceof Object && v._class == 'Cliente'){
       return Cliente.from(v);
    }    
    
    if(v instanceof Object && v._class == 'Avion'){
       return Avion.from(v);
    }  
    
    if(v instanceof Object && v._class == 'Viaje'){
       return Viaje.from(v);
    }  
    
    if(v instanceof Object && v._class == 'Pasajero'){
        return Pasajero.from(v);
    }
    
    if(v instanceof Object && v._class == 'Reservacion'){
        return Reservacion.from(v);
    }
    
    if(v instanceof Object && v._class == 'Tiquete'){
        return Tiquete.from(v);
    }
    
    return v;
    
};

JsonUtils.replacer = function (k,v){
    
    
    if(v instanceof Ciudad){
        return Ciudad.to(v);       
    }
    if(v instanceof Vuelo){
        return Vuelo.to(v);
    }
    
     if(v instanceof Promo){
        return Promo.to(v);
    }
    
    if(v instanceof Cliente){
        return Cliente.to(v);
    }
    
     if(v instanceof Avion){
        return Avion.to(v);
    }
    
    if(v instanceof Viaje){
        return Viaje.to(v);
    }
    
    if(v instanceof Pasajero){
        return Pasajero.to(v);
    }
    
    if(v instanceof Reservacion){
        return Reservacion.to(v);
    }
    
    if(v instanceof Tiquete){
        return Tiquete.to(v);
    }
    
    
    return v;
};