
----------------------------------------------------------------------------------------------------------------
                                /*AVIONES*/
----------------------------------------------------------------------------------------------------------------
create table aviones(
    codigo_Avion varchar(15),
    modelo varchar(30),
    capacidad int
);

alter table aviones add constraint pkAviones primary key (codigo_Avion);

create or replace procedure agregarAvion(codigo_Avion varchar2,modelo varchar2,capacidad int)
as
begin
insert into aviones values(codigo_Avion,modelo,capacidad);
end;
/

create or replace function listarAviones (n varchar2)
return sys_refcursor
is
    c1 sys_refcursor;
begin
    open c1 for select codigo_Avion, modelo, capacidad from aviones;
    return c1;
end;
/

create or replace function listarAvionesPorId (n varchar2)
return sys_refcursor
is
    c1 sys_refcursor;
begin
    open c1 for select codigo_Avion, modelo, capacidad from aviones where codigo_Avion =n;
    return c1;
end;
/

create or replace procedure editarAvion(codigo_Avion1 varchar2,modelo1 varchar2,capacidad1 int,code varchar2)
as
begin
update aviones set modelo=modelo1, capacidad=capacidad1 where codigo_Avion=code;
update aviones set codigo_Avion=codigo_Avion1 where codigo_Avion=code;
end;
/

create or replace procedure eliminarAvion(codigo_Avion1 varchar2)
as
begin
delete from aviones where codigo_Avion=codigo_Avion1;
end;
/

----------------------------------------------------------------------------------------------------------------
                                /*CIUDADES*/
----------------------------------------------------------------------------------------------------------------

CREATE TABLE ciudades(							
codigo_ciudad varchar(10) not null primary key,
nombre_ciudad varchar(15))
;

create or replace procedure agregarCiudad(codigo_ciudad1 varchar2,nombre_ciudad1 varchar2)
as
begin
insert into ciudades values(codigo_ciudad1,nombre_ciudad1);
end;
/

create or replace function listarCiudades (n varchar2)
return sys_refcursor
is
    c1 sys_refcursor;
begin
    open c1 for select codigo_ciudad, nombre_ciudad from ciudades;
    return c1;
end;
/

create or replace function listarCiudadesPorId (n varchar2)
return sys_refcursor
is
    c1 sys_refcursor;
begin
    open c1 for select codigo_ciudad, nombre_ciudad from ciudades where codigo_ciudad =n;
    return c1;
end;
/

create or replace function listarCiudadesPorNombre (n varchar2)
return sys_refcursor
is
    c1 sys_refcursor;
begin
    open c1 for select codigo_ciudad, nombre_ciudad from ciudades where nombre_ciudad =n;
    return c1;
end;
/

create or replace procedure editarCiudad(codigo_ciudad1 varchar2,nombre_ciudad1 varchar2,code varchar2)
as
begin
update ciudades set nombre_ciudad=nombre_ciudad1 where codigo_ciudad=code;
update ciudades set codigo_ciudad=codigo_ciudad1 where codigo_ciudad=code;
end;
/

create or replace procedure eliminarCiudad(codigo_Ciudad1 varchar2)
as
begin
delete from ciudades where codigo_Ciudad=codigo_Ciudad1;
end;
/

----------------------------------------------------------------------------------------------------------------
                                /*Clientes*/
----------------------------------------------------------------------------------------------------------------

CREATE TABLE clientes(							
nombre_usuario varchar(20) not null primary key,
nombre varchar(20),
apellidos varchar(20),
clave varchar(20),
correo varchar(20),
nacimiento varchar(20),
direccion varchar(100),
telefono varchar(20),
tipo int);

create or replace procedure agregarCliente(nombre_usuario varchar2,nombre varchar2,apellidos varchar2,clave varchar2,correo varchar2,nacimiento varchar2,direccion varchar2,telefono varchar2,tipo int)
as
begin
insert into clientes values(nombre_usuario,nombre,apellidos,clave,correo,nacimiento,direccion,telefono,tipo);
end;
/

create or replace function buscarCliente (n varchar2,c varchar2)
return sys_refcursor
is
    c1 sys_refcursor;
begin
    open c1 for select * from clientes where nombre_usuario=n and clave=c;
    return c1;
end;
/


----------------------------------------------------------------------------------------------------------------
                                /*Pasajeros*/
----------------------------------------------------------------------------------------------------------------
CREATE TABLE pasajeros(
pasaporte varchar(50) not null primary key,
nombre varchar(20),
apellidos varchar(20),
asiento int
);

----------------------------------------------------------------------------------------------------------------
                                /*Reservaciones*/
----------------------------------------------------------------------------------------------------------------
CREATE TABLE reservaciones(
numero_reservacion int not null primary key,
viaje varchar(10) not null,
usuario varchar(15) not null);

alter table reservaciones add constraint fk_viaje foreign key (viaje) references viajes(codigo_viaje);
alter table reservaciones add constraint fk_usuario foreign key (usuario) references clientes(nombre_usuario);
----------------------------------------------------------------------------------------------------------------
                                /*Tiquetes*/
----------------------------------------------------------------------------------------------------------------
CREATE TABLE tiquetes(
numero_tiquete int not null primary key,
nombre_dueno varchar(50) not null,
apellido_dueno varchar(70) not null,
pasaporte varchar(15) not null,
asiento int  not null,
reservacion int not null);

alter table tiquetes add constraint fk_reservacion foreign key(reservacion) references reservaciones(numero_reservacion);
----------------------------------------------------------------------------------------------------------------
                                /*Viajes*/
----------------------------------------------------------------------------------------------------------------
CREATE TABLE viajes(
codigo_viaje varchar(10) not null primary key,
vuelo varchar(10) not null,
avion varchar(10) not null,
fecha varchar(11) not null,
vendidos int);

alter table viajes add constraint fk_vuelo foreign key (vuelo) references vuelos(numero_vuelo);
alter table viajes add constraint fk_avion foreign key (avion) references aviones(codigo_Avion);
----------------------------------------------------------------------------------------------------------------
                                /*Vuelos*/
----------------------------------------------------------------------------------------------------------------
CREATE TABLE vuelos(
numero_vuelo varchar(10) not null primary key,
origen varchar(10) not null,
destino varchar(10) not null,
costo float not null,
tiempo varchar(14),
promo int);

create or replace procedure agregarVuelo(codigo varchar2,origen varchar2,destino varchar2,precio int,tiempo varchar2,promo int)
as
begin
insert into vuelos values(codigo,origen,destino,precio,tiempo,promo);
end;
/

alter table vuelos add constraint fk_origen foreign key (origen) references  ciudades(codigo_ciudad);
alter table vuelos add constraint fk_destino foreign key (destino) references  ciudades(codigo_ciudad);

----------------------------------------------------------------------------------------------------------------
                                /*Informacion adicional*/
----------------------------------------------------------------------------------------------------------------
/*
execute agregarAvion('Avion1', 'Boeing777',200);
execute editarAvion('codigo24','Nuevo',1000,'212');
select * from aviones;
select listarAviones('a') from dual;*/

/*
execute agregarCiudad('1','Cairo');
*/

/*
select * from clientes
select * from vuelos
*/


create or replace function buscarVueloPorNumeroVuelo (n varchar2)
return sys_refcursor
is
    c1 sys_refcursor;
begin
    open c1 for select * from vuelos where numero_vuelo =n;
    return c1;
end;
/

create or replace function listarVuelos (n varchar2)
return sys_refcursor
is
    c1 sys_refcursor;
begin
    open c1 for select * from Vuelos;
    return c1;
end;
/