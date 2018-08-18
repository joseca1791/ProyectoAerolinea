CREATE DATABASE aerolinea;
use aerolinea;

CREATE TABLE ciudades(							
codigo_ciudad varchar(10) not null primary key,
nombre varchar(15));

CREATE TABLE vuelos(
numero_vuelo varchar(10) not null primary key,
origen varchar(10) not null,
destino varchar(10) not null,
costo float not null,
tiempo varchar(14),
promo integer(1));

alter table vuelos add constraint foreign key (origen) references  ciudades(codigo_ciudad);
alter table vuelos add constraint foreign key (destino) references  ciudades(codigo_ciudad);

CREATE TABLE aviones(
codigo_avion varchar(10) not null primary key,
modelo varchar (10),
capacidad integer(11));

CREATE TABLE viajes(
codigo_viaje varchar(10) not null primary key,
vuelo varchar(10) not null,
avion varchar(10) not null,
fecha varchar(11) not null,
vendidas integer(3));

alter table viajes add constraint foreign key (vuelo) references vuelos(numero_vuelo);
alter table viajes add constraint foreign key (avion) references aviones(codigo_avion);

CREATE TABLE usuarios(
nombre_usuario VARCHAR(15) NOT NULL PRIMARY KEY,
  Nombre VARCHAR(15) NOT NULL,
  apellido VARCHAR(35) NOT NULL,
  clave VARCHAR(15) NOT NULL,
  correo VARCHAR(30),
  nacimiento VARCHAR(11),
  direccion VARCHAR(20),
  telefono VARCHAR(20),
  tipo INT(11));

CREATE TABLE reservaciones(
numero_reservacion integer(11) not null primary key auto_increment,
viaje varchar(10) not null,
usuario varchar(15) not null);

alter table reservaciones add constraint foreign key (viaje) references viajes(codigo_viaje);
alter table reservaciones add constraint foreign key (usuario) references usuarios(nombre_usuario);

CREATE TABLE tiquetes(
numero_tiquete integer(11) not null primary key auto_increment,
nombre_dueno varchar(50) not null,
apellido_dueno varchar(70) not null,
pasaporte varchar(15) not null,
asiento integer(3)  not null,
reservacion integer(11) not null);

alter table tiquetes add constraint foreign key(reservacion) references reservaciones(numero_reservacion);

insert into usuarios (nombre_usuario,Nombre,apellido,clave,correo,nacimiento,direccion,telefono,tipo) values (
"Andres","Andres","Barrantes Murillo","001","andresbarrantes@gmail.com","09/11/1997","Grecia","87195749",1);

insert into usuarios (nombre_usuario,Nombre,apellido,clave,correo,nacimiento,direccion,telefono,tipo) values (
"admin","admin","admin","002","admin@gmail.com","01/12/1996","Alajuela","8888888",2);

insert into ciudades (codigo_ciudad,nombre) values ("BAR","BARCELONA");
insert into ciudades (codigo_ciudad,nombre) values ("CAN","CANCUN");
insert into ciudades (codigo_ciudad,nombre) values ("CRC","COSTA RICA");
insert into ciudades (codigo_ciudad,nombre) values ("GUA","GUATEMALA");

insert into vuelos (numero_vuelo,origen,destino,costo,tiempo,promo) values ("006","CRC","CAN",1500,"2:15",1);
insert into vuelos (numero_vuelo,origen,destino,costo,tiempo,promo) values ("001","CRC","GUA",430,"1:45",0);
insert into vuelos (numero_vuelo,origen,destino,costo,tiempo,promo) values ("002","GUA","CRC",500,"1:45",0);


insert into aviones (codigo_avion,modelo,capacidad) values ("AV1","BOING-007",120);
insert into aviones (codigo_avion,modelo,capacidad) values ("AV2","GRAND-AIR",100);

insert into viajes (codigo_viaje,vuelo,avion,fecha,vendidas) values ("001","006","AV1","30/06/2017",0);
insert into viajes (codigo_viaje,vuelo,avion,fecha,vendidas) values ("002","001","AV2","29/06/2017",0);
insert into viajes (codigo_viaje,vuelo,avion,fecha,vendidas) values ("003","002","AV2","01/07/2017",0);

