CREATE TABLE PUB (
cod_pub NUMBER(5) CONSTRAINT pk_pub PRIMARY KEY,
nombre VARCHAR(15) NOT NULL,
licencia_fiscal VARCHAR(15) NOT NULL,
domicilio VARCHAR(20),
fecha_apertura DATE NOT NULL,
horario VARCHAR(15) CONSTRAINT horario_const NOT NULL CHECK (horario in ('HOR1','HOR2','HOR3')),
cod_localidad  NUMBER(5) NOT NULL);--fk

CREATE TABLE TITULAR(
dni_titular NUMBER(5) CONSTRAINT pk_titular PRIMARY KEY,
nombre VARCHAR(15) NOT NULL,
domicilio VARCHAR(15),
cod_pub NUMBER(5) NOT NULL);--fk

CREATE TABLE EMPLEADO(
dni_empleado NUMBER(5) CONSTRAINT pk_empleado PRIMARY KEY,
nombre VARCHAR(15) NOT NULL,
domicilio VARCHAR(15));

CREATE TABLE EXISTENCIAS(
cod_articulo NUMBER(5) CONSTRAINT pk_existencias PRIMARY KEY,
nombre VARCHAR(15) NOT NULL,
cantidad NUMBER (5) NOT NULL,
precio NUMBER (5) CONSTRAINT precio_const NOT NULL CHECK (precio > 0),
cod_pub NUMBER (5) NOT NULL);--fk

CREATE TABLE LOCALIDAD (
cod_localidad NUMBER(5) CONSTRAINT pk_localidad PRIMARY KEY,
nombre VARCHAR(15) NOT NULL);

CREATE TABLE PUB_EMPLEADO (
cod_pub NUMBER(5),
dni_empleado NUMBER(5),
funcion VARCHAR (9) CONSTRAINT funcion_const CHECK (funcion in ('CAMARERO','SEGURIDAD','LIMPIEZA')));
--como los 3 valores son pk, lo agregaremos con un alter table
--ademas cod y dni son fk

--ALTER TABLE: 
--pk:pub_empleado(2)
--fk:pub,titular,existencias,pub_empleado(2)
ALTER TABLE PUB_EMPLEADO
ADD CONSTRAINT pk_pub_empleado PRIMARY KEY (cod_pub,dni_empleado,funcion);

ALTER TABLE PUB
ADD CONSTRAINT fk_pub FOREIGN KEY (cod_localidad) REFERENCES LOCALIDAD (cod_localidad);

ALTER TABLE TITULAR
ADD CONSTRAINT fk_titular FOREIGN KEY (cod_pub) REFERENCES PUB (cod_pub);

ALTER TABLE EXISTENCIAS 
ADD CONSTRAINT fk_existencias FOREIGN KEY (cod_pub) REFERENCES PUB (cod_pub);

--Como vienen de tablas distintas, las metemos en constraints distintos.
ALTER TABLE PUB_EMPLEADO
ADD CONSTRAINT fk_pub_empleado_p FOREIGN KEY (cod_pub) REFERENCES PUB (cod_pub);
ALTER TABLE PUB_EMPLEADO
ADD CONSTRAINT fk_pub_empleado_e FOREIGN KEY (dni_empleado) REFERENCES EMPLEADO (dni_empleado);