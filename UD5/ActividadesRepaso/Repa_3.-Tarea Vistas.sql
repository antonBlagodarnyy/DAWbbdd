--1.Crea una vista que muestre el nombre del empleado, su salario y la fecha de alta.
SELECT * FROM EMPLE;

CREATE OR REPLACE VIEW vista1 (nombre,salario,fecha_alta)AS
SELECT apellido, salario,fecha_alt FROM EMPLE;

SELECT * from vista1;

--2.Crea una vista que muestre el nombre del empleado, su salario y la fecha de alta en el formato 'DD/MM/YYYY'. --Para la fecha con formato usar TO_CHAR().
SELECT * FROM EMPLE;

CREATE OR REPLACE VIEW vista2 (nombre,salario,fecha_alta)AS
SELECT apellido, salario,TO_CHAR(fecha_alt,'DD/MM/YYYY') FROM EMPLE;

SELECT * from vista2;

--3.Crea una vista que muestre el número de departamento, el nombre del departamento y la ubicación para los departamentos que tienen al menos un empleado.
SELECT * FROM EMPLE;
SELECT * FROM DEPART;

CREATE OR REPLACE VIEW vista3 (numero_departamento, nombre_departamento, ubicacion) AS
SELECT dept_no, dnombre, loc FROM DEPART
WHERE dept_no IN (select dept_no FROM EMPLE);

SELECT * from vista3;

--4.Crea una vista que muestre el nombre y el apellido de los alumnos junto con sus faltas totales (suma de faltas1, faltas2 y faltas3). --TABLA ALUM0405.
SELECT * FROM ALUM0405;

CREATE OR REPLACE VIEW vista4 (nombre, apellidos, faltas_totales) AS
SELECT nombre, apellidos, faltas1 + faltas2 + faltas3 FROM  ALUM0405;

SELECT * from vista4;

--5.Crea una vista que muestre el nombre del alumno y su promedio de notas (promedio de nota1, nota2 y nota3), excluyendo aquellos registros donde al menos una de las notas sea NULL.
SELECT * FROM NOTAS_ALUMNOS;

CREATE OR REPLACE VIEW vista5 (nombre, promedio_notas) AS
SELECT nombre_alumno, ((nota1+nota2+nota3)/3)AS MEDIA FROM NOTAS_ALUMNOS 
WHERE nota1 IS NOT NULL AND nota2 IS NOT NULL AND nota3 IS NOT NULL;

SELECT * from vista5;

--6.Crea una vista que muestre el tema de los libros junto con el número total de ejemplares disponibles en la librería.
SELECT * FROM LIBRERIA;

CREATE OR REPLACE VIEW vista6 (tema, ejemplares) AS
SELECT tema, ejemplares FROM LIBRERIA;

SELECT * from vista6;

--7.A partir de las tablas EMPLE y DEPART creamos una vista que contenga las columnas EMP_NO, APELLIDO, DEPT_NO y DNOMBRE.
SELECT * FROM EMPLE;
SELECT * FROM DEPART;

CREATE OR REPLACE VIEW vista7 (emp_no, apellido, dept_no, dnombre) AS
SELECT e.emp_no, e.apellido, d.dept_no, d.dnombre FROM EMPLE E
JOIN DEPART D
ON D.DEPT_NO = E.DEPT_NO;

SELECT * from vista7;

--8.Creamos una vista llamada PAGOS con las filas de EMPLE cuyo departamento sea el 10. Sus columnas se llamaran NOMBRE, SAL_MES, SAL_AN y DEPT_NO. 
--El NOMBRE es la columna APELLIDO, a la que aplicaremos la función INITCAP(). 
--SAL_MES es el SALARIO. SAL_AN es el SALARIO*12

SELECT * FROM EMPLE;

CREATE OR REPLACE VIEW PAGOS (NOMBRE, SAL_MES, SAL_AN, DEPT_NO) AS
SELECT INITCAP(apellido), salario, salario*12, dept_no FROM EMPLE; 

SELECT * FROM PAGOS;