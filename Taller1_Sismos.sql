---------------------------------------------------------------------------------------------------
-----------------------------------Taller----------------------------------------------------------
-- creando tabla donde se cargaran los datos del csv
CREATE TABLE sismos (
    Magnitud NUMERIC,
    Latitud DOUBLE PRECISION,
    Longitud DOUBLE PRECISION,
    Profundidad NUMERIC,
    Municipio VARCHAR(100),
    Zona VARCHAR(100),
    Mes INTEGER,
    Placa VARCHAR(20),
    Anio INTEGER
);
select *from sismos;
-- cargando el archivo csv a la tabla
copy sismos(Magnitud, Latitud, Longitud, Profundidad, Municipio, Zona, Mes, Placa, Anio)
FROM 'D:/3. Cursos/8. diplomado postgresql/AADB/sismos2.csv'
DELIMITER ';' CSV HEADER;

-- Seleccionando todos los sismos con magnitudes mayor o igual a 7
select *from sismos where magnitud>=7;
-- Contando cuentos sismos tiene magnitud mayor o igual a 7
select count(*) from sismos where magnitud>=7;
-- contar la cantidad de sismos registrados en la zona centro sur en el año 2021
select count(*) as cantidad_sismos from sismos where Zona ilike 'Centro sur' and Anio =2021;
-- obteniendo la magnitud promedio de los sismos registrados en los meses de mayo
select avg(magnitud) as mag_promedio from sismos where Mes =5;
-- Mostrar los municipios donde se registraron sismos con profundidad mayor a 200km
select distinct (Municipio) from sismos where Profundidad>200;
-- listando los sismos ocurridos en la placa de norte america durante el 2020
select *from sismos where Placa ilike 'Norteam%' and Anio = 2020;
-- listando los sismos ocurridos en el estado de puebla
select *from sismos where municipio ilike '%, PUE';
--cuántos sismos ocurrienron en la regios sureste en diciembre del 2017
select count(*) from sismos where Zona ilike 'Sureste' and Anio =2017 and Mes = 12;
--mostrando los sismos con magnitud entre 5 y 6 durante el 2019
select *from sismos where Magnitud between 5 and 6 and Anio = 2019;
-- listando los sismos ocurridos durante el mes de juilio de 2020 en orden descendente de magnitud
select *from sismos where Mes = 7 and Anio = 2020 order by Magnitud desc;
-- Calcular la magnitud mínima, promedio y máxima por entidad
select right(Municipio,4) as entidad,
min(Magnitud) as mag_mimina,
max(Magnitud) as mag_maxima,
avg(Magnitud) as magnitud_prom
from sismos group by entidad;

-- Calculando la magnitud mínima, máxima y promedio por entidad durante los últimos 10 años
select right(Municipio,4) as entidad, Anio,
min(Magnitud) as Magnitud_minima,
max(Magnitud) as Magnitud_maxima,
avg(Magnitud) as Magnitud_promedio
from sismos WHERE Anio > 2012 
group by entidad,Anio;
--Muestre el renglón de oxaca donde la magnitud fue de 7.4
select *from sismos where Municipio ilike '%OAX'  and Magnitud=7.4;
-- creando tabl Resumen últimos 10 años
create table Resumen as
select right(Municipio,4) as entidad, Anio,
min(Magnitud) as Magnitud_minima,
max(Magnitud) as Magnitud_maxima,
avg(Magnitud) as Magnitud_promedio
from sismos WHERE Anio > 2012 
group by entidad,Anio;
-- guardando tabla en archivo csv
COPY Resumen TO 'D:/3. Cursos/8. diplomado postgresql/AADB/resumen_ultimos_10_anios.csv' CSV HEADER;