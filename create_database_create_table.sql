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
