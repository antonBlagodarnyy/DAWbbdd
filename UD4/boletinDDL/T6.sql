--ALTER TABLE EMPLEADOS ADD VALORACION NUMBER DEFAULT 5 CHECK (VALORACION BETWEEN 1 AND 10)--
--CORRECCION DE TABLAS--
ALTER TABLE EMPLEADOS
ADD  apellido2 VARCHAR(15)
ADD estudios;

--APARTADO A)--
--EMPLEADOS--
-- Employee 1--
INSERT INTO EMPLEADOS (dni, nombre, apellido1, apellido2, direcc1, direcc2, ciudad, provincia, cod_postal, sexo, fecha_nac)
VALUES (34567890, 'Carlos', 'Garcia', 'Rodriguez', 'Calle Principal 123', 'Piso3', 'CiudadC', 'ProvinciaZ', '98765', 'H', TO_DATE('1995-03-10','yyyy-mm-dd'));
-- Employee 2--
INSERT INTO EMPLEADOS (dni, nombre, apellido1, apellido2, direcc1, direcc2, ciudad, provincia, cod_postal, sexo, fecha_nac)
VALUES (23456789, 'Maria', 'Martinez', 'Lopez', 'AvenidaCentral 567', 'Piso1', 'CiudadB', 'ProvinciaY', '54321', 'M', TO_DATE('1988-08-22','yyyy-mm-dd'));

--HISTORIAL_LABORAL--
--Employee 1--
INSERT INTO HISTORIAL_LABORAL (empleado_dni,trabajo_cod,fecha_inicio,fecha_fin,dpto_cod,supervisor_dni)
VALUES (34567890, 12345, TO_DATE('2023-08-22','yyyy-mm-dd'),TO_DATE('2023-09-14','yyyy-mm-dd'),12345,34567890);
--Employee 2--
INSERT INTO HISTORIAL_LABORAL (empleado_dni,trabajo_cod,fecha_inicio,fecha_fin,dpto_cod,supervisor_dni)
VALUES (23456789, 12345, TO_DATE('2023-08-22','yyyy-mm-dd'),TO_DATE('2023-09-14','yyyy-mm-dd'),12345,34567890);

--HISTORIAL SALARIAL--
--Employee 1--
INSERT INTO HISTORIAL_SALARIAL (empleado_dni, salario, fecha_comienzo, fecha_fin)
VALUES (34567890, 1200, TO_DATE('2021-05-12','yyyy-mm-dd'),NULL);
--Employee 2--
INSERT INTO HISTORIAL_SALARIAL (empleado_dni, salario, fecha_comienzo, fecha_fin)
VALUES (23456789, 1100, TO_DATE('2022-08-12','yyyy-mm-dd'),NULL);

--DEPARTAMENTOS--
--Departamento 1--
INSERT INTO DEPARTAMENTOS (dpto_cod, nombre_dpto, dpto_padre, presupuesto,pres_actual)
VALUES (12345, 'Administracion ', 67891,3500,2890);
--Departamento 2--
INSERT INTO DEPARTAMENTOS (dpto_cod, nombre_dpto, dpto_padre, presupuesto,pres_actual)
VALUES (67891, 'Gestion ', NULL,4000,3790);

--ESTUDIOS--
--Estudios 1--
INSERT INTO ESTUDIOS (empleado_dni, universidad, anio, grado,especialidad)
VALUES (34567890, 12345,2003, 'ADE' ,'Gestion');
--Estudios 2--
INSERT INTO ESTUDIOS (empleado_dni, universidad, anio, grado,especialidad)
VALUES (23456789, 12345,2001, 'ADE' ,'RRHH');

--UNIVERSIDADES--
--Universidades 1--
INSERT INTO UNIVERSIDADES (univ_cod, nombre_univ, ciudad, municipio,cod_postal)
VALUES (12345, 'Wisconsin' ,'Sevilla', 'SE' ,'41006');
--Universidades 1--
INSERT INTO UNIVERSIDADES (univ_cod, nombre_univ, ciudad, municipio,cod_postal)
VALUES (67891, 'Harvard' ,'Sevilla', 'SE' ,'41006');

--TRABAJOS--
--Trabajo 1--
INSERT INTO TRABAJOS (trabajo_cod, nombre_trab, salario_min, salario_max)
VALUES (12345, 'Colocacion territ' ,10, 40);
--Trabajo 2--
INSERT INTO TRABAJOS (trabajo_cod, nombre_trab, salario_min, salario_max)
VALUES (67891, 'Gestion territ' ,20, 50);

--APARTADO B)--
INSERT INTO EMPLEADOS (nombre, apellido1, apellido2, dni,sexo)
VALUES ('Sergio', 'Palma', 'Entrena',111222,'P');
--No me permite añadir los valores. Sexo esta limitado a 'H' o 'M'--
INSERT INTO EMPLEADOS (nombre, apellido1, apellido2, dni,sexo)
VALUES ('Lucia', 'Ortega', 'Plus',222333,NULL);
--Esta sentencia si ejecuta, sexo puede ser nulo--

--APARTADO C)--
--Se debe de modificar este campo previamente, esta puesto en VARCHAR(5)--
ALTER TABLE HISTORIAL_LABORAL
MODIFY dpto_cod NUMBER(6);

--Sentencia para introducir los valores:--
INSERT INTO HISTORIAL_LABORAL (empleado_dni, trabajo_cod, fecha_inicio, fecha_fin,dpto_cod,supervisor_dni)
VALUES (111222, NULL, TO_DATE('16-06-96','dd-mm-yy'),NULL,222333,NULL);

--Nos permite actualizar la tabla--
UPDATE HISTORIAL_LABORAL
SET supervisor_dni = 14392383
WHERE empleado_dni = 111222;

--Me permite eliminarla por que no tenia declarada la restriccion de clave ajena--
DELETE FROM UNIVERSIDADES
WHERE univ_cod= 12345;

--Debemos declararla primero como clave principal
ALTER TABLE UNIVERSIDADES
ADD CONSTRAINT pk_univ PRIMARY KEY (univ_cod);


DROP TABLE ESTUDIOS
--Con esta sentencia creamos la restriccion y
--con el on delete set null volcamos el valor a nulo
--en caso de que se elimine una universidad
ALTER TABLE ESTUDIOS
ADD CONSTRAINT fk_univ 
FOREIGN KEY (universidad) REFERENCES UNIVERSIDADES (univ_cod)ON DELETE SET NULL;

--Apartado D)
ALTER TABLE EMPLEADOS
ADD valoracion NUMBER DEFAULT 5 CHECK(VALORACION BETWEEN 1 AND 10); 

--Apartado F)
ALTER TABLE EMPLEADOS
MODIFY nombre NULL;

--Apartado G)
ALTER TABLE EMPLEADOS
MODIFY direcc1 VARCHAR(40);

--Apartado I)
ALTER TABLE EMPLEADOS
ADD CONSTRAINT pk_empleados PRIMARY KEY (nombre, apellido1, apellido2);
