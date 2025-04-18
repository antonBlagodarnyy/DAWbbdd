CREATE TABLE ALUMNO (
dni Varchar(8) NOT NULL,
nombre VARCHAR(8) NOT NULL,
nota VARCHAR(8) NOT NULL,
opcion VARCHAR(8) NOT NULL
)

CREATE TABLE ESTUDIO (
codigo Varchar(8) NOT NULL,
nombre VARCHAR(8) NOT NULL,
nota_de_corte int NOT NULL
)

CREATE TABLE PREINSCRIPCION (
dni Varchar(8) NOT NULL,
codigo VARCHAR(8) NOT NULL,
orden int NOT NULL,
admitido VARCHAR(1)
)


ALTER TABLE ALUMNO ADD CONSTRAINT pk_alumno
PRIMARY KEY(dni);

ALTER TABLE ESTUDIO ADD CONSTRAINT pk_estudio
PRIMARY KEY(codigo);

ALTER TABLE PREINSCRIPCION ADD CONSTRAINT preinscripcion
PRIMARY KEY(dni);

ALTER TABLE ALUMNO
MODIFY opcion VARCHAR(1) check (opcion IN ('A' , 'B' , 'C', 'D'));

ALTER TABLE ESTUDIO
MODIFY nota_de_corte INT CHECK (nota_de_corte >= 5);

ALTER TABLE PREINSCRIPCION
MODIFY admitido VARCHAR(1) CHECK (admitido IN ('S','N'));

ALTER TABLE ALUMNO
MODIFY nota NUMBER(4,2);

ALTER TABLE CONSUMO  
ADD CONSTRAINT fk_code_consumo
FOREIGN KEY (code)
REFERENCES ENFERMOS(code)
ADD CONSTRAINT fk_codf
FOREIGN KEY (codf)
REFERENCES FARMACOS(codf);
