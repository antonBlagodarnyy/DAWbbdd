REM ******** TABLA DEPART Y EMPLE: ***********

DROP TABLE DEPART cascade constraints; 

CREATE TABLE DEPART (
 DEPT_NO  NUMBER(2) CONSTRAINT pk_depart PRIMARY KEY,
 DNOMBRE  VARCHAR2(14), 
 LOC      VARCHAR2(14) ) ;

INSERT INTO DEPART VALUES (10,'CONTABILIDAD','SEVILLA');
INSERT INTO DEPART VALUES (20,'INVESTIGACION','MADRID');
INSERT INTO DEPART VALUES (30,'VENTAS','BARCELONA');
INSERT INTO DEPART VALUES (40,'PRODUCCION','BILBAO');
COMMIT;

ALTER SESSION SET NLS_DATE_FORMAT='DD/MM/YYYY';

DROP TABLE EMPLE cascade constraints; 

CREATE TABLE EMPLE (
 EMP_NO    NUMBER(4) CONSTRAINT pk_emple PRIMARY KEY,
 APELLIDO  VARCHAR2(10)  ,
 OFICIO    VARCHAR2(10)  ,
 DIR       NUMBER(4) ,
 FECHA_ALT DATE      ,
 SALARIO   NUMBER(7),
 COMISION  NUMBER(7),
 DEPT_NO   NUMBER(2) NOT NULL,
 CONSTRAINT fk_emple_depart FOREIGN KEY (dept_no) REFERENCES depart (dept_no)
) ;

INSERT INTO EMPLE VALUES (7369,'SANCHEZ','EMPLEADO',7902,'17/12/1990',1040,NULL,20);
INSERT INTO EMPLE VALUES (7499,'ARROYO','VENDEDOR',7698,'20/02/1990',1500,390,30);
INSERT INTO EMPLE VALUES (7521,'SALA','VENDEDOR',7698,'22/02/1991',1625,650,30);
INSERT INTO EMPLE VALUES (7566,'JIMENEZ','DIRECTOR',7839,'02/04/1991',2900,NULL,20);
INSERT INTO EMPLE VALUES (7654,'MARTIN','VENDEDOR',7698,'29/09/1991',1600,1020,30);
INSERT INTO EMPLE VALUES (7698,'NEGRO','DIRECTOR',7839,'01/05/1991',3005,NULL,30);
INSERT INTO EMPLE VALUES (7782,'CEREZO','DIRECTOR',7839,'09/06/1991',2885,NULL,10);
INSERT INTO EMPLE VALUES (7788,'GIL','ANALISTA',7566,'09/11/1991',3000,NULL,20);
INSERT INTO EMPLE VALUES (7839,'REY','PRESIDENTE',NULL,'17/11/1991',4100,NULL,10);
INSERT INTO EMPLE VALUES (7844,'TOVAR','VENDEDOR',7698,'08/09/1991',1350,0,30);
INSERT INTO EMPLE VALUES (7876,'ALONSO','EMPLEADO',7788,'23/09/1991',1430,NULL,20);
INSERT INTO EMPLE VALUES (7900,'JIMENO','EMPLEADO',7698,'03/12/1991',1335,NULL,30);
INSERT INTO EMPLE VALUES (7902,'FERNANDEZ','ANALISTA',7566,'03/12/1991',3000,NULL,20);
INSERT INTO EMPLE VALUES (7934,'MU?OZ','EMPLEADO',7782,'23/01/1992',1690,NULL,10);
COMMIT;

REM ***TABLA ALUM0405***************

Drop table ALUM0405;
create table ALUM0405(
DNI	VARCHAR2(10) CONSTRAINT pk_aul0405 PRIMARY KEY,
NOMBRE	VARCHAR2(15) NOT NULL,
APELLIDOS	VARCHAR2(20) NOT NULL,
FECHA_NAC	DATE,
DIRECCION	VARCHAR2(20),
POBLACION	VARCHAR2(20),
PROVINCIA	VARCHAR2(20),
CURSO	NUMBER(2)  NOT NULL,
NIVEL	VARCHAR2(10)  NOT NULL,
CLASE	CHAR(1)  NOT NULL,
FALTAS1	NUMBER(2),
FALTAS2	NUMBER(2),
FALTAS3	NUMBER(2)
);

INSERT INTO ALUM0405 VALUES ('34448974N', 'CONCHA', 'ESTRUCH VIDAL',TO_DATE('10/11/1985'),
'C/ MEDICO FELIX, 12','BERROCALEJO', 'CACERES',2,'DAI','A',0,0,0);
INSERT INTO ALUM0405 VALUES ('34448999N', 'DORA', 'MARTIN BRE?A',TO_DATE('10/11/1994'),
'C/ MEDICO FELIX, 10','BERROCALEJO', 'CACERES',1,'ESO','C',0,0,0);
 COMMIT;

REM ******** TABLA NOTAS_ALUMNOS: ***********

Drop table notas_alumnos cascade constraints;
create table notas_alumnos(
   NOMBRE_ALUMNO VARCHAR2(25) CONSTRAINT pk_notas_alumnos PRIMARY KEY,
   nota1 number(2),
   nota2 number(2),
   nota3 number(2)
 ) ;

insert into NOTAS_ALUMNOS VALUES ('Alcalde Garc?a, M. Luisa',5,5,5);
insert into NOTAS_ALUMNOS VALUES ('Benito Mart?n, Luis',7,6,8);
insert into NOTAS_ALUMNOS VALUES ('Casas Mart?nez, Manuel',7,5,5);
insert into NOTAS_ALUMNOS VALUES ('Corregidor S?nchez, Ana',6,9,8);
insert into NOTAS_ALUMNOS VALUES ('D?az S?nchez, Maria',NULL,NULL,7);
COMMIT;

REM ******** TABLA LIBRERIA: *************

Drop table LIBRERIA cascade constraints;

create table LIBRERIA(
    TEMA CHAR(15) CONSTRAINT pk_libreria PRIMARY KEY,
    ESTANTE CHAR(1),
    EJEMPLARES NUMBER(2)
 );

INSERT INTO LIBRERIA VALUES ('INFORMATICA', 'A',15);
INSERT INTO LIBRERIA VALUES ('ECONOMIA',    'A',10);
INSERT INTO LIBRERIA VALUES ('DEPORTES',    'B',8);
INSERT INTO LIBRERIA VALUES ('FILOSOFIA',   'C',7);
INSERT INTO LIBRERIA VALUES ('DIBUJO',      'C',10);
INSERT INTO LIBRERIA VALUES ('MEDICINA',    'C',16);
INSERT INTO LIBRERIA VALUES ('BIOLOGIA',    'A',11);
INSERT INTO LIBRERIA VALUES ('GEOLOGIA',    'D',7);
INSERT INTO LIBRERIA VALUES ('SOCIEDAD',    'D',9);
INSERT INTO LIBRERIA VALUES ('LABORES',     'B',20);
INSERT INTO LIBRERIA VALUES ('JARDINERIA',    'E',6);
COMMIT;

REM ******** TABLAS ALUMNOS, ASIGNATURAS, NOTAS: ***********

DROP TABLE ALUMNOS cascade constraints;
CREATE TABLE ALUMNOS(
  DNI VARCHAR2(10) CONSTRAINT pk_alumnos PRIMARY KEY,
  APENOM VARCHAR2(30),
  DIREC VARCHAR2(30),
  POBLA  VARCHAR2(15),
  TELEF  VARCHAR2(10)  
) ;

DROP TABLE ASIGNATURAS cascade constraints;
CREATE TABLE ASIGNATURAS(
  COD NUMBER(2) CONSTRAINT pk_asignaturas PRIMARY KEY,
  NOMBRE VARCHAR2(25)
) ;

DROP TABLE NOTAS cascade constraints;
CREATE TABLE NOTAS(
  DNI VARCHAR2(10),
  COD NUMBER(2),
  NOTA NUMBER(2),
  CONSTRAINT pk_notas PRIMARY KEY (dni, cod),
  CONSTRAINT fk_notas_alumno FOREIGN KEY (dni) REFERENCES alumnos (dni),
  CONSTRAINT fk_notas_asig FOREIGN KEY (cod) REFERENCES asignaturas (cod)
);

INSERT INTO ASIGNATURAS VALUES (1,'Prog. Leng. Estr.');
INSERT INTO ASIGNATURAS VALUES (2,'Sist. Inform?ticos');
INSERT INTO ASIGNATURAS VALUES (3,'An?lisis');
INSERT INTO ASIGNATURAS VALUES (4,'FOL');
INSERT INTO ASIGNATURAS VALUES (5,'RET');
INSERT INTO ASIGNATURAS VALUES (6,'Entornos Gr?ficos');
INSERT INTO ASIGNATURAS VALUES (7,'Aplic. Entornos 4?Gen');
INSERT INTO ASIGNATURAS VALUES (8,'Idioma');


INSERT INTO ALUMNOS VALUES
('12344345','Alcalde Garc?a, Elena', 'C/Las Matas, 24','Madrid','917766545');
INSERT INTO ALUMNOS VALUES
('4448242','Cerrato Vela, Luis', 'C/Mina 28 - 3A', 'Madrid','916566545');
INSERT INTO ALUMNOS VALUES
('56882942','D?az Fern?ndez, Mar?a', 'C/Luis Vives 25', 'M?stoles','915577545');

INSERT INTO NOTAS VALUES('12344345', 1,6);
INSERT INTO NOTAS VALUES('12344345', 2,5);
INSERT INTO NOTAS VALUES('12344345', 3,6);

INSERT INTO NOTAS VALUES('4448242', 4,6);
INSERT INTO NOTAS VALUES('4448242', 5,8);
INSERT INTO NOTAS VALUES('4448242', 6,4);
INSERT INTO NOTAS VALUES('4448242', 7,5);

INSERT INTO NOTAS VALUES('56882942', 4,8);
INSERT INTO NOTAS VALUES('56882942', 5,7);
INSERT INTO NOTAS VALUES('56882942', 6,8);
INSERT INTO NOTAS VALUES('56882942', 7,9);

COMMIT;
REM ******** FIN ***********************
--1ºParte
--2.- Muestra los datos (apellido, oficio, salario y fecha de alta) de aquellos empleados que desempeñen el mismo oficio que 
--‘JIMENEZ’ o que tengan un salario mayor o igual que ‘FERNANDEZ’.
SELECT * FROM EMPLE;

SELECT apellido, oficio, salario, fecha_alt FROM EMPLE
WHERE oficio = (SELECT oficio FROM EMPLE WHERE apellido='JIMENEZ')
OR
salario >= (SELECT salario FROM EMPLE WHERE apellido='FERNANDEZ');

--3.- Presenta los apellidos y oficios de los empleados que tienen el mismo trabajo que ‘JIMENEZ’.
SELECT * FROM EMPLE;

SELECT apellido, oficio FROM EMPLE
WHERE oficio= (SELECT oficio FROM EMPLE WHERE apellido='JIMENEZ');

--4.- Muestra en pantalla el APELLIDO, OFICIO y SALARIO de los empleados del departamento de ‘FERNANDEZ’ que tengan su mismo salario.
SELECT * FROM EMPLE;

SELECT apellido, oficio, salario FROM EMPLE 
WHERE dept_no = (SELECT dept_no FROM EMPLE WHERE apellido='FERNANDEZ')
AND salario = (SELECT salario FROM EMPLE WHERE apellido='FERNANDEZ');

--5.- Visualiza los nombres de alumnos que tengan una nota entre 7 y 8 en la asignatura 
--de ‘FOL’ 
SELECT * FROM ALUMNOS;
SELECT * FROM ASIGNATURAS;
SELECT * FROM NOTAS;

SELECT AL.apenom FROM ALUMNOS AL
JOIN NOTAS N
ON al.dni = n.dni
JOIN ASIGNATURAS ASI
ON ASI.cod = n.cod
WHERE nota BETWEEN 7 AND 8 AND
ASI.NOMBRE ='FOL';

--6.- Visualiza los nombres de las asignaturas que no tengan suspensos.
SELECT * FROM NOTAS;
SELECT * FROM ASIGNATURAS;

SELECT DISTINCT nombre FROM ASIGNATURAS ASI
JOIN NOTAS N
ON ASI.COD = N.COD
WHERE asi.cod NOT IN 
(SELECT cod FROM NOTAS WHERE nota < 5);

--7.- Selecciona el apellido, el oficio y la localidad de los departamentos de aquellos empleados cuyo oficio sea “ANALISTA”
SELECT * FROM EMPLE;
SELECT * FROM DEPART;

SELECT e.apellido, e.oficio, d.loc FROM EMPLE E
JOIN DEPART D
ON E.DEPT_NO = D.DEPT_NO
WHERE e.oficio='ANALISTA';

--8.- Obtén los datos de los empleados cuyo director (columna DIR de la tabla EMPLE) sea “CEREZO”
SELECT * FROM EMPLE;
SELECT * FROM DEPART;

SELECT * FROM EMPLE 
WHERE dir = (SELECT emp_no FROM EMPLE WHERE apellido='cerezo');

--9.- Obtén los datos de los empleados del departamento de “VENTAS” 
SELECT * FROM EMPLE;
SELECT * FROM DEPART;

SELECT * FROM EMPLE E
JOIN DEPART D
ON E.dept_no = D.dept_no
WHERE E.DEPT_NO=(SELECT dept_no FROM DEPART WHERE dnombre='VENTAS');

--10.- Obtén los datos de los departamentos que NO tengan empleados
SELECT * FROM EMPLE;
SELECT * FROM DEPART;

SELECT * FROM DEPART 
WHERE dept_no NOT IN (SELECT dept_no FROM emple);

--11. Obtén los datos de los departamentos que tengan empleados
SELECT * FROM EMPLE;
SELECT * FROM DEPART;

SELECT * FROM DEPART 
WHERE dept_no IN (SELECT dept_no FROM emple);

--12.- Obtén el apellido y el salario de los empleados que superen todos los salarios de los empleados del departamento 20
SELECT * FROM EMPLE;
SELECT * FROM DEPART;

SELECT apellido, salario FROM EMPLE 
WHERE salario > (SELECT MAX(salario) FROM EMPLE WHERE dept_no = 20);

--15.- Visualizar con una sola orden SELECT todos los temas de LIBRERÍA cuyo número de ejemplares sea inferior a los que hay en “MEDICINA”
SELECT * FROM LIBRERIA;

SELECT tema FROM LIBRERIA 
WHERE SUM(ejemplares) <   
--17.- Visualiza todas las asignaturas que contengan tres letras “o” en su interior y tengan alumnos matriculados de “Madrid”

--18.- Visualiza los nombres de los alumnos de “Madrid” que tengan algunas asignatura suspensa

--19.- Muestra los nombres de los alumnos que tengan la misma nota que tiene “Díaz Fernandez, Maria” en “FOL” en alguna asignatura.

--20.- Obtén los datos de las asignaturas que no tengan alumnos

--21.- Obtén el nombre y apellido de los alumnos que tengan nota en la asignatura con código 1. 22.- Obtén el nombre y apellido de los alumnos que no tengan nota en la asignatura con
--código 1.

--2ºParte
--1.- A partir de la tabla ALUM0405:
SELECT * FROM ALUM0405;

--a)Obtén todos los datos del alumno
SELECT * FROM ALUM0405;

--b)Obtén los siguientes datos del alumno: dni, nombre, apellidos, curso, nivel y clase
SELECT dni, nombre, apellidos, curso, nivel , clase FROM ALUM0405;

--c)Obtén todos los datos del alumno cuya población sea ‘GUADALAJARA’.
SELECT * FROM ALUM0405
WHERE poblacion = 'GUADALAJARA';

--d)Obtén el nombre y apellidos de todos los alumnos cuya población sea ‘GUADALAJARA’
SELECT nombre,apellidos FROM ALUM0405
WHERE poblacion = 'GUADALAJARA';

--e)Consulta el dni, nombre, apellidos, curso, nivel y clase de todos los alumnos ordenados por apellido y nombre ascendente.
SELECT  dni, nombre, apellidos, curso, nivel , clase FROM ALUM0405
ORDER BY apellidos,nombre ASC;

--13.- Visualiza el tema, estante y ejemplares de las filas de LIBRERÍA con ejemplares comprendidos entre 8 y 15
SELECT * FROM LIBRERIA;

SELECT tema, estante , ejemplares FROM LIBRERIA
WHERE ejemplares BETWEEN 8 AND 15;

--14.- Visualiza las columnas TEMA, ESTANTE y EJEMPLARES de las filas cuyo ESTANTE no esté comprendido entre la “8” y la “0”
SELECT * FROM LIBRERIA;

SELECT tema, estante , ejemplares FROM LIBRERIA
WHERE estante NOT IN (SELECT estante FROM LIBRERIA WHERE ROWNUM <=8);

--16.- Visualiza los temas de LIBRERÍA cuyo número de ejemplares no esté entre 15 y 20, ambos incluidos.
SELECT * FROM LIBRERIA;

SELECT tema from LIBRERIA 
where ejemplares not between 15 and 20;

--1.Calcula el salario promedio por departamento y muestra solo aquellos departamentos cuyo salario promedio sea superior a 2500.
--Ordena los resultados por salario promedio en orden descendente.
SELECT * FROM DEPART D
LEFT JOIN EMPLE E 
ON E.DEPT_NO = D.DEPT_NO;

SELECT d.dnombre, AVG(salario) AS salario_promedio FROM DEPART D
LEFT JOIN EMPLE E 
ON E.DEPT_NO = D.DEPT_NO
GROUP BY d.dnombre
HAVING AVG(salario) > 2500
ORDER BY AVG(salario) DESC;

--2.Encuentra el número de empleados por cada oficio y muestra solo aquellos oficios
--que tengan más de 3 empleados. Ordena los resultados por el número de empleados en orden ascendente.
SELECT * FROM EMPLE;

SELECT oficio, COUNT(oficio) as numero_de_empleados_por_oficio FROM EMPLE
GROUP BY oficio
HAVING COUNT(oficio)>3
ORDER BY COUNT(oficio) ASC;

--3.Obtén el número total de ejemplares por estante y muestra solo aquellos estantes que tengan más de 10 ejemplares en total.
--Ordena los resultados por el número total de ejemplares en orden descendente.
SELECT * FROM LIBRERIA;

SELECT estante, SUM(ejemplares) FROM LIBRERIA
GROUP BY estante
HAVING SUM(ejemplares)>10
ORDER BY  SUM(ejemplares) DESC;

--4.Encuentra el número de alumnos por curso y nivel y muestra solo aquellos cursos
--y niveles que tengan más de 5 alumnos. Ordena los resultados por el número de alumnos en orden ascendente.
SELECT * FROM ALUM0405;

SELECT curso, nivel, COUNT(*) as numero_alumnos_por_curso_y_nivel FROM ALUM0405
GROUP BY curso, nivel
HAVING COUNT(*) > 5
ORDER BY COUNT(*) ASC;

--5.Calcula el salario máximo por departamento y muestra solo aquellos departamentos 
--cuyo salario máximo sea superior a 3000. 
--Ordena los resultados por salario máximo en orden descendente.
SELECT * FROM DEPART;
SELECT * FROM EMPLE;

SELECT d.dnombre, MAX(salario) AS salario_maximo_por_departamento   FROM DEPART D
LEFT JOIN EMPLE E 
ON E.DEPT_NO = D.DEPT_NO
GROUP BY d.dnombre
HAVING MAX(salario) > 3000
ORDER BY MAX(salario) DESC ;

--6.Encuentra el número de empleados por localidad y muestra solo 
--aquellas localidades que tengan más de 2 empleados. Ordena los resultados por el número de empleados en orden ascendente.
SELECT * FROM EMPLE;
SELECT * FROM DEPART;

SELECT loc, COUNT(E.EMP_NO) AS numero_empleados FROM DEPART D
LEFT JOIN EMPLE E 
ON E.DEPT_NO = D.DEPT_NO
GROUP BY LOC
HAVING COUNT(E.EMP_NO)>2
ORDER BY COUNT(E.EMP_NO) ASC;

--7.Obtén el número total de ejemplares por tema y muestra solo aquellos temas que tengan más de 20 ejemplares en total.
--Ordena los resultados por el número total de ejemplares en orden descendente.
SELECT * FROM LIBRERIA;

SELECT tema, SUM(ejemplares) FROM LIBRERIA
GROUP BY tema
HAVING SUM(ejemplares)>20
ORDER BY SUM(ejemplares) DESC;

--8.Encuentra el número de alumnos por clase y muestra solo aquellas clases que tengan más de 4 alumnos. 
--Ordena los resultados por el número de alumnos en orden ascendente.
SELECT * FROM ALUM0405;

SELECT clase, COUNT(*) FROM ALUM0405
GROUP BY clase
HAVING COUNT(*)>4
ORDER BY COUNT(*) ASC;

--9.Calcula el salario promedio por oficio y muestra solo aquellos oficios cuyo salario
--promedio sea superior a 2000. Ordena los resultados por salario promedio en orden descendente.
SELECT * FROM EMPLE;

SELECT oficio, AVG (salario) FROM EMPLE
GROUP BY oficio 
having AVG (salario) >2000
order by AVG(salario)DESC;

--10.Encuentra el número de empleados por departamento y muestra solo aquellos departamentos que tengan más de 3 empleados.
--Ordena los resultados por el número de empleados en orden ascendente.
SELECT * FROM DEPART;
SELECT * FROM EMPLE;

SELECT d.dnombre, count(e.emp_no) FROM DEPART D
JOIN EMPLE E
ON E.DEPT_NO = D.DEPT_NO
GROUP BY d.dnombre
HAVING COUNT(e.emp_no) > 3;

--11.Obtén el número total de ejemplares por estante y muestra solo aquellos estantes que tengan más de 15 ejemplares en total.
--Ordena los resultados por el número total de ejemplares en orden descendente.
SELECT * FROM LIBRERIA;

SELECT estante, SUM(ejemplares) FROM LIBRERIA
GROUP BY estante
HAVING SUM(ejemplares)>15
ORDER BY  SUM(ejemplares) DESC;

--12.Encuentra el número de alumnos por nivel y muestra solo aquellos niveles que tengan más de 3 alumnos. 
--Ordena los resultados por el número de alumnos en orden ascendente.
SELECT * FROM ALUM0405;

SELECT nivel, count(*) as numero_alumnos FROM ALUM0405
GROUP BY nivel
HAVING count(*)>3;

--13.Calcula el salario máximo por localidad y muestra solo aquellas localidades cuyo salario máximo sea superior a 3500.
--Ordena los resultados por salario máximo en orden descendente.
select * from depart;
select * from emple;

SELECT LOC, MAX(SALARIO) FROM DEPART D
JOIN EMPLE E
ON E.DEPT_NO = D.DEPT_NO
GROUP BY LOC
HAVING MAX(SALARIO) > 3500;

--14.Encuentra el número de empleados por oficio y muestra solo aquellos oficios que tengan más de 2 empleados. 
--Ordena los resultados por el número de empleados en orden ascendente.
select * from depart;
select * from emple;

SELECT OFICIO, COUNT(*) AS numero_empleados FROM EMPLE
GROUP BY OFICIO
HAVING COUNT(*) >2;

--15.Obtén el número total de ejemplares por tema y muestra solo aquellos temas que tengan más de 25 ejemplares en total.
--Ordena los resultados por el número total de ejemplares en orden descendente.
SELECT * FROM LIBRERIA;

SELECT tema, SUM(EJEMPLARES) AS ejemplares_totales FROM LIBRERIA
GROUP BY tema
ORDER BY SUM(EJEMPLARES) DESC;

--16.Calcula el salario promedio por departamento y localidad, y muestra solo aquellos departamentos
--y localidades cuyo salario promedio sea superior a 2500 y tengan más de 2 empleados. 
--Ordena los resultados por salario promedio en orden descendente.
select * from depart;
select * from emple;

SELECT d.dnombre, d.loc, AVG(SALARIO) FROM DEPART D
JOIN EMPLE E
ON E.DEPT_NO = D.DEPT_NO
GROUP BY d.dnombre,d.loc
HAVING AVG(SALARIO) > 2500 AND COUNT(*)>2
ORDER BY AVG(salario)DESC;

--17.Encuentra el número de empleados por oficio y localidad, y muestra solo aquellos oficios 
--y localidades que tengan más de 1 empleado y cuyo salario máximo sea superior a 3000. 
--Ordena los resultados por el número de empleados en orden ascendente.

SELECT e.oficio, d.loc,COUNT(*) as numero_empleados FROM DEPART D
JOIN EMPLE E
ON E.DEPT_NO = D.DEPT_NO
GROUP BY e.oficio,d.loc
HAVING COUNT(*)>1 AND MAX(e.salario)>3000
ORDER BY COUNT(*)ASC;

--18.Obtén el número total de ejemplares por estante y tema, y muestra solo aquellos estantes y temas 
--que tengan más de 10 ejemplares en total y cuya cantidad de ejemplares no supere los 20. 
--Ordena los resultados por el número total de ejemplares en orden descendente.
SELECT * FROM LIBRERIA;

SELECT estante, tema, SUM(ejemplares) as numero_ejemplares FROM libreria
GROUP BY estante, tema 
HAVING SUM(ejemplares) BETWEEN 10 AND 20
ORDER BY SUM(ejemplares) DESC;


--19.Encuentra el número de alumnos por curso, nivel y clase, y muestra solo aquellos cursos, niveles y clases 
--que tengan más de 2 alumnos y cuyo número de faltas sea inferior a 5. 
--Ordena los resultados por el número de alumnos en orden ascendente.
SELECT * FROM ALUM0405;

SELECT curso, nivel, clase, COUNT(*) as numero_alumnos FROM ALUM0405
GROUP BY curso,nivel,clase
HAVING COUNT(*)>2 AND SUM(FALTAS1+FALTAS2+FALTAS3)<5
ORDER BY COUNT(*)ASC;

--20.Calcula el salario promedio por departamento y oficio, y muestra solo aquellos. 
--departamentos y oficios que tengan más de 1 empleado y cuyo salario máximo sea superior a 3500.
--Ordena los resultados por salario promedio en orden descendente.
SELECT e.oficio, d.DEPT_NO, AVG(salario) as salario_promedio FROM DEPART D
JOIN EMPLE E
ON E.DEPT_NO = D.DEPT_NO
GROUP BY e.oficio,d.DEPT_NO
HAVING COUNT(*)>1 AND MAX(e.salario)>3500
ORDER BY AVG(salario)DESC;

--21.Obtén el nombre y apellido de los alumnos que tengan nota en la asignatura con código 1.
SELECT * FROM ALUMNOS;
SELECT * FROM NOTAS;

SELECT DISTINCT A.apenom FROM ALUMNOS A
JOIN NOTAS N
ON N.dni=A.dni
WHERE A.dni IN (SELECT dni FROM NOTAS WHERE cod=1);

--22.- Obtén el nombre y apellido de los alumnos que no tengan nota en la asignatura con código 1.
SELECT * FROM ALUMNOS;
SELECT * FROM NOTAS;

SELECT DISTINCT A.apenom FROM ALUMNOS A
JOIN NOTAS N
ON N.dni=A.dni
WHERE A.dni NOT IN (SELECT dni FROM NOTAS WHERE cod=1);