-- creando tablas de librerias
create table clientes(Cliente_ID int, Nombre text);
create table libros(ISBN text, Titulo text, Autor text, Editorial text, Año_de_publicacion int, Genero text, Precio_de_venta numeric);
create table ventas(Venta_ID int, ISBN text, Fecha_de_venta date, Cliente text, Precio_de_venta numeric);
-- procedemos a cargar datos de archivos csv a la tabla 
copy clientes(Cliente_ID , Nombre)
from 'D:/3. Cursos/8. diplomado postgresql/librerias/clientes.csv'
DELIMITER ',' csv header;
-- procedemos a cargar  los datos del archivo librecia csv
copy libros(ISBN, Titulo, Autor, Editorial, Año_de_publicacion, Genero, Precio_de_venta)
from 'D:/3. Cursos/8. diplomado postgresql/librerias/libros.csv'
DELIMITER ',' csv header;
-- cargando datos de archivo ventas
copy ventas(Venta_ID, ISBN, Fecha_de_venta, Cliente, Precio_de_venta)
from 'D:/3. Cursos/8. diplomado postgresql/librerias/ventas.csv'
DELIMITER ',' csv header;

------------------------------------------------------------------------
-- crear una función para agregar un registro a la tabla libro
create or replace function agregar_libro(
isbn text,
titulo text,
autor text,
editorial text,
año_de_publicacion int,
genero text,
precio_de_venta numeric
)
returns int as $$
begin
insert into libros values (isbn, titulo, autor, editorial, año_de_publicacion, genero, precio_de_venta);
return 0;
end;
$$ 
language 'plpgsql';
select * from agregar_libro('978-3-16-148410-0',
							'El libro de la selva',
							'Rudyard Kipling', 
							'Editorial A',
							1894,
						   'Aventura',
						   15.99);
select * from libros;

----- Ejercicio 3 (tarea): crear una función para calcular el total de ventas de un libro por ISBN
----- Ejercicio 4 (tarea): Crear una función para obtener el número de ventas por cliente (es decir, cuántas compras hizo)

---Crear una función para obtener los libros vendidos en un rango de fechas
create or replace function libros_vendidos_rango(fecha_inicio date, fecha_final date)
returns table(isbn text, titulo text, fecha_de_venta date, cliente text, precio_de_venta numeric) as $$
begin
return query 
select libros.isbn, libros.titulo, ventas.fecha_de_venta, ventas.cliente, ventas.precio_de_venta 
from libros 
join ventas on libros.isbn = ventas.isbn
where ventas.fecha_de_venta between fecha_inicio and fecha_final;
end;
$$
language 'plpgsql';
create table fechas_filtradas as select * from libros_vendidos_rango('2023-05-01','2023-05-02');
select * from fechas_filtradas;