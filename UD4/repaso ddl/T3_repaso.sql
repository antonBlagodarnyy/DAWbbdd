--DROP DE LAS TABLAS YA CREADAS
DROP TABLE ESPECTACULOS;
DROP TABLE PRECIOS_ESPECTACULOS;
DROP TABLE RECINTOS;
DROP TABLE ZONA_RECINTOS;
DROP TABLE REPRESENTACIONES;
DROP TABLE ENTRADAS;
DROP TABLE ASIENTOS;
DROP TABLE ESPECTADORES;

--LAS VOLVEMOS A CREAR
CREATE TABLE ESPECTACULOS(
cod_espectaculo VARCHAR(8) CONSTRAINT pk_espectaculos PRIMARY KEY,--pk
nombre VARCHAR (80) NOT NULL,
tipo VARCHAR(8) NOT NULL,
fecha_inicial DATE,
fecha_final DATE,
interprete VARCHAR(80),
cod_recinto VARCHAR(8));--fk
--agregamos fk
ALTER TABLE ESPECTACULOS
ADD CONSTRAINT fk_espectaculos FOREIGN KEY (cod_recinto) REFERENCES RECINTOS (cod_recinto);

CREATE TABLE PRECIOS_ESPECTACULOS (
cod_espectaculo VARCHAR(8) CONSTRAINT pk_precios_espectaculos PRIMARY KEY,--pk y fk1
cod_recinto VARCHAR(8),--fk2
zona VARCHAR(8),--fk3
capacidad NUMBER);
--agregamos fk1
ALTER TABLE PRECIOS_ESPECTACULOS
ADD CONSTRAINT fk_precios_espectaculos_espectaculo FOREIGN KEY ( cod_espectaculo) REFERENCES ESPECTACULOS (cod_espectaculo);
--agregamos fk2
ALTER TABLE PRECIOS_ESPECTACULOS
ADD CONSTRAINT fk_precios_espectaculos_recinto FOREIGN KEY (cod_recinto) REFERENCES RECINTOS (cod_recinto);
--agregamos fk3
ALTER TABLE PRECIOS_ESPECTACULOS
ADD CONSTRAINT fk_precios_espectaculos_zona FOREIGN KEY (zona) REFERENCES ZONAS_RECINTOS (zona);

CREATE TABLE RECINTOS(
cod_recinto VARCHAR(8) CONSTRAINT pk_recintos PRIMARY KEY,--pk
nombre VARCHAR (80) NOT NULL,
direccion VARCHAR(80),
ciudad VARCHAR(80),
telefono VARCHAR(8),
horario VARCHAR(9));

CREATE TABLE ZONAS_RECINTOS(
cod_recinto VARCHAR(8) CONSTRAINT pk_zonas_recintos PRIMARY KEY, --pk y fk
zona VARCHAR(8),--pk(agregar despues)
capacidad NUMBER);
--borramos las pk inicial, para poder agregar zona como segunda pk
ALTER TABLE ZONAS_RECINTOS
DROP CONSTRAINT pk_zonas_recintos;
--añadimos la pk corregida
ALTER TABLE ZONAS_RECINTOS
ADD CONSTRAINT  pk_zonas_recintos PRIMARY KEY (cod_recinto,zona);
--agregamos fk
ALTER TABLE ZONAS_RECINTOS 
ADD CONSTRAINT fk_zonas_recintos_reconto FOREIGN KEY (cod_recinto) REFERENCES RECINTOS (cod_recinto);

CREATE TABLE ASIENTOS(
cod_recinto VARCHAR(8) CONSTRAINT pk_asientos PRIMARY KEY, --pk y fk
zona VARCHAR(8),--fk
fila VARCHAR(1),
numero NUMBER);
--agregamos fk
ALTER TABLE ASIENTOS
ADD CONSTRAINT fk_asientos_zona FOREIGN KEY (cod_recinto,zona) REFERENCES ZONAS_RECINTOS (cod_recinto,zona);

CREATE TABLE REPRESENTACIONES ( 
cod_espectaculo VARCHAR(8) CONSTRAINT pk_representaciones PRIMARY KEY,--pk y fk
fecha DATE,
hora DATE); 
--agregamos fk
ALTER TABLE REPRESENTACIONES
ADD CONSTRAINT fk_representaciones FOREIGN KEY (cod_espectaculo) REFERENCES ESPECTACULOS ( cod_espectaculo);

CREATE TABLE ENTRADAS(
cod_espectaculo VARCHAR(8),--pk y fk
fecha DATE,
hora DATE,
cod_recinto VARCHAR(8),--pk y fk2
fila VARCHAR(1),
numero NUMBER,
zona VARCHAR(8),
dni_cliente VARCHAR (9)--pk y fk3
); 
--agregamos las pk
ALTER TABLE ENTRADAS
ADD CONSTRAINT pk_entradas PRIMARY KEY (cod_espectaculo,cod_recinto,dni_cliente);
--agregamos las fk
    --fk1
    ALTER TABLE ENTRADAS 
    ADD CONSTRAINT fk_entradas_espectaculo FOREIGN KEY (cod_espectaculo) REFERENCES ESPECTACULOS (cod_espectaculo);
    --fk2
     ALTER TABLE ENTRADAS 
    ADD CONSTRAINT fk_entradas_recinto FOREIGN KEY (cod_recinto) REFERENCES RECINTOS (cod_recinto);
    --fk3
    ALTER TABLE ENTRADAS
    ADD CONSTRAINT fk_entradas_cliente FOREIGN KEY (dni_cliente) REFERENCES ESPECTADORES (dni_cliente);

CREATE TABLE ESPECTADORES(
dni_cliente VARCHAR(9),--pk
nombre VARCHAR(80),
direccion VARCHAR(80),
telefono VARCHAR(8),
ciudad VARCHAR(80),
ntarjeta NUMBER);
--agregamos la pk
ALTER TABLE ESPECTADORES
ADD CONSTRAINT pk_espectadores PRIMARY KEY (dni_cliente);

