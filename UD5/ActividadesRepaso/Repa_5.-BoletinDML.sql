SELECT * FROM EMPLE;

--1)1.- Consideremos la tabla PROFESORES(Tabla3.sql), cuya descripción y contenido son:
--1.1)Damos de alta a la siguiente profesora con los apellidos y nombre
--?Quiroga Mart?n. A.?, especialidad ?INFORM?TICA?, y c?digo de centro 46.
SELECT * FROM PROFESORES;

INSERT INTO PROFESORES (apellidos, especialidad, cod_centro)
VALUES ('Quiroga Mart?n. A.','INFORM?TICA','46');

--2)Disponemos de la tabla EMPLE30, cuya descripci?n es la misma que la de
--la tabla EMPLE. Inserta los datos de los empleados del departamento 30. 
SELECT * FROM EMPLE;
CREATE TABLE EMPLE30 AS
SELECT * FROM EMPLE;
SELECT * FROM EMPLE30;

INSERT INTO EMPLE30
SELECT * FROM (SELECT * FROM EMPLE WHERE dept_no=30);

--3)Disponemos de las tabla NOMBRES(Tablas2.sql), que tienen la siguiente descripción.
--3.1.Insertamos en la tabla NOMBRES, en la columna NOMBRE, el APE
SELECT * FROM NOMBRES;
SELECT * FROM EMPLE;

INSERT INTO NOMBRES(nombre)
SELECT  APELLIDO  FROM EMPLE WHERE DEPT_NO=20;

--4)Inserta un empleado de apellido ‘GARCÍA’ con número de empleado 1111 en la tabla EMPLE, en el departamento con mayor número de empleados. La fecha de alta será la actual; inventarse el resto de valores.
INSERT INTO EMPLE (EMP_NO,apellido,oficio,dir,fecha_alt,salario
,comision,dept_no)
SELECT '1111','GARCIA','VENDEDOR',7839,SYSDATE,1300,400,10
FROM (SELECT DEPT_NO
FROM EMPLE
GROUP BY DEPT_NO
ORDER BY COUNT (*) DESC) WHERE ROWNUM<=1;

--5)Inserta un empleado de apellido ‘QUIROGA’, con número de empleado 1112, en la tabla EMPLE. Los restantes datos del nuevo empleado serán los mismos que los de ‘GIL’ y la fecha de alta será la fecha actual.
SELECT * FROM EMPLE;

INSERT INTO EMPLE 
SELECT '1112',
'QUIROGA',
(SELECT oficio FROM EMPLE WHERE apellido = 'GIL'),
(SELECT dir FROM EMPLE WHERE apellido = 'GIL'),
SYSDATE,
(SELECT salario FROM EMPLE WHERE apellido = 'GIL'),
(SELECT comision FROM EMPLE WHERE apellido = 'GIL'),
(SELECT dept_no FROM EMPLE WHERE apellido = 'GIL')
FROM EMPLE;

--6)Sea la tabla CENTROS(Tabla3.sql), cambiamos la dirección del COD_CENTRO 22 a ‘C/Pilón 13’ y el número de plazas a 295.
SELECT * FROM CENTROS;

UPDATE CENTROS
SET direccion = 'C/Pilon 23', num_plazas = 295
WHERE COD_CENTRO = 22; 

--7)En la tabla CENTROS la siguiente orden UPDATE igualará 
--la dirección y el número de plazas del código de centro 10 
--a los valores de las columnas correspondientes que están
--almacenadas para el código de centro 50.
SELECT * FROM CENTROS;

UPDATE CENTROS
SET (tipo_centro, nombre, direccion, telefono, num_plazas) = (SELECT tipo_centro, nombre, direccion, telefono, num_plazas FROM CENTROS WHERE cod_centro=50)
WHERE cod_centro=50;

--7.1.- A partir de la tabla EMPLE, cambia el salario a la mitad y la comisión a 0, 
--a aquellos empleados que pertenezcan al departamento con mayor número de empleados.
SELECT * FROM EMPLE;

UPDATE EMPLE
SET salario=salario/ 2,
    comision=0
WHERE DEPT_NO=(
SELECT DEPT_NO FROM
(SELECT DEPT_NO FROM EMPLE GROUP BY DEPT_NO ORDER BY COUNT(*) DESC)
WHERE ROWNUM=1);

--7.2.- Para todos los empleados de la tabla EMPLE y del departamento de ‘CONTABILIDAD’,
--cambiamos su salario al doble del salario de ‘SÁNCHEZ’ y su apellido a minúscula.
SELECT * FROM EMPLE;

UPDATE EMPLE 
SET salario = (SELECT salario FROM EMPLE WHERE apellido='SANCHEZ')*2,
    apellido= LOWER(apellido);

--8.- Borramos el cod_centro 50 de la tabla CENTROS.
DELETE FROM CENTROS
WHERE COD_CENTRO=50;

--8.1.- Borramos todas la filas de la table centros
DELETE FROM CENTROS;

--8.2.- Borramos todas las filas de la tabla LIBRERIAS cuyos
--EJEMPLARES no superen la media de ejemplares en su ESTANTE.
SELECT * FROM LIBRERIA;

DELETE FROM LIBRERIA 
    WHERE ejemplares < (SELECT AVG(ejemplares) FROM LIBRERIA);
    
--8.3.- Borramos los departamentos de la tabla 
--DEPART con menos de cuatro empleados.
SELECT * FROM DEPART;
SELECT * FROM EMPLE;

SELECT * FROM DEPART D
JOIN EMPLE E
ON E.DEPT_NO=D.DEPT_NO;

DELETE FROM DEPART
WHERE (SELECT COUNT(*) AS numero_empleados FROM EMPLE)<4;
