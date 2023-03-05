-- Consultas sobre una tabla


-- 1. Lista el nombre de todos los productos que hay en la tabla producto.

select nombre from producto;

-- 2. Lista los nombres y los precios de todos los productos de la tabla producto.

SELECT nombre, precio from producto;

-- 3. Lista todas las columnas de la tabla producto.

SELECT * from producto;

-- 4. Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD).

SELECT nombre as 'Producto',  CONCAT('€', precio) as 'EUR', CONCAT('$', TRUNCATE (precio * 1.07, 2)) as 'USD' FROM producto;

-- 5. Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD).
-- Utiliza los siguientes alias para las columnas: nombre de producto, euros, dólares.

select nombre as 'Producto', CONCAT('€', precio) as 'EURO', CONCAT('$', TRUNCATE (precio * 1.07, 2)) as 'DOLARES' FROM producto;

-- 6. Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los
-- nombres a mayúscula.

SELECT upper(nombre) as producto, precio from producto;

-- 7. Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los
-- nombres a minúscula.

SELECT lower(nombre) as producto, precio from producto;

-- 8. Lista el nombre de todos los fabricantes en una columna, y en otra columna obtenga en
-- mayúsculas los dos primeros caracteres del nombre del fabricante.

select nombre as 'fabricante', upper(left(nombre, 2)) as '2letras' from fabricante;

-- 9. Lista los nombres y los precios de todos los productos de la tabla producto, redondeando el valor
-- del precio.

SELECT nombre as producto, round(precio) as 'precio redondeado' from producto;

-- 10. Lista los nombres y los precios de todos los productos de la tabla producto, truncando el valor del
-- precio para mostrarlo sin ninguna cifra decimal.

SELECT nombre as 'producto', TRUNCATE(precio,0) as 'precio sin decimales' from producto;

-- 11. Lista el identificador de los fabricantes que tienen productos en la tabla producto.

SELECT fabricante.id as 'fabricante ID' FROM fabricante INNER JOIN producto ON fabricante.id = producto.id_fabricante;

-- 12. Lista el identificador de los fabricantes que tienen productos en la tabla producto, eliminando los
-- identificadores que aparecen repetidos.

SELECT DISTINCT fabricante.id as 'fabricante ID' from fabricante inner join producto on fabricante.id = producto.id_fabricante;

-- 13. Lista los nombres de los fabricantes ordenados de forma ascendente.

SELECT nombre as 'Nombre ascendente' from fabricante ORDER by nombre ASC;

-- 14. Lista los nombres de los fabricantes ordenados de forma descendente.

SELECT nombre as 'Nombre descendente' from fabricante ORDER by nombre DESC;

-- 15. Lista los nombres de los productos ordenados en primer lugar por el nombre de forma ascendente
-- y en segundo lugar por el precio de forma descendente.

SELECT nombre as 'nombre ascendente', precio as 'precio descendente' from producto ORDER by nombre ASC, precio DESC;

-- 16. Devuelve una lista con las 5 primeras filas de la tabla fabricante.

SELECT * from fabricante LIMIT 5;

-- 17. Devuelve una lista con 2 filas a partir de la cuarta fila de la tabla fabricante. La cuarta fila también
-- se debe incluir en la respuesta.

SELECT * from fabricante LIMIT 3,2;

-- 18. Lista el nombre y el precio del producto más barato. (Utilice solamente las cláusulas ORDER BY y LIMIT)

SELECT nombre, precio as 'más barato' FROM producto ORDER BY precio ASC LIMIT 1;

-- 19. Lista el nombre y el precio del producto más caro. (Utilice solamente las cláusulas ORDER BY y LIMIT)

SELECT nombre, precio as 'más caro' FROM producto ORDER BY precio desc LIMIT 1;

-- 20. Lista el nombre de todos los productos del fabricante cuyo identificador de fabricante es igual a 2.

select nombre as 'producto' from producto where id_fabricante = 2;

-- 21. Lista el nombre de los productos que tienen un precio menor o igual a 120.

select nombre as 'producto' from producto where precio <= 120;

-- 22. Lista el nombre de los productos que tienen un precio mayor o igual a 400.

select nombre as 'producto' from producto where precio >= 400;

-- 23. Lista el nombre de los productos que no tienen un precio mayor o igual a 400.

select nombre as 'producto' from producto where not precio >= 400;

-- 24. Lista todos los productos que tengan un precio entre 80 y 300. Sin utilizar el operador BETWEEN.

select * from producto where precio >= 80 and precio <= 300;

-- 25. Lista todos los productos que tengan un precio entre 60 y 200. Utilizando el operador BETWEEN.

select * from producto where precio between 60 and 200;

-- 26. Lista todos los productos que tengan un precio mayor que 200 y que el identificador de fabricante sea igual a 6.

select * from producto where precio > 200 AND id_fabricante = 6;

-- 27. Lista todos los productos donde el identificador de fabricante sea 1, 3 o 5. Sin utilizar el operador IN.

select * from producto where id_fabricante = 1 or id_fabricante = 3 or id_fabricante = 5;

-- 28. Lista todos los productos donde el identificador de fabricante sea 1, 3 o 5. Utilizando el operador IN.

select * from producto where id_fabricante in (1,3,5);

-- 29. Lista el nombre y el precio de los productos en céntimos (Habrá que multiplicar por 100 el valor del
-- precio). Cree un alias para la columna que contiene el precio que se llame céntimos.

select nombre, (precio*100) as centimos from producto;

-- 30. Lista los nombres de los fabricantes cuyo nombre empiece por la letra S.

select nombre from fabricante where nombre like 'S%';

-- 31. Lista los nombres de los fabricantes cuyo nombre termine por la vocal e.

select nombre from fabricante where nombre like '%e';

-- 32. Lista los nombres de los fabricantes cuyo nombre contenga el carácter w.

select nombre from fabricante where nombre like '%w%';

-- 33. Lista los nombres de los fabricantes cuyo nombre sea de 4 caracteres.

select nombre from fabricante where length(nombre) = 4;

-- 34. Devuelve una lista con el nombre de todos los productos que contienen la cadena Portátil en el nombre.

select nombre from producto where nombre like '%Portátil%';

-- 35. Devuelve una lista con el nombre de todos los productos que contienen la cadena Monitor en el
-- nombre y tienen un precio inferior a 215 .

select nombre from producto where nombre like '%Monitor%' and precio < 215;


-- 36. Lista el nombre y el precio de todos los productos que tengan un precio mayor o igual a 180.
-- Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por
-- el nombre (en orden ascendente).

select nombre, precio from producto where precio >= 180 order by precio desc, nombre asc;

