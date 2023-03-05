/*
Consultas multitabla (Composición externa)
Resuelva todas las consultas utilizando las cláusulas LEFT JOIN y RIGHT JOIN.

*/

-- 1. Devuelve un listado de todos los fabricantes que existen en la base de datos, junto con los
-- productos que tiene cada uno de ellos. El listado deberá mostrar también aquellos fabricantes que
-- no tienen productos asociados.

select fabricante.nombre as  fabricante , producto.nombre as producto from fabricante left join producto on fabricante.id = producto.id_fabricante;

-- 2. Devuelve un listado donde sólo aparezcan aquellos fabricantes que no tienen ningún producto asociado.

select fabricante.nombre as  fabricante , producto.nombre as producto from fabricante left join producto on fabricante.id = producto.id_fabricante
WHERE producto.id_fabricante IS NULL;

-- 3. ¿Pueden existir productos que no estén relacionados con un fabricante? Justifique su respuesta.

-- RESPUESTA: no, ya que segun nuestra base de datos, todo producto debe tener si o si un fabricante, lo demuestro en la siguiente consulta
-- que no nos dará ningun resultado por lo mismo. 
SELECT * FROM producto LEFT JOIN fabricante ON producto.id_fabricante = fabricante.id WHERE fabricante.id IS NULL;





