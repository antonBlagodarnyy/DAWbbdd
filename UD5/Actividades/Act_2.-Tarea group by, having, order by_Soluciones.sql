
--1
--a) 
SELECT * FROM alum0405;

--b) 
SELECT dni, nombre, apellidos, curso, nivel, clase FROM alum0405;

--c)
SELECT * FROM alum0405 WHERE poblacion='GUADALAJARA';

--d)
SELECT nombre, apellidos FROM alum0405 WHERE poblacion='GUADALAJARA';

--e) 
SELECT dni, nombre, apellidos, curso, nivel, clase FROM alum0405 ORDER BY nombre, apellidos;

--2
SELECT oficio FROM emple WHERE apellido='JIMENEZ';
SELECT salario FROM emple WHERE apellido='FERNANDEZ';
SELECT apellido, oficio, salario, fecha_alt FROM emple WHERE oficio='DIRECTOR' OR salario >=3000;


--13
SELECT tema, estante, ejemplares FROM libreria WHERE ejemplares BETWEEN 8 AND 15;

--14
SELECT * FROM libreria WHERE ejemplares BETWEEN 9 AND 20;
SELECT * FROM libreria WHERE ejemplares NOT BETWEEN 0 AND 8;

--16
SELECT tema FROM libreria WHERE ejemplares BETWEEN 0 AND 14;
SELECT tema FROM libreria WHERE ejemplares < 15 AND ejemplares > 20; --No sale

---GROUP BY, HAVING, ORDER BY

--1
SELECT dept_no , AVG(salario) FROM emple GROUP BY dept_no HAVING AVG(salario) > 2500 ORDER BY AVG(salario) DESC;

--2
SELECT oficio, COUNT (*) AS numero_empleados FROM emple 
GROUP BY oficio HAVING COUNT (*) > 3 ORDER BY numero_empleados;

--3
SELECT estante, SUM(ejemplares) AS total_ejemplares FROM libreria 
GROUP BY estante HAVING SUM(ejemplares) > 10 ORDER BY total_ejemplares DESC;

--4
SELECT curso, nivel, COUNT(*) AS numero_alumnos FROM alum0405 
GROUP BY curso, nivel HAVING COUNT (*) > 5 ORDER BY numero_alumnos;

--5
SELECT dnombre, MAX(salario) AS salario_maximo FROM depart JOIN emple ON depart.dept_no = emple.dept_no 
GROUP BY dnombre HAVING MAX(salario) >3000 ORDER BY salario_maximo DESC;

SELECT dept_no, MAX(salario) AS salario_maximo FROM emple 
GROUP BY dept_no HAVING MAX(salario) > 3000 ORDER BY salario_maximo DESC;

--6
SELECT dir, COUNT(*) AS empleados_direccion FROM emple
GROUP BY dir HAVING COUNT(*) > 2 ORDER BY empleados_direccion;

SELECT loc, COUNT(*) AS empleados_localidad FROM depart 
JOIN emple ON depart.dept_no = emple.dept_no 
GROUP BY loc HAVING COUNT(*) > 2 ORDER BY empleados_localidad;

SELECT * FROM emple;

--7
SELECT tema, SUM(ejemplares) AS total_ejemplares
FROM libreria GROUP BY tema HAVING SUM(ejemplares) > 20 
ORDER BY total_ejemplares DESC;

--8
SELECT clase, COUNT (*) AS numero_alumnos 
FROM alum0405 GROUP BY clase HAVING COUNT (*) > 4 
ORDER BY numero_alumnos;

--9
SELECT oficio, AVG(salario) AS salario_promedio 
FROM emple GROUP BY oficio HAVING AVG(salario) >2000 
ORDER BY salario_promedio DESC;

--10
SELECT dept_no, COUNT(*) AS empleados_dept
FROM emple GROUP BY dept_no HAVING COUNT (*) > 3 ORDER BY empleados_dept;

SELECT dnombre, COUNT (*) AS empleados_dept 
FROM depart JOIN emple ON depart.dept_no = emple.dept_no  
GROUP BY dnombre HAVING COUNT (*) > 3 ORDER BY empleados_dept;

--11
SELECT estante, SUM(ejemplares) AS total_ejemplares 
FROM libreria GROUP BY estante HAVING SUM(ejemplares) > 15 
ORDER BY total_ejemplares DESC;

--12
SELECT nivel, COUNT(*) AS alumnos_por_nivel 
FROM alum0405 GROUP BY nivel HAVING COUNT (*) > 3 
ORDER BY alumnos_por_nivel;

--13
SELECT dir, MAX(salario) AS salario_maximo
FROM emple GROUP BY dir HAVING MAX(salario) > 3500 
ORDER BY salario_maximo DESC;

SELECT loc, MAX(salario) AS salarioMaximo_localidad 
FROM depart JOIN emple ON depart.dept_no = emple.dept_no 
GROUP BY loc HAVING MAX(salario) > 3500 ORDER BY salarioMaximo_localidad DESC;

--14
SELECT oficio, COUNT(*) AS numEmpleados_oficio 
FROM emple GROUP BY oficio HAVING COUNT(*) > 2 
ORDER BY numEmpleados_oficio;

--15
SELECT tema, SUM(ejemplares) AS ejemplares_tema 
FROM libreria GROUP BY tema HAVING COUNT(*) > 25 
ORDER BY ejemplares_tema DESC;

--16
SELECT dept_no, dir, AVG(salario) AS salariopromedio_dept_loc
FROM emple GROUP BY dept_no, dir HAVING AVG(salario) > 2500 AND COUNT(*) > 2
ORDER BY salariopromedio_dept_loc DESC;

SELECT dnombre, loc, AVG(salario) AS salarioPromedio_dept_loc 
FROM depart JOIN emple ON depart.dept_no = emple.dept_no 
GROUP BY dnombre, loc HAVING AVG(salario) > 2500 AND COUNT(*) > 2
ORDER BY salarioPromedio_dept_loc DESC;

--17
SELECT oficio, dir, COUNT(*) AS numEmpleados FROM emple 
GROUP BY oficio, dir HAVING COUNT(*) > 1 AND MAX(salario) > 3000 
ORDER BY numEmpleados;

SELECT oficio, loc, COUNT(*) AS numEmpleados_oficio_localidad 
FROM emple JOIN depart ON depart.dept_no = emple.dept_no  
GROUP BY oficio, loc HAVING COUNT(*) > 1 AND MAX(salario) > 3000 
ORDER BY numEmpleados_oficio_localidad;

--18
SELECT estante, tema, SUM(ejemplares) AS totalEjemplares_estante_tema 
FROM libreria GROUP BY estante, tema HAVING SUM(ejemplares) > 10 AND SUM(ejemplares) <= 20 
ORDER BY totalEjemplares_estante_tema DESC;

--19
SELECT curso, nivel, clase, COUNT(*) AS alumnos_curso_nivel_clase  
FROM alum0405 GROUP BY curso, nivel, clase 
HAVING COUNT(*) > 2 AND SUM(faltas1+faltas2+faltas3) < 5
ORDER BY alumnos_curso_nivel_clase;

--20
SELECT dept_no, oficio, AVG(salario) AS salario_promedio
FROM emple GROUP BY dept_no, oficio 
HAVING COUNT(*) > 1 AND MAX(salario) > 3500 
ORDER BY salario_promedio DESC;


SELECT dnombre, oficio, AVG(salario) AS salarioProm_depart_oficio 
FROM depart JOIN emple ON depart.dept_no = emple.dept_no 
GROUP BY dnombre, oficio
HAVING COUNT(*) > 1 AND MAX(salario) > 3500 
ORDER BY salarioProm_depart_oficio DESC;
