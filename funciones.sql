-- creando funcion que se llama calculate_discount, que recibe el precio y descuento
-- devuelve el precio final por el descuento proporcionado
-- si un precio es de 420 y hay un descuento de 10%, debe devolver 420-(420*0.1) 360
CREATE OR REPLACE FUNCTION calculate_discount(price numeric, discount_percent numeric)
RETURNS numeric AS $$
DECLARE
    discounted_price numeric;
BEGIN
    discounted_price := price - (price * discount_percent / 100);
    RETURN discounted_price;
END;
$$ LANGUAGE plpgsql;
-- procedemos a ejecutar la función
select *from calculate_discount(420, 10)

-- función que suma dos numeros enteros
CREATE OR REPLACE FUNCTION sumar(x int, y int)
RETURNS int AS
$$
DECLARE
    z int;
BEGIN
    z = x + y;
    RETURN z;
END
$$
LANGUAGE 'plpgsql';
-- llamando a la funcion
select *from sumar(7, 9);

