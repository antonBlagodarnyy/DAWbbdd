CREATE TABLE EMPLEADOS(
dni NUMBER(8),
nombre VARCHAR(10),
apellido1 VARCHAR(15),
apellido2 VARCHAR(15),
direcc1 VARCHAR(25),
direcc2 VARCHAR(20),
ciudad VARCHAR(20),
provincia VARCHAR(20),
cod_postal VARCHAR(5),
sexo VARCHAR(1),
fecha_nac DATE);

CREATE TABLE HISTORIAL_LABORAL(
empleado_dni NUMBER(8),
trabajo_cod NUMBER(5),
fecha_inicio DATE,
fecha_fin DATE,
dpto_cod NUMBER(5),
supervisor_dni NUMBER(8));

CREATE TABLE HISTORIAL_SALARIAL(
empleado_dni NUMBER(8),
salario NUMBER ,
fecha_comienzo DATE,
fecha_fin DATE);

CREATE TABLE DEPARTAMENTOS(
dpto_cod NUMBER(5),
nombre_dpto VARCHAR(30),
dpto_padre NUMBER(5),
presupuesto NUMBER,
pres_actual NUMBER);

CREATE TABLE ESTUDIOS(
empleado_dni NUMBER(8),
universidad NUMBER (5),
anio NUMBER,
grado VARCHAR(3),
especialidad VARCHAR(20));

CREATE TABLE UNIVERSIDADES(
univ_cod NUMBER(5),
nombre_univ VARCHAR (25),
ciudad VARCHAR(20),
municipio VARCHAR(2),
cod_postal VARCHAR(5));

DROP TABLE TRABAJOS;

CREATE TABLE TRABAJOS(
trabajo_cod NUMBER(5),
nombre_trab VARCHAR (20),
salario_min NUMBER(2),
salario_max NUMBER(2))
;

ALTER TABLE EMPLEADOS
MODIFY  nombre VARCHAR(10) NOT NULL;

ALTER TABLE DEPARTAMENTOS
MODIFY  nombre_dpto VARCHAR(30) NOT NULL;

ALTER TABLE UNIVERSIDADES
MODIFY  nombre_univ VARCHAR(25) NOT NULL;

ALTER TABLE TRABAJOS
MODIFY  nombre_trab VARCHAR(20) NOT NULL;

ALTER TABLE EMPLEADOS
MODIFY  apellido1 VARCHAR(15) NOT NULL;

ALTER TABLE DEPARTAMENTOS
MODIFY  presupuesto NUMBER NOT NULL;

ALTER TABLE HISTORIAL_SALARIAL
MODIFY  salario NUMBER NOT NULL;

ALTER TABLE TRABAJOS
MODIFY  salario_min NUMBER(2) NOT NULL;

ALTER TABLE TRABAJOS
MODIFY  salario_max NUMBER(2) NOT NULL;

ALTER TABLE EMPLEADOS
MODIFY sexo VARCHAR(1) 
check (sexo IN ('H' , 'M'));

ALTER TABLE DEPARTAMENTOS
ADD CONSTRAINT nombre_unico_dep 
UNIQUE (nombre_dpto);

ALTER TABLE TRABAJOS
ADD CONSTRAINT nombre_unico_trab 
UNIQUE (nombre_trab);

--los dos ultimos puntos no sabia muy bien como hacerlo--
--ALTER TABLE EMPLEADOS
--ADD CONSTRAINT fk_empleado_dni 
--FOREIGN KEY (empleado_dni) REFERENCES HISTORIAL_SALARIAL(empleado_dni); 

--ALTER TABLE EMPLEADOS
--ADD CONSTRAINT fk_empleado_dni 
--FOREIGN KEY (empleado_dni) REFERENCES HISTORIAL_SALARIAL(empleado_dni); 
