
-- Consultas resumen

-- 1. Calcula el número total de productos que hay en la tabla productos.

select count(id) as cantidad from producto;

-- 2. Calcula el número total de fabricantes que hay en la tabla fabricante.

select count(id) as cantidad from fabricante;

-- 3. Calcula el número de valores distintos de identificador de fabricante aparecen en la tabla productos.

select count(distinct(fabricante.id)) from fabricante inner join producto on fabricante.id = producto.id_fabricante;

-- 4. Calcula la media del precio de todos los productos.

SELECT TRUNCATE(AVG(precio), 2) AS 'precio promedio' FROM producto;

-- 5. Calcula el precio más barato de todos los productos.

select min(precio) 'precio mas bajo' from producto;

-- 6. Calcula el precio más caro de todos los productos.

select max(precio) 'precio mas bajo' from producto;

-- 7. Lista el nombre y el precio del producto más barato.

select nombre, min(precio) as precio from producto;

-- 8. Lista el nombre y el precio del producto más caro.

select nombre, max(precio) as precio from producto;

-- 9. Calcula la suma de los precios de todos los productos.

select sum(precio) as total from producto;

-- 10. Calcula el número de productos que tiene el fabricante Asus.

select count(producto.nombre) as 'Cantidad Productos' from producto inner join fabricante 
on fabricante.id = producto.id_fabricante where fabricante.nombre in ('Asus'); 

-- 11. Calcula la media del precio de todos los productos del fabricante Asus.

SELECT TRUNCATE(AVG(precio), 2) AS 'precio promedio Asus' FROM producto inner join fabricante on fabricante.id = producto.id_fabricante 
where fabricante.nombre = 'Asus';

-- 12. Calcula el precio más barato de todos los productos del fabricante Asus.

select min(precio) 'mas barato' from producto inner join fabricante on producto.id_fabricante = fabricante.id
where fabricante.nombre = 'Asus';

-- 13. Calcula el precio más caro de todos los productos del fabricante Asus.

select max(precio) 'mas caro' from producto inner join fabricante on producto.id_fabricante = fabricante.id
where fabricante.nombre = 'Asus';

-- 14. Calcula la suma de todos los productos del fabricante Asus.

select sum(precio) 'Total' from producto inner join fabricante on producto.id_fabricante = fabricante.id
where fabricante.nombre = 'Asus';

-- 15. Muestra el precio máximo, precio mínimo, precio medio y el número total de productos que tiene
-- el fabricante Crucial.

select max(precio) maximo, min(precio) minimo, truncate(avg(precio),2) promedio, count(producto.id) from producto
inner join fabricante on producto.id_fabricante = fabricante.id where fabricante.nombre = 'Crucial';

-- 16. Muestra el número total de productos que tiene cada uno de los fabricantes. El listado también
-- debe incluir los fabricantes que no tienen ningún producto. El resultado mostrará dos columnas,
-- una con el nombre del fabricante y otra con el número de productos que tiene. Ordene el
-- resultado descendentemente por el número de productos.


SELECT fabricante.nombre fabricante, COUNT(producto.id) num_productos FROM fabricante LEFT JOIN producto ON fabricante.id = producto.id_fabricante
GROUP BY fabricante.nombre ORDER BY num_productos DESC;

-- 17. Muestra el precio máximo, precio mínimo y precio medio de los productos de cada uno de los
-- fabricantes. El resultado mostrará el nombre del fabricante junto con los datos que se solicitan.

select fabricante.nombre, max(precio) maximo, min(precio) minimo, truncate(avg(precio),2) promedio from producto inner join fabricante on fabricante.id = producto.id_fabricante
GROUP BY fabricante.nombre;

-- 18. Muestra el precio máximo, precio mínimo, precio medio y el número total de productos de los
-- fabricantes que tienen un precio medio superior a 200. No es necesario mostrar el nombre del
-- fabricante, con el identificador del fabricante es suficiente.

SELECT fabricante.id, MAX(precio) AS maximo, MIN(precio) AS minimo, TRUNCATE(AVG(precio),2) AS promedio, COUNT(producto.id) AS productos_mas_200
FROM producto INNER JOIN fabricante ON fabricante.id = producto.id_fabricante GROUP BY fabricante.id HAVING promedio > 200;

-- 19. Muestra el nombre de cada fabricante, junto con el precio máximo, precio mínimo, precio medio y
-- el número total de productos de los fabricantes que tienen un precio medio superior a 200. Es
-- necesario mostrar el nombre del fabricante.

SELECT fabricante.nombre, MAX(precio) AS maximo, MIN(precio) AS minimo, TRUNCATE(AVG(precio),2) AS promedio, COUNT(producto.id) AS productos_mas_200
FROM producto INNER JOIN fabricante ON fabricante.id = producto.id_fabricante GROUP BY fabricante.id HAVING promedio > 200;

-- 20. Calcula el número de productos que tienen un precio mayor o igual a 180.

select count(producto.id) 'cantidad productos >= 180' from producto where precio >= 180;


