-- phpMyAdmin SQL Dump
-- version 4.5.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-06-2017 a las 00:26:33
-- Versión del servidor: 5.7.11
-- Versión de PHP: 5.6.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `javaweb_crud`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulos`
--

CREATE TABLE `articulos` (
  `id` int(10) NOT NULL,
  `codigo` varchar(30) COLLATE utf8_spanish2_ci NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `descripcion` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `existencia` double NOT NULL,
  `precio` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `articulos`
--

INSERT INTO `articulos` (`id`, `codigo`, `nombre`, `descripcion`, `existencia`, `precio`) VALUES
(5, 'EC001', 'ESFERO ROJO', 'ESFERO BORRABLE', 40, 0.65),
(4, 'EC002', 'ESFERO NEGRO', 'ESFERO BORRABLE', 30, 0.65),
(6, 'FA001', 'FOLDER ARCHIVADOR AZ OFICIO', 'FOLDER CARTÓN', 10, 2.79),
(7, 'SM001', 'SOBRE MANILA ', 'SOBRE MANILA OFICIO', 15, 0.1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `articulos`
--
ALTER TABLE `articulos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `articulos`
--
ALTER TABLE `articulos`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


delimiter $
create procedure insertar 
(IN id int,IN codigo varchar(30),in nombre varchar(50),in descripcion varchar(50),in existencia double, in precio double)
begin 
insert into articulos(id,codigo,nombre,descripcion,existencia,precio)
values(id,codigo,nombre,descripcion,existencia,precio);
end $

call insertar(001,'1896','prueba','pc',1,1);

delimiter $
create procedure actualizar
(IN id int,IN codigo varchar(30),in nombre varchar(50),in descripcion varchar(50),in existencia double, in precio double)
begin
update articulos set codigo = codigo, nombre = nombre, descripcion = descripcion, existencia = existencia, precio = precio
where id = id;
end $

delimiter $
CREATE PROCEDURE actualizar(in ident integer,IN ncodigo varchar(30),in nnombre varchar(50),in ndescripcion varchar(50),in nexistencia double, in nprecio double	)
BEGIN
UPDATE articulos SET codigo = ncodigo, nombre = nnombre, descripcion = ndescripcion, existencia = nexistencia, precio = nprecio 
WHERE id=ident;
END $

call actualizar(10,'005','prueba','pc',1,1);

delimiter $
create procedure borrar (in ident integer)
begin
DELETE FROM articulos WHERE id=ident;
end $









