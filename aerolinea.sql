
/**
 * Author:  Jose Carlos
 * Created: 08/16/2018
 */

create user jose identified by josetati1;
grant connect to jose;
grant all privileges to jose;
grant create table to jose;
connect jose/jose;


/**------------------------------------------------------------------------------------------------------------------------------------------------------**/

CREATE TABLE ciudades(							
codigo_ciudad varchar(10) not null primary key,
nombre varchar(15));

---AGREGAR CIUDAD---
create or replace procedure newCiudad (cd varchar2,n varchar2)
as
begin
	insert into ciudades values (cd,n);
end;
/

---ELIMINAR CIUDAD---
create or replace procedure eliminarCiudad (n varchar2)
as
begin
	delete from ciudades where codigo_ciudad like '%'||n||'%';
end;
/

---BUSCAR TODAS LAS CIUDADES---
create or replace function getCiudadesTodas()
return sys_refcursor
is
    c1 sys_refcursor;
begin
    open c1 for select * from ciudades;
    return c1;
end;
/

---BUSCAR TODAS LAS CIUDADES POR NOMBRE---
create or replace function getCiudadesNombre(n varchar2)
return sys_refcursor
is
    c1 sys_refcursor;
begin
    open c1 for select * from ciudades where nombre like '%'||n||'%';
    return c1;
end;
/

---BUSCAR TODAS LAS CIUDADES POR CODIGO---
create or replace function getCiudadesCodigo(n varchar2)
return sys_refcursor
is
    c1 sys_refcursor;
begin
    open c1 for select * from ciudades where codigo_ciudad like '%'||n||'%';
    return c1;
end;
/



/**------------------------------------------------------------------------------------------------------------------------------------------------------**/

CREATE TABLE vuelos(
numero_vuelo varchar(10) not null primary key,
origen varchar(10) not null,
destino varchar(10) not null,
costo float not null,
tiempo varchar(14),
promo int;

alter table vuelos add constraint foreign key (origen) references  ciudades(codigo_ciudad);
alter table vuelos add constraint foreign key (destino) references  ciudades(codigo_ciudad);

---AGREGAR VUELOS---
create or replace procedure newVuelo (nv varchar2,o varchar2,d varchar2,c float,t varchar2,p int)
as
begin
	insert into vuelos values (nv,o,d,c,t,p);
end;
/

---ELIMINAR VUELOS---
create or replace procedure eliminarVuelo (n varchar2)
as
begin
	delete from vuelos where numero_vuelo like '%'||n||'%';
end;
/

---ACTUALIZAR VUELOS---
create or replace procedure actualizarVuelo (nv varchar2,o varchar2,d varchar2,c float,t varchar2,p int)
as
begin
	update vuelos set origen=o,destino=d,costo=c,tiempo=t,promo=p where numero_vuelo like '%'||nv||'%';
end;
/

---BUSCAR TODOS LOS VUELOS---
create or replace function getVuelosTodos()
return sys_refcursor
is
    c1 sys_refcursor;
begin
    open c1 for select * from vuelos;
    return c1;
end;
/

---OBTENER PROMOCIONES---
create or replace function getPromo()
return sys_refcursor
is 
	c1 sys_refcursor;
begin
	open c1 for select * from vuelos where promo=1;
	return c1;
end;
/

---VUELOS A MOSTRAR---
create or replace function vuelosAMostrar()
return sys_refcursor
is 
	c1 sys_refcursor;
begin
	open c1 for select * from vuelos where promo=0;
	return c1;
end;
/

---BUSQUEDA DE CIUDAD---
create or replace function CiudadBusqueda(o varchar2, d varchar2)
return sys_refcursor
is
    c1 sys_refcursor;
	c2 sys_refcursor;
begin
    open c1 for select * from ciudades where nombre=o;
	open c2 for select * from ciudades where nombre=d;
    return c1;
	return c2;
end;
/

--BUSQUEDA DE VUELOS--
create or replace function vueloBusqueda(o varchar2, d varchar2)
return sys_refcursor
is
    c1 sys_refcursor;
	c2 sys_refcursor;
begin
    open c1 for select * from ciudades where nombre=o;
	open c2 for select * from ciudades where nombre=d;
    return c1;
	return c2;
end;
/
/**------------------------------------------------------------------------------------------------------------------------------------------------------**/

CREATE TABLE aviones(
codigo_avion varchar(10) not null primary key,
modelo varchar (10),
capacidad int);

---AGREGAR AVIONES---
create or replace procedure newAvion (ca varchar2,m varchar2,c int)
as
begin
	insert into aviones values (ca,m,c);
end;
/

---ACTUALIZAR AVION---
create or replace procedure actualizarAvion (ca varchar2,m varchar2,c int)
as
begin
	update aviones set modelo=m,capacidad=c where codigo_avion like '%'||ca||'%';
end;
/

--BUSCAR TODOS LOS AVIONES
create or replace function getAvionesTodos()
return sys_refcursor
is
    c1 sys_refcursor;
begin
    open c1 for select * from aviones;
    return c1;
end;
/


/**------------------------------------------------------------------------------------------------------------------------------------------------------**/

CREATE TABLE viajes(
codigo_viaje varchar(10) not null primary key,
vuelo varchar(10) not null,
avion varchar(10) not null,
fecha varchar(11) not null,
vendidas int);

alter table viajes add constraint foreign key (vuelo) references vuelos(numero_vuelo);
alter table viajes add constraint foreign key (avion) references aviones(codigo_avion);

---AGREGAR VIAJES---
create or replace procedure newViaje (cv varchar2,v varchar2,a varchar2,f varchar2,ve int)
as
begin
	insert into viajes values (cv,v,a,f,ve);
end;
/

---ELIMINAR VIAJES---
create or replace procedure eliminarViaje (n varchar2)
as
begin
	delete from viajes where codigo_viaje like '%'||n||'%';
end;
/


/**------------------------------------------------------------------------------------------------------------------------------------------------------**/

CREATE TABLE usuarios(
nombre_usuario VARCHAR(15) NOT NULL PRIMARY KEY,
  Nombre VARCHAR(15) NOT NULL,
  apellido VARCHAR(35) NOT NULL,
  clave VARCHAR(15) NOT NULL,
  correo VARCHAR(30),
  nacimiento VARCHAR(11),
  direccion VARCHAR(20),
  telefono VARCHAR(20),
  tipo INT);

/**------------------------------------------------------------------------------------------------------------------------------------------------------**/
---LOGIN---

create or replace function userLogin(nu varchar2,c varchar2)
return sys_refcursor
is
    c1 sys_refcursor;
begin
    open c1 for select * from usuarios where nombre_usuario=nu and clave=c;
    return c1;
end;

---signIn---
create or replace procedure signIn (nu varchar2,nom varchar2,a varchar2,c varchar2,co varchar2,nac varchar2,d varchar2,t varchar2,ti int)
as
begin
	insert into usuarios values (nu,nom,a,c,co,nac,d,t,ti);
end;
/
 
/**------------------------------------------------------------------------------------------------------------------------------------------------------**/

CREATE TABLE reservaciones(
numero_reservacion int not null primary key auto_increment,
viaje varchar(10) not null,
usuario varchar(15) not null);

alter table reservaciones add constraint foreign key (viaje) references viajes(codigo_viaje);
alter table reservaciones add constraint foreign key (usuario) references usuarios(nombre_usuario);
/**------------------------------------------------------------------------------------------------------------------------------------------------------**/

CREATE TABLE tiquetes(
numero_tiquete int not null primary key auto_increment,
nombre_dueno varchar(50) not null,
apellido_dueno varchar(70) not null,
pasaporte varchar(15) not null,
asiento int  not null,
reservacion int not null);

alter table tiquetes add constraint foreign key(reservacion) references reservaciones(numero_reservacion);
/**------------------------------------------------------------------------------------------------------------------------------------------------------**/

insert into usuarios (nombre_usuario,Nombre,apellido,clave,correo,nacimiento,direccion,telefono,tipo) values (
'Joseca001','Jose','Barrantes Araya','001','joseca1791@gmail.com','17/12/1991','Grecia','83145310',1);

insert into usuarios (nombre_usuario,Nombre,apellido,clave,correo,nacimiento,direccion,telefono,tipo) values (
'admin','admin','admin','002','admin@gmail.com','01/12/1996','Alajuela','8888888',2);

insert into usuarios (nombre_usuario,Nombre,apellido,clave,correo,nacimiento,direccion,telefono,tipo) values (
'Andres123','Andres','Barrantes Murillo','123','andresbarrantes@hotmail.com','09/11/1997','Los Angeles','87195749',2);

insert into ciudades (codigo_ciudad,nombre) values ('BAR','BARCELONA');
insert into ciudades (codigo_ciudad,nombre) values ('CAN','CANCUN');
insert into ciudades (codigo_ciudad,nombre) values ('CRC','COSTA RICA');
insert into ciudades (codigo_ciudad,nombre) values ('GUA','GUATEMALA');

insert into vuelos (numero_vuelo,origen,destino,costo,tiempo,promo) values ('006','CRC','CAN',1500,'2:15',1);
insert into vuelos (numero_vuelo,origen,destino,costo,tiempo,promo) values ('001','CRC','GUA',430,'1:45',0);
insert into vuelos (numero_vuelo,origen,destino,costo,tiempo,promo) values ('002','GUA','CRC',500,'1:45',0);


insert into aviones (codigo_avion,modelo,capacidad) values ('AV1','BOING-007',120);
insert into aviones (codigo_avion,modelo,capacidad) values ('AV2','GRAND-AIR',100);

insert into viajes (codigo_viaje,vuelo,avion,fecha,vendidas) values ('001','006','AV1','30/06/2017',0);
insert into viajes (codigo_viaje,vuelo,avion,fecha,vendidas) values ('002','001','AV2','29/06/2017',0);
insert into viajes (codigo_viaje,vuelo,avion,fecha,vendidas) values ('003','002','AV2','01/07/2017',0);

