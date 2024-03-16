--1.- Funciones aritm?ticas de valores simples:

--ABS(n): obt?n el valor absoluto del SALARIO ? 1000 para todas las filas de la tabla EMPLE
SELECT apellido, salario, ABS(salario-1000) FROM emple;
SELECT apellido, salario, ABS(salario+500) FROM emple;
--Devuelve una operacion aritmetica
SELECT apellido, salario, ABS(salario-2000) FROM emple;
SELECT apellido, salario, ABS(salario+700) FROM emple;

--CEIL(n) Prueba con n?meros positivos y negativos
SELECT CEIL(20.3), CEIL(16), CEIL(-20.3), CEIL(-16) FROM DUAL;
SELECT CEIL(20.8), CEIL(16), CEIL(-20.3), CEIL(-16.2) FROM DUAL;
--Trunca el numero hacia el entero mas cercano
SELECT CEIL(14.2), CEIL(20), CEIL(-11.1), CEIL(-12) FROM DUAL;
SELECT CEIL(14.9), CEIL(21), CEIL(-9.2), CEIL(-12.2) FROM DUAL;

--FLOOR(n) Prueba con n?meros positivos y negativos.
SELECT FLOOR(20.3), FLOOR(16), FLOOR(-20.3), FLOOR(-16) FROM DUAL;
SELECT FLOOR(20.8), FLOOR(16), FLOOR(-20.3), FLOOR(-16.2) FROM DUAL;
--Trunca hacia el num mas cercano al 0
SELECT FLOOR(40.1), FLOOR(20), FLOOR(-30.2), FLOOR(-14) FROM DUAL;
SELECT FLOOR(40.9), FLOOR(20), FLOOR(-30.1), FLOOR(-14.2) FROM DUAL;

--MOD(m,n) Prueba con n?meros positivos y negativos.
SELECT MOD(11,4), MOD(10,-15), MOD(-10,-3), MOD(10.4,4.5) FROM DUAL;
--devuelve el modulo/resto
--el signo depende del primero
SELECT MOD(16,5), MOD(20,-6), MOD(-30,-14), MOD(20.7,5.5) FROM DUAL;

--POWER(m, exponente) Prueba con n?meros positivos y negativos;
SELECT POWER(2,4), POWER(2,-4), POWER(3.5,2.4), POWER(4.5,2) FROM DUAL;
--Eleva al exponente
SELECT POWER(3,2), POWER(4,-7), POWER(4.6,3.4), POWER(5.5,2) FROM DUAL;

--ROUND(n?mero[,m]) Prueba con redondeos positivos y luego negativos:
SELECT ROUND(1.56,1), ROUND(1.56), ROUND(1.2234,2), ROUND(1.2676,3)  FROM DUAL;
--redondea el positivo, el segundo num. es la cant. de decimales que deja. 
--Ademas redonde hacia arriba o hacia abajo en funcion del mas cercano.
SELECT ROUND(2.2,1), ROUND(4.1234), ROUND(2.234,2), ROUND(8.9832,3)  FROM DUAL;

SELECT ROUND(145.5,-1), ROUND(145.5,-2), ROUND(145,-3), ROUND(141,-1), ROUND(145,-1)  FROM DUAL;
--con num. negativos redondea la parte del entero y pasa de decimales
SELECT ROUND(163.21,-1), ROUND(1458.5,-2), ROUND(14,-3), ROUND(201,-1), ROUND(-145,-1)  FROM DUAL;

--SIGN(valor) Prueba con numeros positivos y negativos
SELECT SIGN(-10), SIGN(10) FROM DUAL;
--devuelve el simbolo positivo o negativo
SELECT SIGN(-25), SIGN(421) FROM DUAL;

--SQRT(n) 
SELECT SQRT(25), SQRT(25.6) FROM DUAL;
--devuelve la raiz cuadrada
SELECT SQRT(5), SQRT(30.5) FROM DUAL;

--TRUNC(n?mero, [m])
--Con truncamiento positivo:
SELECT TRUNC(1.5634,1), TRUNC (1.1684,2), TRUNC(1.662) FROM DUAL;
--truncamos el numero dejando las cifras que indiquemos. Si no se especifica el numero de cifras, quita los decimales
SELECT TRUNC(22.345,1), TRUNC (121.1684,2), TRUNC(1.662) FROM DUAL;

--Con truncamiento negativo:
SELECT TRUNC(187.98,-1), TRUNC (187.98,-2), TRUNC(187.98,-3) FROM DUAL;
--trunca quitando los digitos enteros que indiquemos. Ademas se come los decimales
SELECT TRUNC(112.98,-1), TRUNC (1887.98,-2), TRUNC(187.98,-3) FROM DUAL;

--2.Funciones grupo de valores--SUM,COUNT,AVG,MIN,MAX
SELECT nombre_alumno, GREATEST(nota1, nota2, nota2) as Mayor , LEAST(nota1, nota2, nota3) as Menor FROM notas_alumnos;
--greates devuelve el mayor, least devuelve el menor
--Inserto varios datos en una tabla ya definida para probar la funcion
SELECT * FROM ALUM0405;

INSERT INTO ALUM0405 (dni, nombre, apellidos, fecha_nac, direccion, poblacion, provincia, curso,nivel,clase, faltas1, faltas2, faltas3)
VALUES ('12345679','MARIN', 'COLOMBIA',TO_DATE('11/12/98'), 'C/AVDA DONIA, 13', 'SEVILLA','SEVILLA',1, 'DAI','B', 1,2,3);
INSERT INTO ALUM0405 (dni, nombre, apellidos, fecha_nac, direccion, poblacion, provincia, curso,nivel,clase, faltas1, faltas2, faltas3)
VALUES ('280317287','JULIO', 'COLOMBIA',TO_DATE('11/12/98'), 'C/AVDA DONIA, 13', 'SEVILLA','SEVILLA',1, 'DAI','B', 2,4,1);
INSERT INTO ALUM0405 (dni, nombre, apellidos, fecha_nac, direccion, poblacion, provincia, curso,nivel,clase, faltas1, faltas2, faltas3)
VALUES ('720361728','OSCAR', 'MADRID',TO_DATE('11/12/98'), 'C/AVDA DONIA, 13', 'SEVILLA','SEVILLA',1, 'DAI','B', 3,4,9);

SELECT nombre, GREATEST(faltas1,faltas2,faltas3) as Mayor , LEAST(faltas1,faltas2,faltas3) as Menor FROM ALUM0405;

SELECT GREATEST('Benito','Jorge','Andr?s','Isabel') FROM DUAL;
--Cada caracter tiene un valor, compara el valor de los caracteres y devuelve el que tiene mayor
SELECT GREATEST('Paul McCourtney','Freddy Mercury') FROM DUAL;

--3.Funciones cadenas de caracteres
SELECT LOWER('oRACLe Y sqL') "Min?scula", UPPER('oRACLe Y sqL') "May?scula",INITCAP('oRACLe Y sqL')  "Tipo T?tulo" FROM dual;
--lower: pasa a minuscula
--upper: pasa a mayuscula
--initcap: pasa a mayuscula las primeras y el resto a minuscula
SELECT LOWER('a LoWeR') "Min?scula", UPPER('a UppEr') "May?scula",INITCAP('priMera maYusCULA')  "Tipo T?tulo" FROM dual;

SELECT CHR(75), CHR(65) FROM dual;
--selecciona el caracter n?75 y n?65 
SELECT CHR(90), CHR(90) FROM dual;

SELECT CONCAT('El apellido es:', apellido) FROM emple;
--concatena un string a una tabla
SELECT CONCAT('El nombre es:',nombre) FROM ALUM0405;

SELECT LTRIM('       hola') || RTRIM('  adios       ')|| '*' FROM dual;
--concatena 2 cortes
SELECT LTRIM ('     corte izquierdo') || ('corte derecho    ') FROM DUAL;

SELECT TRANSLATE ('LOS PILARES DE LA TIERRA', 'AEIOU', 'aeiou') FROM dual;
--el segundo hueco selecciona los char del primer string que traduce a los char del 3?
SELECT TRANSLATE ('JUEGO DE PALABRAS', 'AEIOU', 'aeiou') FROM dual;

SELECT apellido, SUBSTR (apellido, 2, 3) as subrango FROM emple WHERE dept_no = 10;
--selecciona una serie de strings empezando desde el 2? y contando el 3?
SELECT oficio, SUBSTR (apellido, 4, 2) as subrango FROM emple WHERE dept_no = 10;

SELECT REPLACE('BLANCO Y NEGRO','O','AS' ) FROM dual;
--cambia las "os" por las "as"
SELECT REPLACE('PICHO NEGRO','O','A' ) FROM dual;

--4. Manejo de fechas
SELECT SYSDATE FROM dual;
--selecciona la fecha del sistema

SELECT fecha_alt, ADD_MONTHS(fecha_alt, 12) FROM emple WHERE dept_no=10;
--aniade los meses determinados a la fecha
SELECT sysdate, ADD_MONTHS(sysdate, 12) FROM DUAL;

SELECT fecha_alt, LAST_DAY(fecha_alt) FROM emple WHERE dept_no=10;
--selecciona el ultimo dia de la fecha pasada
SELECT SYSDATE, LAST_DAY(SYSDATE) FROM DUAL;

SELECT TRUNC (MONTHS_BETWEEN (SYSDATE, '18/11/1964')/12) AS EDAD_ACTUAL FROM dual;
--devuelve los meses entre las fechas pasadas
SELECT TRUNC (MONTHS_BETWEEN (SYSDATE, '27/11/1998')/12) AS EDAD_ACTUAL FROM dual;

SELECT NEXT_DAY(SYSDATE, 'JUEVES') "SIG. Jueves" FROM dual;
--devuelve la fecha con el dia pasado como parametro
SELECT NEXT_DAY(SYSDATE, 'VIERNES') "SIG. Jueves" FROM dual;

--Ejercicio1. Fecha
/*- A partir de la tabla EMPLE, obten la fecha de alta (columna FECHA_ALT) formateada, de manera 
que aparezca el nombre del mes con todas sus letras (month), el n?mero de d?a de mes (dd) y el 
anio (yyyy), para aquellos empleados del departamento 10.*/
SELECT TO_CHAR(fecha_alt,'dd/month/yyyy') AS FROM EMPLE
WHERE dept_no = 10;

/*Ahora repite el ejercicio anterior de manera que aparezca el nombre del mes con tres letras 
(mon), el n?mero del d?a del a?o (ddd), el ?ltimo d?gito del a?o (y) y los tres ?ltimo d?gitos del a?o*/
SELECT TO_CHAR(fecha_alt,'ddd/mon/y') AS FROM EMPLE
WHERE dept_no = 10;



