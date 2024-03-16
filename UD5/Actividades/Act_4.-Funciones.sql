--1.- Funciones aritméticas de valores simples:

--ABS(n): obtén el valor absoluto del SALARIO – 1000 para todas las filas de la tabla EMPLE
SELECT apellido, salario, ABS(salario-1000) FROM emple;
SELECT apellido, salario, ABS(salario+500) FROM emple;
--Devuelve una operacion aritmetica

--CEIL(n) Prueba con números positivos y negativos
SELECT CEIL(20.3), CEIL(16), CEIL(-20.3), CEIL(-16) FROM DUAL;
SELECT CEIL(20.8), CEIL(16), CEIL(-20.3), CEIL(-16.2) FROM DUAL;
--Trunca el numero hacia abajo

--FLOOR(n) Prueba con números positivos y negativos.
SELECT FLOOR(20.3), FLOOR(16), FLOOR(-20.3), FLOOR(-16) FROM DUAL;
SELECT FLOOR(20.8), FLOOR(16), FLOOR(-20.3), FLOOR(-16.2) FROM DUAL;
--Trunca el numero hacia arriba

--MOD(m,n) Prueba con números positivos y negativos.
SELECT MOD(11,4), MOD(10,-15), MOD(-10,-3), MOD(10.4,4.5) FROM DUAL;

--POWER(m, exponente) Prueba con números positivos y negativos;
SELECT POWER(2,4), POWER(2,-4), POWER(3.5,2.4), POWER(4.5,2) FROM DUAL;


--ROUND(número[,m]) Prueba con redondeos positivos y luego negativos:
SELECT ROUND(1.56,1), ROUND(1.56), ROUND(1.2234,2), ROUND(1.2676,3)  FROM DUAL;
--redondea el positivo
SELECT ROUND(145.5,-1), ROUND(145.5,-2), ROUND(145.,-3), ROUND(141,-1), ROUND(145,-1)  FROM DUAL;
--redondea el negativo

--SIGN(valor) Prueba con numeros positivos y negativos
SELECT SIGN(-10), SIGN(10) FROM DUAL;
--devuelve el simbolo positivo o negativo

--SQRT(n) 
SELECT SQRT(25), SQRT(25.6) FROM DUAL;
--devuelve la raiz cuadrada

--TRUNC(número, [m])
--Con truncamiento positivo:
SELECT TRUNC(1.5634,1), TRUNC (1.1684,2), TRUNC(1.662) FROM DUAL;
--truncamos el numero segun los digitos que le metan

--Con truncamiento negativo:
SELECT TRUNC(187.98,-1), TRUNC (187.98,-2), TRUNC(187.98,-3) FROM DUAL;
--trunca quitando digitos

--2.Funciones grupo de valores--SUM,COUNT,AVG,MIN,MAX
SELECT nombre_alumno, GREATEST(nota1, nota2, nota2) as Mayor , LEAST(nota1, nota2, nota3) as Menor FROM notas_alumnos;
--greates devuelve el mayor
--least devuelve el menor

SELECT GREATEST('Benito','Jorge','Andrés','Isabel') FROM DUAL;
--Cada caracter tiene un valor 
--Compara el valor de los caracteres y devuelve el que tiene mayor

--3.Funciones cadenas de caracteres
SELECT LOWER('oRACLe Y sqL') "Minúscula", UPPER('oRACLe Y sqL') "Mayúscula",INITCAP('oRACLe Y sqL')  "Tipo Título" FROM dual;
--lower: pasa a minuscula
--upper: pasa a mayuscula
--initcap: pasa a mayuscula las primeras y el resto a minuscula

SELECT CHR(75), CHR(65) FROM dual;
--selecciona el caracter nº75 y nº65 

SELECT CONCAT('El apellido es:', apellido) FROM emple;
--concatena un string a una tabla

SELECT LTRIM('       hola') || RTRIM('  adios       ')|| '*' FROM dual;
--concatena 2 cortes

SELECT TRANSLATE ('LOS PILARES DE LA TIERRA', 'AEIOU', 'aeiou') FROM dual;
--el segundo hueco selecciona los char del primer string que traduce a los char del 3º

SELECT apellido, SUBSTR (apellido, 2, 3) as subrango FROM emple WHERE dept_no = 10;
--selecciona una serie de strings empezando desde el 2º y contando el 3º

SELECT REPLACE('BLANCO Y NEGRO','O','AS' ) FROM dual;
--cambia las "os" por las "as"

--4. Manejo de fechas
SELECT SYSDATE FROM dual;
--selecciona la fecha del sistema

SELECT fecha_alt, ADD_MONTHS(fecha_alt, 12) FROM emple WHERE dept_no=10;
--aniade los meses determinados a la fecha

SELECT fecha_alt, LAST_DAY(fecha_alt) FROM emple WHERE dept_no=10;
--selecciona el ultimo dia de la fecha pasada

SELECT TRUNC (MONTHS_BETWEEN (SYSDATE, '18/11/1964')/12) AS EDAD_ACTUAL FROM dual;
--devuelve los meses entre las fechas pasadas

SELECT NEXT_DAY(SYSDATE, 'JUEVES') "SIG. Jueves" FROM dual;
--devuelve la fecha con el dia pasado como parametro

--Ejercicio1. Fecha
/*- A partir de la tabla EMPLE, obten la fecha de alta (columna FECHA_ALT) formateada, de manera 
que aparezca el nombre del mes con todas sus letras (month), el número de día de mes (dd) y el 
anio (yyyy), para aquellos empleados del departamento 10.*/
SELECT TO_CHAR(fecha_alt,'dd/month/yyyy') AS FROM EMPLE
WHERE dept_no = 10;

/*Ahora repite el ejercicio anterior de manera que aparezca el nombre del mes con tres letras 
(mon), el número del día del año (ddd), el último dígito del año (y) y los tres último dígitos del año*/
SELECT TO_CHAR(fecha_alt,'ddd/mon/y') AS FROM EMPLE
WHERE dept_no = 10;



