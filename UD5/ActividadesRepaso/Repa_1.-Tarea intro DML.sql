SELECT * FROM trabajadores;
SELECT * FROM departamentos;

--1)Seleccionar todos los trabajadores de la tabla trabajadores ordenados
-- por salario de forma descendente.
SELECT * FROM trabajadores;

SELECT * FROM trabajadores
ORDER BY salario DESC;

--2)Seleccionar los nombres únicos de departamentos de la tabla Departamentos.
SELECT * FROM departamentos;

SELECT DISTINCT nombre_departamento FROM departamentos;

--3)Seleccionar los trabajadores con un salario mayor a 35000 y menores de 40000.
SELECT * FROM trabajadores;

SELECT * FROM trabajadores
WHERE SALARIO BETWEEN 35001 AND 39999;

--4)Seleccionar los trabajadores cuyos nombres comienzan con 'J'.
SELECT * FROM trabajadores;

SELECT * FROM trabajadores 
WHERE NOMBRE LIKE 'J%';

--5)Seleccionar los trabajadores cuyos apellidos son nulos.
SELECT * FROM trabajadores;

SELECT * FROM trabajadores
WHERE apellido IS NULL;

--6) Seleccionar los trabajadores cuyas edades están entre 28 y 33 años.
SELECT * FROM trabajadores;

SELECT * FROM trabajadores 
WHERE edad BETWEEN 28 AND 33;

--7)Contar el número total de trabajadores en la tabla trabajadores.
SELECT * FROM trabajadores;

SELECT COUNT(*) AS numero_trabajadores FROM trabajadores;

--8) Calcular el salario promedio de todos los trabajadores.
SELECT * FROM trabajadores;

SELECT AVG(salario) as salario_promedio FROM trabajadores;

--9)Calcular la suma total de los salarios de todos los trabajadores.
SELECT * FROM trabajadores;

SELECT SUM(salario) AS sumatorio_salarios FROM trabajadores;

--10)Encontrar el salario máximo y mínimo entre todos los trabajadores.
SELECT * FROM trabajadores;

SELECT MAX(salario) as salario_maximo, MIN(salario) as salario_minimo FROM trabajadores;