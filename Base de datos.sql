
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

create table Tiquetes(
	numero_tiquete varchar(50),
	nombre_dueno varchar(50),
	apellido_dueno varchar(50),
	pasaporte varchar(50),
	asiento varchar(50),
	reservacion varchar(50)
);

alter table Tiquetes add constraint pkTiquetes primary key (numero_tiquete);

---AGREGAR TIQUETE---
create or replace procedure agregarTiquete (nt varchar2, nd varchar2, ad varchar2, p varchar2, a varchar2, r varchar2)
as
begin
    insert into Tiquetes values (nt, nd, ad, p, a, r);
end;
/

---BUSCAR POR NUMERO DE TIQUETE---
create or replace function buscarPorNumeroDeTiquete (n varchar2)
return sys_refcursor
is
    c1 sys_refcursor;
begin
    open c1 for select numero_tiquete,nombre_dueno,apellido_dueno,pasaporte,asiento,reservacion from Tiquetes where numero_tiquete like '%'||n||'%';
    return c1;
end;
/

/**------------------------------------------------------------------------------------------------------------------------------------------------------**/

create table Reservaciones(
	numero_reservacion varchar(50),
	viaje varchar(50),
	cliente varchar(50)
);

alter table Reservaciones add constraint pkReservaciones primary key (numero_reservacion);

---AGREGAR RESERVACION---
create or replace procedure agregarReservaciones (nr varchar2,v varchar2,c varchar2)
as
begin
	insert into Reservaciones values (nr,v,c);
end;
/

---BUSCAR POR RESERVACION---
create or replace function buscarPorReservacion (n varchar2)
return sys_refcursor
is
    c1 sys_refcursor;
begin
    open c1 for select numero_reservacion,viaje from Reservaciones where numero_reservacion like '%'||n||'%';
    return c1;
end;
/

/**------------------------------------------------------------------------------------------------------------------------------------------------------**/

create table Clientes(
	nombre_usuario varchar(50),
	nombre varchar(50),
	apellidos varchar(50),
	contrasena varchar(50),
	correo varchar(50),
	edad int,
	direccion varchar(50),
	telefono varchar(50),
	tipo varchar(50)
);

alter table Clientes add constraint pkClientes primary key (nombre_usuario);

---AGREGAR CLIENTE---
create or replace procedure agregarCliente (nu varchar2, n varchar2, a varchar2, pass varchar2, mail varchar2, e int, d varchar2, t varchar2, ptipo varchar2)
as
begin
	insert into Clientes values (nu,n,a,pass,mail,e,d,t,ptipo);
end;
/

---BUSCAR POR CLIENTE---
create or replace function buscarPorCliente (n varchar2)
return sys_refcursor
is
    c1 sys_refcursor;
begin
    open c1 for select nombre_usuario,nombre,apellidos,correo,edad from Clientes where nombre_usuario like '%'||n||'%';
    return c1;
end;
/

/**------------------------------------------------------------------------------------------------------------------------------------------------------**/

create table Viajes(
	codigo_viaje varchar(50),
	vuelo varchar(50),
	avion varchar(50),
	fecha varchar(50),
	vendidas varchar(50)
);

alter table Viajes add constraint pkViajes primary key (codigo_viaje);

/**------------------------------------------------------------------------------------------------------------------------------------------------------**/

create table Aviones(
	codigo_avion varchar(50),
	ano int,
	modelo varchar(50),
	marca varchar(50),
	cantidadPasajeros int,
	cantidadFilas int,
	cantidadAsientosFila int,
	ruta varchar(50)
);

alter table Aviones add constraint pkAviones primary key (codigo_avion);

---AGREGAR AVION---
create or replace procedure agregarAvion (ca varchar2,a int,m varchar2,ma varchar2,cp int,cf int,caf int,r varchar2)
as
begin
	insert into Aviones values (ca,a,m,ma,cp,cf,caf,r);
end;
/

---BUSCAR POR AVION---
create or replace function buscarPorAvion (n varchar2)
return sys_refcursor
is
    c1 sys_refcursor;
begin
    open c1 for select ano,modelo,marca,cantidadPasajeros,cantidadFilas,cantidadAsientosFila,ruta from Aviones where codigo_avion like '%'||n||'%';
    return c1;
end;
/
/**------------------------------------------------------------------------------------------------------------------------------------------------------**/

create table Vuelos(
	numero_vuelo varchar(50),
	origen varchar(50),
	destino varchar(50),
	costo float,
	tiempoVuelo varchar(50)
);

alter table Vuelos add constraint pkVuelos primary key (numero_vuelo);

---AGREGAR VUELO---
create or replace procedure agregarVuelo (nv varchar2, o varchar2, d varchar2, c float, tv varchar2)
as
begin
    insert into Vuelos values (nv, o, d, c, tv);
end;
/

---BUSCAR POR VUELO---
create or replace function buscarPorVuelo (n varchar2)
return sys_refcursor
is
    c1 sys_refcursor;
begin
    open c1 for select numero_vuelo,origen,destino,costo,tiempoVuelo from Vuelos where numero_vuelo like '%'||n||'%';
    return c1;
end;
/

/**------------------------------------------------------------------------------------------------------------------------------------------------------**/

create table Ciudades(
	codigo_ciudad varchar(50),
	nombre varchar(50)
);

alter table Ciudades add constraint pkCiudades primary key (codigo_ciudad);

create table productos (
    codigo int,
    nombre varchar(50),
    importado varchar(2),
    precio float,
    tipo varchar(50)
);

/**------------------------------------------------------------------------------------------------------------------------------------------------------**/
---------------
--execute agregarProducto(1, 'Arroz', 120.0, '0', 'Popular');
--select buscarPorNombre('Arroz') from dual;
--select buscarPorTipo('Popular') from dual;
---------------

