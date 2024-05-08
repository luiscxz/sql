-- creando tabla modulo victimizacion
CREATE TABLE modulo_victimizacion(
	entidad varchar(2),
	viv varchar(5),
	hogar varchar(5),     
	upm varchar(5),     
	renglon varchar(20), 	
	tipo_delito int,     
	num_delito int,     
	nombre varchar(50), 	
	apellido varchar(50), 	
	perdida int);
	--insertando registros a la tabla
	INSERT INTO modulo_victimizacion VALUES ('01','15','03','15','10',3, 1, 'Luis', 'Miranda',2000),        
								 		('01','15','03','15','10',3, 2, 'Luis', 'Miranda',3000),        
										('02','20','13','10','03',4, 1, 'Oscar', 'Ruiz',1000),        
										('09','16','11','05','01',5, 1, 'Raul', 'Ortiz',4500),        
										('32','12','11','02','04',2, 1, 'Luisa', 'Ortiz',300),        
										('32','12','11','02','04',3, 1, 'Luisa', 'Ortiz',500);
-- procedemos a visualizar las columnas de interes "tipodelito y pérdida"
select tipo_delito,perdida from modulo_victimizacion;
-- Seleccionando toda la tabla y ordenando por la columna apellido de forma ascendente
select *from modulo_victimizacion order by apellido asc;  
-- ordenando por apellido asc y perdida descendente, y que solo me muesta las columnas nombre, apellido, pérdida
select nombre,apellido,perdida from modulo_victimizacion order by apellido asc,perdida desc;
---------------------------------------------------------------------------------------------
---Filtrado de información
-- seleccionando toda la tabla dónde la pérdida es >1000 y ordenar por tipo de delitos en forma descendente
select *from modulo_victimizacion where perdida>1000 order by tipo_delito desc;
-- Seleccionando toda la tabla dónde la pérdida es >=2000 y la entidad ='01'
select *from modulo_victimizacion where perdida>=2000 and entidad ='01';
-- Seleccionando toda la tabla dónde el tipo de delito es 3 y 4, y ordene por columna apellido de forma ascendete
select *from modulo_victimizacion where tipo_delito in (3,4) order by apellido asc;
-- seleccionando toda la tabla dónde el tipo de delito es 3 y 4, y el nombre de la persona sea Luis
select *from modulo_victimizacion where tipo_delito in (3,4) and nombre='Luis';
-- seleccionando toda la tabla donde no se cumple que la perdida =4500
select *from modulo_victimizacion where not perdida=4500;
------------------------------------------------------------------------------------------
-- delimitando la visualización de una tabla
-- mostrando todos los registros de la tabla apartir del registro 2, se tiene en cuenta que el índice comienza en cero
select *from modulo_victimizacion offset 2;
-- mostrando solo los dos primeros registros
select *from modulo_victimizacion limit 2;
-- mostrando toda la tabla donde la pérdida esta entre 1000 y 3000
select *from modulo_victimizacion where perdida between 1000 and 3000;
---------------------------------------------------------------------------------------
--# Filtros con expresiones#
-- seleccionando toda la tabla donde el nombre comience con la palabra 'Luis' y termine en cualquier cosa
select *from modulo_victimizacion where nombre like 'Luis%';
-- seleccionando topda la tabla donde el apellido termine con la palabra 'iz' y comience con cualquie cosa
select *from modulo_victimizacion where apellido like '%iz';
-- seleccionando toda la tabla donde los apellidos contengas ui
select *from modulo_victimizacion where apellido like '%ui%';
-- seleccionando toda la tabla donde los nombres contenga una "u" previa a "s" y que pueden no comenzar en u y s
select *from modulo_victimizacion where nombre like '%u%s%';
-- seleccionando toda la tabla donde los nombres inician con 'Lu' y contiene 2 caracteres después
select *from modulo_victimizacion where nombre like 'Lu__';
---------------------------------------------------------------------------------------
-- calculando el promedio de la columna perdida
select avg(perdida) promedio_total
from modulo_victimizacion;
-- calculando la suma total de la columna perdida
select sum(perdida)as suma_total
from modulo_victimizacion;
-- redondeando operacion
select round(avg(perdida),2) promedio_total
from modulo_victimizacion;
-- funsion random y fijare semilla
select setseed(0.5);
select random();
-- elevando los registros de la columna tipo_delito a los registros de la columna num_delito
select tipo_delito,num_delito, pow(tipo_delito,num_delito) from modulo_victimizacion;
-- calculando el residuo o modulo
select mod(5,5);
-------------------
------------------Funciones de texto
--convirtiendo columna nombres a mayuscula
select upper(nombre) from modulo_victimizacion;
--convirtiendo columna nombres a minuscula
select lower (nombre) from modulo_victimizacion;
-- uniendo nombre y apellido en una sola columna
select nombre,apellido, concat(nombre,' ',apellido) as nombre_completo
	from modulo_victimizacion;
---------- length

select concat('La persona ', nombre,' ',upper(apellido),' ha tenido una pérdida de $', perdida) as frase,
	length(concat('La persona ', nombre,' ',apellido,' ha tenido una pérdida de $', perdida)) as longitud_frase
	from modulo_victimizacion;
---- Funciones para eliminar espacios en una cadena de texto
select '    hola  ',length('    hola  '),trim('    hola  '),length(trim('    hola  '));
