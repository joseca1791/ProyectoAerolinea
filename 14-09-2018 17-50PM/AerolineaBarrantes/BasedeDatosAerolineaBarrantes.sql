
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

/*
execute agregarAvion('Avion1', 'Boeing777',200);
execute editarAvion('codigo24','Nuevo',1000,'212');
select * from aviones;
select listarAviones('a') from dual;*/

/*
execute agregarCiudad('1','Cairo');
*/