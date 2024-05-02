-- creando tabla
create table mi_primer_tabla(columna1 varchar(20),columna2 int);
-- insertando  registros a la base de datos
insert into mi_primer_tabla values ('Hector Manuel',3),('Roberto',20);
insert into mi_primer_tabla values ('Luis',5);
--  procedemos a ver los registros de la tabla
select *from mi_primer_tabla;