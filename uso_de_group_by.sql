CREATE TABLE mdulo_victimizacion(
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
	
INSERT INTO mdulo_victimizacion VALUES ('01','15','03','15','10',3, 1, 'Luis', 'Miranda',2000),        
								 		('01','15','03','15','10',3, 2, 'Luis', 'Miranda',3000),        
										('02','20','13','10','03',4, 1, 'Oscar', 'Ruiz',1000),        
										('09','16','11','05','01',5, 1, 'Raul', 'Ortiz',4500),        
										('32','12','11','02','04',2, 1, 'Luisa', 'Ortiz',300),        
										('32','12','11','02','04',3, 1, 'Luisa', 'Ortiz',500),
										('05','18','08','20','15',2, 1, 'María', 'González',1500),
										('12','10','17','04','06',4, 1, 'Pedro', 'Martínez',2500),
										('07','21','05','12','09',3, 1, 'Ana', 'López',3500),
										('19','07','14','08','11',5, 1, 'Juan', 'Díaz',4000),
										('03','22','09','11','07',2, 1, 'Elena', 'Sánchez',2000),
										('14','11','12','03','02',3, 1, 'Jorge', 'Pérez',3000),
										('28','09','20','07','05',4, 1, 'Laura', 'Ramírez',5000),
										('08','16','18','09','13',2, 1, 'Diego', 'Hernández',1800),
										('21','13','16','06','01',5, 1, 'Sofía', 'Gómez',4200),
										('11','17','02','15','10',3, 1, 'Carlos', 'Fernández',2700);
										
select *from mdulo_victimizacion;
-- Procedemos a contar el número de victimas por tipo de delito y mostramos solo aquellos tipos de delito 
-- con más de una víctima
select tipo_delito, count(*)
from mdulo_victimizacion
group by tipo_delito
having count(*)>1;
-- calculando el promedio de pérdida por entidad y mostrar solo aquellas entidades con un promedio de pérdida >2000
select entidad, avg(perdida)
from mdulo_victimizacion
group by entidad
having avg(perdida)>2000;
--- listando las viviendas y lugares donde se hayan registrado exactamente dos delitos, además poner el nombre de la persona
select viv,hogar,nombre, count(*)
from mdulo_victimizacion
group by viv,hogar,nombre
having count(*) =2;
-- Mostrar el numero de delitos cometidos por cada apellido y nombre 
select nombre, apellido, count(*) as delitos
from mdulo_victimizacion
group by nombre,apellido;
-- mostrar el máximo de pérdida por cada entidad y upm
select entidad, upm, max(perdida)
from mdulo_victimizacion
group by entidad,upm
order by max(perdida) desc;