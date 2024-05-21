--- creando tablas de cmisas y pantalones
CREATE TABLE camisas (
    Id_camisa SERIAL PRIMARY KEY,
    camisa VARCHAR(50),
    Precio DECIMAL
);
CREATE TABLE pantalones (
    Id_pantalon SERIAL PRIMARY KEY,
    pantalon VARCHAR(50),
    Precio DECIMAL
);
--  procedemos a llenar las tablas
-- Insertar datos en la tabla camisas
INSERT INTO camisas (camisa, Precio) VALUES
('lino blanco', 210),
('algodon naranja', 290),
('seda negra', 260);
-- Insertar datos en la tabla pantalones
INSERT INTO pantalones (pantalon, Precio) VALUES
('mezclilla azul', 470),
('mezclilla negra', 730);

select *from camisas;
select *from pantalones;

create table camisas_pantalones as
select camisas.camisa, 
       camisas.precio as Precio_camisa, 
       pantalones.pantalon, 
       pantalones.precio as Precio_pantalon,
       camisas.precio + pantalones.precio as Precio_final
from camisas, pantalones;
select concat('Camisa de ',camisa,' con pantalon de ',pantalon) as combinacion, 
	Precio_final
from camisas_pantalones
order by Precio_final Desc;
----------------------------------------------------------------------------------
-------- Uso de JOIN
----------------------------------------------------------------------------------
-- creando tablas
CREATE TABLE frutas_A (
    ID_A SERIAL PRIMARY KEY,
    Fruta VARCHAR(50) NOT NULL
);

CREATE TABLE frutas_B (
    ID_B SERIAL PRIMARY KEY,
    Fruta VARCHAR(50) NOT NULL
);
-- insertando datos a las tablas
INSERT INTO frutas_A(Fruta) VALUES
('Manzana'),
('Naranja'),
('Plátano'),
('Pepino');
INSERT INTO frutas_B(Fruta) VALUES
('Naranja'),
('Manzana'),
('Sandía'),
('Pera');
select * from frutas_B;
-- mostrando las frutas que estan en la tabla A y B
select * from frutas_A inner join frutas_B on frutas_A.Fruta = frutas_B.Fruta;
select * from frutas_B inner join frutas_A on frutas_B.Fruta = frutas_A.Fruta;
-- mostrando todas las filas de la tabla A y las coincidentes de la tabla B, si no hay coincidencia poner NULL
select * from frutas_A left join frutas_B on frutas_A.Fruta = frutas_B.Fruta;
-- mostrando todas las filas donde no hay coincidencia entre a  y b [null]
select * from frutas_A left join frutas_B on frutas_A.Fruta = frutas_B.Fruta where frutas_B.Fruta is null
-- mostrando todas las filas donde hay y no hay coincidencia
select * from frutas_A full join frutas_B on frutas_A.Fruta = frutas_B.Fruta;
-- mostrando solo las filas donde no hay coincidencia
select * from frutas_A full join frutas_B on frutas_A.Fruta = frutas_B.fruta
where frutas_A.Fruta is null or frutas_B.Fruta is null;