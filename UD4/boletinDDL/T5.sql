--CREAMOS LAS TABLAS--

CREATE TABLE CLIENTES(
idCliente VARCHAR (8),
nombre VARCHAR(8),
apellidos VARCHAR(8),
email VARCHAR(8),
fechaRegistro DATE);

CREATE TABLE PEDIDOS (
idPedidos VARCHAR (8),
idCliente VARCHAR (8),
fechaPedido DATE,
total int);

CREATE TABLE DETALLES_PEDIDO ( 
idDetalle VARCHAR (8),
idPedidos VARCHAR (8),
producto VARCHAR (8),
cantidad int, 
precioUnitario DECIMAL (10,2));

--CLAVES PRIMARIAS--

ALTER TABLE CLIENTES 
ADD CONSTRAINT pk_clientes PRIMARY KEY (idCliente);

ALTER TABLE PEDIDOS
ADD CONSTRAINT pk_pedidos PRIMARY KEY (idPedidos);

ALTER TABLE DETALLES_PEDIDO
ADD CONSTRAINT pk_detalles_pedidos PRIMARY KEY (idDetalle);

--CLAVES FORANEAS--
ALTER TABLE PEDIDOS
ADD CONSTRAINT fk_idCliente
FOREIGN KEY (idCliente) REFERENCES CLIENTES(idCliente);

ALTER TABLE DETALLES_PEDIDO
ADD CONSTRAINT fk_idPedidos
FOREIGN KEY (idPedidos) REFERENCES PEDIDOS(idPedidos);

--OTROS CONSTRAINTS--
ALTER TABLE CLIENTES
ADD CONSTRAINT uc_clientes UNIQUE (email);

ALTER TABLE CLIENTES
MODIFY fechaRegistro DEFAULT SYSDATE;

ALTER TABLE PEDIDOS
MODIFY total INT CHECK (total>0);

ALTER TABLE DETALLES_PEDIDO
MODIFY cantidad INT CHECK (cantidad>0);

ALTER TABLE DETALLES_PEDIDO
MODIFY precioUnitario INT DEFAULT 0;

--INTEGRIDAD REFERENCIAL--
ALTER TABLE DETALLES_PEDIDO
DROP CONSTRAINT fk_idPedidos;

ALTER TABLE DETALLES_PEDIDO
ADD CONSTRAINT fk_idPedidos
FOREIGN KEY (idPedidos) REFERENCES PEDIDOS(idPedidos) ON DELETE SET NULL;

    --INTEGRIDAD REFERENCIAL CIRCULAR--
ALTER TABLE CLIENTES
ADD CONSTRAINT fk_clientes
FOREIGN KEY (idCliente) REFERENCES CLIENTES(idCliente) ON DELETE SET NULL;

--CORRECCION RESTRICCION--
ALTER TABLE CLIENTES
MODIFY email VARCHAR(30);

ALTER TABLE CLIENTES
MODIFY apellidos VARCHAR(30);

--INSERT TABLE--

--TABLA CLIENTES--
-- Record 1
INSERT INTO CLIENTES (idCliente, nombre,apellidos,email)
VALUES ('87654433', 'Paqui','Gutier','Guti08@Gmail.com');
-- Record 2
INSERT INTO CLIENTES (idCliente, nombre, apellidos, email)
VALUES ('98765432', 'Juan', 'Lopez', 'juan.lopez@email.com');
-- Record 3
INSERT INTO CLIENTES (idCliente, nombre, apellidos, email)
VALUES ('76543210', 'Maria', 'Martinez', 'maria.martinez@email.com');
-- Record 4
INSERT INTO CLIENTES (idCliente, nombre, apellidos, email)
VALUES ('12345678', 'Carlos', 'Sanchez', 'carlos.sanchez@email.com');
-- Record 5
INSERT INTO CLIENTES (idCliente, nombre, apellidos, email)
VALUES ('23456789', 'Laura', 'Rodriguez', 'laura.rodriguez@email.com');

--TABLE PEDIDOS--
-- Record 1
INSERT INTO PEDIDOS (idPedidos, idCliente, fechaPedido)
VALUES ('28345019', '87654433', null);
-- Record 2
INSERT INTO PEDIDOS (idPedidos, idCliente, fechaPedido)
VALUES ('28345020', '98765432', null);
-- Record 3
INSERT INTO PEDIDOS (idPedidos, idCliente, fechaPedido)
VALUES ('28345021', '76543210', null);
-- Record 4
INSERT INTO PEDIDOS (idPedidos, idCliente, fechaPedido)
VALUES ('28345022', '12345678', null);
-- Record 5
INSERT INTO PEDIDOS (idPedidos, idCliente, fechaPedido)
VALUES ('28345023', '23456789', null);

--TABLE DETALLES_PEDIDO--
-- Record 1
INSERT INTO DETALLES_PEDIDO (idDetalle, idPedidos, producto, cantidad, precioUnitario)
VALUES ('1', '28345019', 'Product1', 10, 20.00);
-- Record 2
INSERT INTO DETALLES_PEDIDO (idDetalle, idPedidos, producto, cantidad, precioUnitario)
VALUES ('2', '28345020', 'Product2', 5, 15.50);
-- Record 3
INSERT INTO DETALLES_PEDIDO (idDetalle, idPedidos, producto, cantidad, precioUnitario)
VALUES ('3', '28345021', 'Product3', 8, 10.75);
-- Record 4
INSERT INTO DETALLES_PEDIDO (idDetalle, idPedidos, producto, cantidad, precioUnitario)
VALUES ('4', '28345022', 'Product4', 12, 25.25);
-- Record 5
INSERT INTO DETALLES_PEDIDO (idDetalle, idPedidos, producto, cantidad, precioUnitario)
VALUES ('5', '28345023', 'Product5', 15, 18.90);