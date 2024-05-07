-- Solución de tares
-- Creando columna que contiene la diferencia entre la columna pérdida y el valor promedio
-- Paso 1: Creando columna llamada 
alter table modulo_victimizacion add dif_prom FLOAT;
-- actualizando la tabla con la operacion promedio- perdida
update modulo_victimizacion set dif_prom = perdida- (select avg(perdida) from modulo_victimizacion);
-- visualizando resultado
-- creando columma llada texto
alter table modulo_victimizacion add texto VARCHAR;
-- llenando columna
update modulo_victimizacion set texto = concat('La persona que vive en',entidad,' cuyo nombre es ',nombre,' ',apellido,
											  ' tubo una pérdida de ', perdida);


SELECT perdida, dif_prom,texto from modulo_victimizacion;

select avg(perdida) from modulo_victimizacion;