USE tienda;
-- 1
SELECT nombre FROM producto;
-- 2
SELECT nombre, precio FROM producto;
-- 3
SELECT * FROM producto;
-- 4
SELECT nombre, precio, precio * 1.08 AS dolar_price FROM producto;
-- 5
SELECT nombre AS nom_de_producto, precio AS euros, ROUND(precio * 1.08, 2) AS dolar_price FROM producto;
-- 6 
SELECT UPPER(nombre) AS nombre, UPPER(precio) AS precio FROM producto;
-- 7
SELECT LOWER(nombre) AS nombre, LOWER(precio) AS precio FROM producto;
-- 8
SELECT nombre, UPPER(SUBSTRING(nombre, 1, 2)) AS Abbreviation FROM fabricante;
-- 9
SELECT nombre, ROUND(precio) FROM producto; 
-- 10
SELECT nombre, TRUNCATE(precio, 0) FROM producto;
-- 11
SELECT codigo_fabricante FROM producto;
-- 12
SELECT codigo_fabricante FROM producto GROUP BY codigo_fabricante;
-- 13
SELECT nombre FROM fabricante ORDER BY nombre ASC;
-- 14
SELECT nombre FROM fabricante ORDER BY nombre DESC;
-- 15
SELECT nombre FROM producto ORDER BY nombre ASC, precio DESC;
-- 16
SELECT * FROM fabricante LIMIT 5;
-- 17
SELECT * FROM fabricante LIMIT 2 OFFSET 3;
-- 18
SELECT nombre, precio FROM producto ORDER BY precio ASC LIMIT 1;
-- 19
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;
-- 20 
SELECT nombre FROM producto WHERE codigo_fabricante = 2;
-- 21
SELECT p.nombre, p.precio, f.nombre AS nombre_fabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo;
-- 22
SELECT p.nombre, p.precio, f.nombre AS nombre_fabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo ORDER BY f.nombre;
-- 23
SELECT p.codigo AS codigo_producto, p.nombre, f.codigo AS codigo_fabricante, f.nombre AS nombre_fabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo;
-- 24
SELECT p.nombre, p.precio, f.nombre AS nombre_fabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo ORDER BY p.precio LIMIT 1;
-- 25
SELECT p.nombre, p.precio, f.nombre AS nombre_fabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo ORDER BY p.precio DESC LIMIT 1;
-- 26 
SELECT p.nombre, p.precio, f.nombre AS nombre_fabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre IN ('Lenovo');
-- 27
SELECT p.nombre, p.precio, f.nombre AS nombre_fabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Crucial' AND p.precio > 200;
-- 28
SELECT p.nombre, p.precio, f.nombre AS nombre_fabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Hewlett-Packard' OR f.nombre = 'Asus' OR f.nombre ='Seagate';
-- 29 
SELECT p.nombre, p.precio, f.nombre AS nombre_fabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre IN ('Hewlett-Packard', 'Asus', 'Seagate');
-- 30
SELECT p.nombre, p.precio FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre REGEXP ('e$');
-- 3 m1
SELECT p.nombre, p.precio FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre LIKE ('%w%');
-- 32
SELECT p.nombre, p.precio, f.nombre AS nombre_fabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE p.precio >= 180 ORDER BY p.precio DESC, p.nombre;
-- 33
SELECT f.codigo, f.nombre AS nombre_fabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo GROUP BY f.codigo;
-- 34
SELECT f.nombre AS nombre_fabricante, p.nombre AS nombre_producto FROM producto p RIGHT	JOIN fabricante f ON f.codigo = p.codigo_fabricante;
-- 35 
SELECT f.nombre AS nombre_fabricante, p.nombre AS nombre_producto FROM producto p RIGHT	JOIN fabricante f ON f.codigo = p.codigo_fabricante WHERE p.nombre IS null;
-- 36 
SELECT f.nombre AS nombre_fabricante, p.nombre AS nombre_producto FROM producto p LEFT JOIN fabricante f ON (p.codigo_fabricante = f.codigo) WHERE f.nombre IN ('lenovo');
-- 37
SELECT * FROM producto WHERE precio IN (SELECT MAX(precio) FROM producto p LEFT JOIN fabricante f ON (p.codigo_fabricante = f.codigo) WHERE f.nombre IN ('lenovo'));
-- 38
SELECT f.nombre AS nombre_fabricante, p.nombre AS nombre_producto, p.precio FROM producto p LEFT JOIN fabricante f ON (p.codigo_fabricante = f.codigo) WHERE f.nombre IN ('lenovo') ORDER BY p.precio DESC LIMIT 1;
-- 39 Llista el nom del producte més barat del fabricant Hewlett-Packard.
SELECT f.nombre AS nombre_fabricante, p.nombre AS nombre_producto, p.precio FROM producto p LEFT JOIN fabricante f ON (p.codigo_fabricante = f.codigo) WHERE f.nombre IN ('Hewlett-Packard') ORDER BY p.precio ASC LIMIT 1;
-- 40
SELECT * FROM producto WHERE precio >= (SELECT MAX(precio) FROM producto p LEFT JOIN fabricante f ON (p.codigo_fabricante = f.codigo) WHERE f.nombre IN ('lenovo'));
-- 41
SELECT * FROM producto p JOIN fabricante f ON f.codigo = p.codigo_fabricante WHERE f.nombre IN ('Asus') AND precio > (SELECT AVG(precio) FROM producto p LEFT JOIN fabricante f ON (p.codigo_fabricante = f.codigo) WHERE f.nombre IN ('asus'));


