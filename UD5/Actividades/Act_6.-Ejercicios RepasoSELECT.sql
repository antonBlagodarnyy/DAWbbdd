--1)
SELECT * FROM EMPLEADOREPASO;

SELECT DISTINCT APELLIDO1 FROM EMPLEADOREPASO;

--2)
SELECT * FROM EMPLEADOREPASO;

--3)
SELECT UPPER(NOMBRE || ' '||APELLIDO1 || ' ' || APELLIDO2) AS nombre FROM EMPLEADOREPASO;

--4)
SELECT LOWER(NOMBRE || ' '||APELLIDO1 || ' ' || APELLIDO2) AS nombre FROM EMPLEADOREPASO;

--5)
SELECT * FROM EMPLEADOREPASO;

SELECT ("ID" || ' '|| SUBSTR(nif,1,9) )  AS IDNIF FROM EMPLEADOREPASO ;

--6)
SELECT * FROM EMPLEADOREPASO;

SELECT nombre, apellido1, apellido2 FROM EMPLEADOREPASO ORDER BY APELLIDO1 Asc;
--Hasta aqui corregimos
--7)
SELECT * FROM departamentorespaso;

SELECT nombre, presupuesto FROM departamentorespaso ORDER BY presupuesto FETCH FIRST 3 ROWS ONLY;
--Con comandos nuevos
SELECT nombre, presupuesto FROM (SELECT nombre, presupuesto FROM departamentorespaso ORDER BY presupuesto) WHERE ROWNUM<=3;
--Con comandos viejos
------------
--8)
SELECT * FROM departamentorespaso;

SELECT nombre,gastos FROM (SELECT nombre,gastos FROM departamentorespaso ORDER BY GASTOS DESC) WHERE ROWNUM<=2; 

--9)
SELECT * FROM departamentorespaso;

SELECT nombre,presupuesto FROM departamentorespaso WHERE presupuesto > 99999 AND presupuesto < 199999;

--10)
SELECT * FROM departamentorespaso;

SELECT nombre,presupuesto FROM departamentorespaso WHERE presupuesto BETWEEN 100000 AND 200000;

--11)
SELECT * FROM departamentorespaso;

SELECT nombre, presupuesto, gastos FROM departamentorespaso WHERE gastos > presupuesto;

--12)
SELECT * FROM empleadorepaso;

SELECT * FROM empleadorepaso WHERE APELLIDO2 IS NULL;

--13)
SELECT * FROM empleadorepaso;

SELECT * FROM empleadorepaso WHERE APELLIDO2 IS NOT NULL;

--14)
SELECT * FROM empleadorepaso;

SELECT nombre, apellido1, apellido2, nif FROM empleadorepaso
WHERE id_departamento=2 OR  
id_departamento=4 OR  
id_departamento=5;  

--JOINS
--1)
SELECT * FROM fabricanterepaso;
SELECT * FROM productorepaso;

SELECT * FROM productorepaso PRO
JOIN fabricanterepaso FAB
ON PRO.id_fabricante = fab.id;

--2)
SELECT * FROM fabricanterepaso;
SELECT * FROM productorepaso;

SELECT * FROM productorepaso PRO
JOIN fabricanterepaso FAB
ON PRO.id_fabricante = fab.id
ORDER BY fab.nombre ASC;

--3)
SELECT * FROM fabricanterepaso;
SELECT * FROM productorepaso;

SELECT P.id, p.nombre, f.id, f.nombre
FROM PRODUCTOREPASO P
JOIN FABRICANTEREPASO F
ON p.id_fabricante=f.id;

--4)
SELECT * FROM fabricanterepaso;
SELECT * FROM productorepaso;

SELECT P.nombre, P.precio, F.nombre FROM fabricanterepaso F
JOIN productorepaso P 
ON p.id_fabricante=f.id
ORDER BY precio ASC
FETCH FIRST ROWS ONLY;

--5)
SELECT * FROM fabricanterepaso;
SELECT * FROM productorepaso;

SELECT P.nombre, P.precio, F.nombre FROM fabricanterepaso F
JOIN productorepaso P 
ON p.id_fabricante=f.id
ORDER BY precio DESC
FETCH FIRST 1 ROWS ONLY;

--6
SELECT * FROM fabricanterepaso;
SELECT * FROM productorepaso;

SELECT * FROM productorepaso P
JOIN fabricanterepaso F 
ON p.id_fabricante = f.id
WHERE f.nombre = 'Lenovo';

--7
SELECT * FROM fabricanterepaso;
SELECT * FROM productorepaso;

SELECT * FROM productorepaso P
JOIN fabricanterepaso F 
ON p.id_fabricante = f.id
WHERE f.nombre = 'Crucial'
AND
p.precio > 200;

--8
SELECT * FROM fabricanterepaso;
SELECT * FROM productorepaso;

SELECT * FROM productorepaso P
JOIN fabricanterepaso F 
ON p.id_fabricante = f.id
WHERE f.nombre = 'Crucial'
OR
f.nombre = 'Hewlett-Packard'
OR
f.nombre = 'Seagate';

--9
SELECT * FROM fabricanterepaso;
SELECT * FROM productorepaso;

SELECT * FROM productorepaso P
JOIN fabricanterepaso F 
ON p.id_fabricante = f.id
WHERE f.nombre IN ('Asus','Hewlett-Packard', 'Seagate');


--10)
SELECT * FROM fabricanterepaso;
SELECT * FROM productorepaso;

SELECT p.nombre, p.precio FROM productorepaso P
JOIN fabricanterepaso F 
ON p.id_fabricante = f.id
WHERE f.nombre LIKE '%e';

--11)
SELECT * FROM fabricanterepaso;
SELECT * FROM productorepaso;

SELECT p.nombre, p.precio FROM productorepaso P
JOIN fabricanterepaso F 
ON p.id_fabricante = f.id
WHERE f.nombre LIKE '%w%';

--12)
SELECT * FROM fabricanterepaso;
SELECT * FROM productorepaso;

SELECT p.nombre, p.precio,f.nombre FROM productorepaso P
JOIN fabricanterepaso F 
ON p.id_fabricante = f.id
WHERE p.precio >= 180
ORDER BY p.precio DESC,
p.nombre ASC;

--13)
SELECT * FROM fabricanterepaso;
SELECT * FROM productorepaso;

SELECT DISTINCT f.id, f.nombre FROM fabricanterepaso F
JOIN productorepaso P 
ON p.id_fabricante = f.id
WHERE f.id in (SELECT p.id_fabricante FROM productorepaso);

--14)Calcula el numero total de productos que hay en la tabla productos.
SELECT * FROM fabricanterepaso;
SELECT * FROM productorepaso;

SELECT COUNT(*) AS numero_productos FROM productorepaso;

--15)Calcula el n?mero total de fabricantes que hay en la tabla fabricante.
SELECT * FROM fabricanterepaso;
SELECT * FROM productorepaso;

SELECT COUNT(*) AS numero_fabricantes FROM fabricanterepaso;

--16)Calcula el numero de valores distintos de identificador de fabricante aparecen en la tabla productos.
SELECT * FROM fabricanterepaso;
SELECT * FROM productorepaso;

SELECT COUNT(DISTINCT id_fabricante) AS numero_fabricantes_no_repetidos FROM productorepaso;

--17)Calcula la media del precio de todos los productos.
SELECT * FROM fabricanterepaso;
SELECT * FROM productorepaso;

SELECT AVG(precio) AS precio_medio FROM productorepaso;

--18)Calcula el precio m?s barato de todos los productos.
SELECT * FROM fabricanterepaso;
SELECT * FROM productorepaso;

SELECT precio FROM (SELECT precio FROM productorepaso ORDER BY precio ASC) WHERE ROWNUM=1;

--19)Calcula el precio m?s caro de todos los productos.
SELECT * FROM fabricanterepaso;
SELECT * FROM productorepaso;

SELECT precio FROM (SELECT precio FROM productorepaso ORDER BY precio DESC) WHERE ROWNUM=1;

--20)Lista el nombre y el precio del producto m?s barato.
SELECT * FROM fabricanterepaso;
SELECT * FROM productorepaso;

SELECT nombre,precio FROM (SELECT nombre, precio FROM productorepaso ORDER BY precio ASC) WHERE ROWNUM=1;

--21)Lista el nombre y el precio del producto m?s caro.
SELECT * FROM fabricanterepaso;
SELECT * FROM productorepaso;

SELECT nombre,precio FROM (SELECT nombre, precio FROM productorepaso ORDER BY precio DESC) WHERE ROWNUM=1;

--22)Calcula la suma de los precios de todos los productos.
SELECT * FROM fabricanterepaso;
SELECT * FROM productorepaso;

SELECT SUM(precio) FROM productorepaso;

--23)Calcula el n?mero de productos que tiene el fabricante Asus.
SELECT * FROM fabricanterepaso;
SELECT * FROM productorepaso;

SELECT COUNT(*) FROM productorepaso P
JOIN fabricanterepaso F
ON p.id_fabricante = f.id
WHERE f.nombre = 'Asus';

--24)Calcula la media del precio de todos los productos del fabricante Asus.
SELECT * FROM fabricanterepaso;
SELECT * FROM productorepaso;

SELECT AVG(precio) FROM fabricanterepaso f
JOIN productorepaso p
ON p.id_fabricante = f.id
WHERE f.nombre='Asus'; 

--25)Calcula el precio m?s barato de todos los productos del fabricante Asus.
SELECT * FROM fabricanterepaso;
SELECT * FROM productorepaso;

SELECT precio FROM (SELECT precio FROM fabricanterepaso f
JOIN productorepaso p
ON p.id_fabricante = f.id WHERE f.nombre='Asus'
ORDER BY precio ASC)
WHERE ROWNUM = 1;

--26)Calcula el precio m?s caro de todos los productos del fabricante Asus.
SELECT * FROM fabricanterepaso;
SELECT * FROM productorepaso;

SELECT precio FROM (SELECT precio FROM fabricanterepaso f
JOIN productorepaso p
ON p.id_fabricante = f.id WHERE f.nombre='Asus'
ORDER BY precio DESC)
WHERE ROWNUM = 1;

--27)Calcula la suma de todos los productos del fabricante Asus.
SELECT * FROM fabricanterepaso;
SELECT * FROM productorepaso;

SELECT SUM(precio) FROM productorepaso P
JOIN fabricanterepaso F
ON p.id_fabricante = f.id
WHERE f.nombre = 'Asus';

--28) Muestra el precio m?ximo, precio m?nimo, precio medio 
--y el n?mero total de productos que tiene el fabricante Crucial.
SELECT * FROM fabricanterepaso;
SELECT * FROM productorepaso;

SELECT MAX(P.precio) AS precio_maximo, MIN(P.precio) AS precio_minimo, AVG(P.precio) AS precio_medio
,COUNT(*) AS numero_productos FROM productorepaso P
JOIN fabricanterepaso F
ON p.id_fabricante = f.id
WHERE F.nombre='Crucial';

--29)Muestra el n?mero total de productos que tiene cada uno 
--de los fabricantes. El listado tambi?n debe incluir los fabricantes
--que no tienen ning?n producto. El resultado mostrar? dos columnas, 
--una con el nombre del fabricante y otra con el n?mero de productos que tiene.
--Ordene el resultado descendentemente por el n?mero de productos.
SELECT * FROM fabricanterepaso;
SELECT * FROM productorepaso;

SELECT f.nombre, COUNT(p.id) AS numeroProductos  FROM fabricanterepaso F
LEFT JOIN productorepaso P 
ON P.id_fabricante = f.id 
GROUP BY f.nombre
ORDER BY numeroProductos DESC;

--30. Muestra el precio m?ximo, precio m?nimo y precio medio de los productos de cada uno de los fabricantes. 
--El resultado mostrar? el nombre del fabricante junto con los datos que se solicitan.
SELECT * FROM fabricanterepaso;
SELECT * FROM productorepaso;

SELECT f.nombre, MAX(p.precio) AS precio_maximo, MIN(p.precio) AS precio_minimo, AVG(p.precio) AS precio_medio FROM fabricanterepaso F
LEFT JOIN productorepaso P 
ON P.id_fabricante = f.id 
GROUP BY f.nombre;

--31. Muestra el precio m?ximo, precio m?nimo, precio medio y el n?mero total de productos de los fabricantes que 
--tienen un precio medio superior a 200?. No es necesario mostrar el nombre del fabricante, con el identificador del fabricante es suficiente.
SELECT * FROM fabricanterepaso;
SELECT * FROM productorepaso;

SELECT f.id, MAX(p.precio) AS precio_maximo, MIN(p.precio) AS precio_minimo, AVG(p.precio) AS precio_medio, COUNT(p.id) AS numeroProductos
FROM fabricanterepaso F 
LEFT JOIN productorepaso P 
ON P.id_fabricante = f.id
GROUP BY f.id
HAVING AVG(p.precio) > 200;

--32. Muestra el nombre de cada fabricante, junto con el precio m?ximo, precio m?nimo, precio medio
--y el n?mero total de productos de los fabricantes que tienen un precio medio superior a 200?.
--Es necesario mostrar el nombre del fabricante.
SELECT * FROM fabricanterepaso;
SELECT * FROM productorepaso;

SELECT f.nombre, MAX(p.precio) AS precio_maximo, MIN(p.precio) AS precio_minimo, AVG(p.precio) AS precio_medio, COUNT(p.id) AS numeroProductos
FROM fabricanterepaso F 
LEFT JOIN productorepaso P 
ON P.id_fabricante = f.id
GROUP BY f.nombre
HAVING AVG(p.precio) > 200;

--33. Calcula el n?mero de productos que tienen un precio mayor o igual a 180?.
SELECT * FROM fabricanterepaso;
SELECT * FROM productorepaso;

SELECT COUNT(*) AS numero_productos FROM productorepaso
WHERE precio >= 180;

--34. Calcula el n?mero de productos que tiene cada fabricante con un precio mayor o igual a 180?.
SELECT * FROM fabricanterepaso;
SELECT * FROM productorepaso;

SELECT f.nombre, COUNT(*) AS numero_productos FROM fabricanterepaso f
JOIN productorepaso p
ON p.id_fabricante=f.id 
WHERE p.precio>=180
GROUP BY f.nombre;

---35. Lista el precio medio los productos de cada fabricante, mostrando solamente el identificador del fabricante.
SELECT * FROM fabricanterepaso;
SELECT * FROM productorepaso;

SELECT f.id, AVG(p.precio) AS precio_medio FROM fabricanterepaso F
 JOIN productorepaso p
ON p.id_fabricante=f.id 
GROUP BY f.id;

--36. Lista el precio medio los productos de cada fabricante, mostrando solamente el nombre del fabricante.
SELECT * FROM fabricanterepaso;
SELECT * FROM productorepaso;

SELECT f.nombre, AVG(p.precio) AS precio_medio FROM fabricanterepaso F
 JOIN productorepaso p
ON p.id_fabricante=f.id 
GROUP BY f.nombre;

--37. Lista los nombres de los fabricantes cuyos productos tienen un precio medio mayor o igual a 150?.
SELECT * FROM fabricanterepaso;
SELECT * FROM productorepaso;

SELECT f.nombre FROM fabricanterepaso F
 JOIN productorepaso p
ON p.id_fabricante=f.id 
GROUP BY f.nombre
HAVING AVG(p.precio) >= 150;

--38. Devuelve un listado con los nombres de los fabricantes que tienen 2 o m?s productos.
SELECT * FROM fabricanterepaso;
SELECT * FROM productorepaso;

SELECT f.nombre, COUNT(p.id) AS numero_productos_con_precio_mayor_a_220 
FROM fabricanterepaso f
JOIN productorepaso p ON p.id_fabricante = f.id
GROUP BY f.nombre
having COUNT(p.id)>=2;

----39. Devuelve un listado con los nombres de los fabricantes y el n?mero
--de productos que tiene cada uno con un precio superior o igual a 220
SELECT * FROM fabricanterepaso;
SELECT * FROM productorepaso;

SELECT f.nombre, COUNT(f.id) AS numero_productos_con_precio_mayor_a_220 
FROM fabricanterepaso f
JOIN productorepaso p ON p.id_fabricante = f.id
WHERE p.precio >= 220
GROUP BY f.nombre ;

----40. Devuelve un listado con los nombres de los fabricantes donde 
--la suma del precio de todos sus productos es superior a 1000 ?.
SELECT * FROM fabricanterepaso;
SELECT * FROM productorepaso;

select f.nombre FROM fabricanterepaso f
JOIN productorepaso p ON p.id_fabricante = f.id
GROUP BY f.nombre
having SUM(p.precio) >=1000; 

----41. Devuelve un listado con el nombre del producto m?s caro que tiene cada fabricante. 
--El resultado debe tener tres columnas: nombre del producto, precio y nombre del
--fabricante. El resultado tiene que estar ordenado alfab?ticamente de menor a mayor por
--el nombre del fabricante.
SELECT * FROM fabricanterepaso;
SELECT * FROM productorepaso;

SELECT p.nombre AS nombre_producto, p.precio as precio_producto, f.nombre as nombre_fabricante
FROM fabricanterepaso f
JOIN productorepaso p ON p.id_fabricante = f.id
WHERE (f.id, p.precio) IN 

(SELECT f2.id,  MAX( p2.precio)  FROM fabricanterepaso f2
JOIN productorepaso p2 ON p2.id_fabricante = f2.id
GROUP BY f2.id)
ORDER BY f.nombre ASC;


