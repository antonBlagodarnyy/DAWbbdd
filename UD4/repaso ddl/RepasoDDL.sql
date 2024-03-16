l--CREAMOS LAS TABLAS
CREATE TABLE SUCURSAL(
codSucursal NUMBER CONSTRAINT pk_sucursal PRIMARY KEY,
nombre VARCHAR2 (20),
direccion VARCHAR2(40),
localidad VARCHAR2(20));

CREATE TABLE CUENTA(
codSucursal NUMBER,--pk y fk
codCuenta NUMBER );--pk
--añadimos los pk
ALTER TABLE CUENTA
ADD CONSTRAINT pk_cuenta PRIMARY KEY (codSucursal,codCuenta);
--añadimos las fk
ALTER TABLE CUENTA
ADD CONSTRAINT fk_cuenta_sucursal 
FOREIGN KEY (codSucursal) REFERENCES SUCURSAL (codSucursal);

CREATE TABLE TRANSACCION (
codSucursal NUMBER ,--pk y fk
codCuenta NUMBER,--pk y fk
numTransaccion NUMBER,--pk
fecha DATE,
cantidad NUMBER,
tipo VARCHAR2(15));
--añadimos los pk
ALTER TABLE TRANSACCION
ADD CONSTRAINT pk_transaccion PRIMARY KEY (codSucursal,codCuenta,numTransaccion);
--añadimos los fk
ALTER TABLE TRANSACCION
ADD CONSTRAINT fk_transaccion_cuenta FOREIGN KEY (codSucursal,codCuenta) REFERENCES CUENTA (codSucursal,codCuenta);

CREATE TABLE CLIENTE(
dni VARCHAR (9),--pk
nombre VARCHAR(20),
direccion VARCHAR (20),
localidad VARCHAR(20),
fechaNac DATE,
sexo VARCHAR(1));
--añadimos pk
ALTER TABLE CLIENTE
ADD CONSTRAINT pk_cliente PRIMARY KEY (dni);

CREATE TABLE CLI_CUENTA(
codSucursal NUMBER ,--pk y fk
codCuenta NUMBER,--pk y fk
dni VARCHAR (9));--pk y fk2
--añadimos los pk
ALTER TABLE CLI_CUENTA
ADD CONSTRAINT pk_cli_cuenta PRIMARY KEY (codSucursal, codCuenta, dni);
--añadimos fk1
ALTER TABLE CLI_CUENTA
ADD CONSTRAINT fk_cli_cuenta_cuenta
FOREIGN KEY (codSucursal, codCuenta) REFERENCES CUENTA (codSucursal,codCuenta);
--añadimos fk2
ALTER TABLE CLI_CUENTA
ADD CONSTRAINT fk_cli_cuenta_cliente
FOREIGN KEY (dni) REFERENCES CLIENTE (dni);

--MODIFICAMOS LONGITUD DE CODSUCURSAL
--tabla principal
ALTER TABLE SUCURSAL
MODIFY codSucursal NUMBER(5);
--demas
ALTER TABLE CUENTA
MODIFY codSucursal NUMBER(5);
ALTER TABLE TRANSACCION
MODIFY codSucursal NUMBER(5);
ALTER TABLE CLI_CUENTA
MODIFY codSucursal NUMBER(5);

--CREAMOS TELEFONOS
CREATE TABLE TELEFONOS(
dni VARCHAR2(9),--pk y fk
telefono NUMBER(9),
contadorTelefono NUMBER(1));--pk
--añadimos pk
ALTER TABLE TELEFONOS 
ADD CONSTRAINT pk_telefonos PRIMARY KEY (dni, contadorTelefono);
--añadimos los fk
ALTER TABLE TELEFONOS 
ADD CONSTRAINT fk_telefonos_cliente
FOREIGN KEY (dni) REFERENCES CLIENTE (dni);

--CREAMOS EMAIL
ALTER TABLE CLIENTES
ADD email VARCHAR(30);
--creamos las restricciones
ALTER TABLE CLIENTES
ADD CONSTRAINT chk_email_format
CHECK (email LIKE '%@%.com');

--CREAMOS RESTRICCIONES
--edad mayor o igual a 18
ALTER TABLE CLIENTE ADD edad NUMBER(3);
ALTER TABLE CLIENTE ADD CONSTRAINT limite_edad CHECK (edad>=18);

--tipo transaccion
    --modify para que solo admita un caracter
ALTER TABLE TRANSACCION 
MODIFY tipo VARCHAR2(1);
        --constraint para los caracteres admitidos
ALTER TABLE TRANSACCION 
ADD CONSTRAINT tipo_transaccion_const CHECK ( tipo in ('T','D'));

--sexo
ALTER TABLE CLIENTE
ADD CONSTRAINT sexo_const CHECK (sexo in ('H','M'));

--MODIFICAMOS TIPO TRANSACCION
    --drop de la const antigua
ALTER TABLE TRANSACCION
DROP CONSTRAINT tipo_transaccion_const;

    --añadimos const editada
ALTER TABLE TRANSACCION
ADD CONSTRAINT tipo_transaccion_const CHECK(tipo IN ('T', 'D', 'I'));

--INSERCIONES
INSERT INTO SUCURSAL (codSucursal, nombre, direccion, localidad) 
VALUES (12345, 'anton', 'avda', 'sev');

INSERT INTO CUENTA (codSucursal, codCuenta)
VALUES (12345, 23456);

INSERT INTO TRANSACCION (codSucursal, codCuenta, numTransaccion, fecha, cantidad, tipo)
VALUES (12345,23456,34567,TO_DATE('2023-03-02','yyyy-mm-dd'),3000,'T');

INSERT INTO CLIENTE (dni,nombre,direccion,localidad,fechaNac,sexo, edad)
VALUES ('12345678X','Anton','Avda','Sev',TO_DATE('1998-11-27','yyyy-mm-dd'),'H',25);

INSERT INTO CLI_CUENTA (codSucursal,codCuenta,dni)
VALUES(12345,23456,'12345678X');

--CAMBIAMOS FECHANAC DE CLIENTES
ALTER TABLE CLIENTE
RENAME COLUMN fechaNac TO fechaN;

--CAMBIAMOS TAMANIO DE LOCALIDAD
ALTER TABLE SUCURSAL
MODIFY localidad VARCHAR2(30);