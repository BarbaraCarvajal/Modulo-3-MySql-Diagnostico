
-- Consultas multitabla (Composición interna)

-- 1. Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los
-- productos de la base de datos.

select producto.nombre as 'producto', producto.precio, fabricante.nombre as 'fabricante' from producto 
inner join fabricante on producto.id_fabricante = fabricante.id;
 
-- 2. Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los
-- productos de la base de datos. Ordene el resultado por el nombre del fabricante, por orden alfabético.

select producto.nombre as 'producto', producto.precio, fabricante.nombre as 'fabricante' from producto 
inner join fabricante on producto.id_fabricante = fabricante.id order by fabricante.nombre asc;

-- 3. Devuelve una lista con el identificador del producto, nombre del producto, identificador del
-- fabricante y nombre del fabricante, de todos los productos de la base de datos.

select producto.nombre as 'producto', producto.id as 'id producto', fabricante.id as 'id fabricante', fabricante.nombre as 'fabricante' from producto
inner join fabricante on producto.id_fabricante = fabricante.id;

-- 4. Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más barato.

select producto.nombre, min(producto.precio) as 'precio', fabricante.nombre from producto
inner join fabricante on producto.id_fabricante = fabricante.id;

-- 5. Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más caro.

select producto.nombre, max(producto.precio) as 'precio', fabricante.nombre from producto
inner join fabricante on producto.id_fabricante = fabricante.id ;

-- 6. Devuelve una lista de todos los productos del fabricante Lenovo.

select * from producto inner join fabricante on  producto.id_fabricante = fabricante.id
where fabricante.nombre like ('%Lenovo%');

-- 7. Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio mayor que 200.

select * from producto inner join fabricante on producto.id_fabricante = fabricante.id
where fabricante.nombre like ('%Crucial%') and producto.precio > 200;

-- 8. Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packard y Seagate. Sin utilizar el operador IN.

select * from producto inner join fabricante on producto.id_fabricante = fabricante.id
where fabricante.nombre like ('%Asus%') or fabricante.nombre like ('%Hewlett-Packard%') or fabricante.nombre like ('%Seagate%');

-- 9. Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate.
-- Utilizando el operador IN.

select * from producto inner join fabricante on producto.id_fabricante = fabricante.id
where fabricante.nombre in ('Asus', 'Hewlett-Packard', 'Seagate');

-- 10. Devuelve un listado con el nombre y el precio de todos los productos de los fabricantes cuyo
-- nombre termine por la vocal e.

select producto.nombre, precio from producto inner join fabricante on producto.id_fabricante = fabricante.id
where fabricante.nombre like ('%e');

-- 11. Devuelve un listado con el nombre y el precio de todos los productos cuyo nombre de fabricante
-- contenga el carácter w en su nombre.

select producto.nombre, precio from producto inner join fabricante on producto.id_fabricante = fabricante.id
where fabricante.nombre like ('%w%');

-- 12. Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos los
-- productos que tengan un precio mayor o igual a 180. Ordene el resultado en primer lugar por el
-- precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente)

select producto.nombre, precio, fabricante.nombre from producto inner join fabricante on producto.id_fabricante = fabricante.id
where precio >= 180 order by precio desc, producto.nombre asc;

-- 13. Devuelve un listado con el identificador y el nombre de fabricante, solamente de aquellos
-- fabricantes que tienen productos asociados en la base de datos

select fabricante.id, fabricante.nombre from fabricante inner join producto on fabricante.id = producto.id_fabricante;





