--Borrado tabla Trabajadores
DROP TABLE Trabajadores cascade constraints;

-- Creación de la primera tabla: Trabajadores
CREATE TABLE Trabajadores (
    id_trabajador NUMBER PRIMARY KEY,
    nombre VARCHAR2(50),
    apellido VARCHAR2(50),
    edad NUMBER,
    salario NUMBER
);

-- Inserciones en la tabla Trabajadores
INSERT INTO Trabajadores (id_trabajador, nombre, apellido, edad, salario) VALUES (1, 'Juan', 'Pérez', 30, 30000);
INSERT INTO Trabajadores (id_trabajador, nombre, apellido, edad, salario) VALUES (2, 'María', 'González', 25, 28000);
INSERT INTO Trabajadores (id_trabajador, nombre, apellido, edad, salario) VALUES (3, 'Pedro', 'Sánchez', 35, 35000);
INSERT INTO Trabajadores (id_trabajador, nombre, apellido, edad, salario) VALUES (4, 'Laura', 'López', 28, 32000);
INSERT INTO Trabajadores (id_trabajador, nombre, apellido, edad, salario) VALUES(5, 'Pablo', NULL, 31, 34000);
INSERT INTO Trabajadores (id_trabajador, nombre, apellido, edad, salario) VALUES (6, 'Ana', 'Martínez', 32, 38000);
INSERT INTO Trabajadores (id_trabajador, nombre, apellido, edad, salario) VALUES (7, 'Carlos', 'Rodríguez', 40, 40000);
INSERT INTO Trabajadores (id_trabajador, nombre, apellido, edad, salario) VALUES (8, 'Sofía', 'Hernández', 27, 29000);
INSERT INTO Trabajadores (id_trabajador, nombre, apellido, edad, salario) VALUES (9, 'Diego', 'Fernández', 29, 31000);
INSERT INTO Trabajadores (id_trabajador, nombre, apellido, edad, salario) VALUES (10, 'Elena', NULL, 33, 36000);
INSERT INTO Trabajadores (id_trabajador, nombre, apellido, edad, salario) VALUES (11, 'Pablo', 'Díaz', 31, 34000);
INSERT INTO Trabajadores (id_trabajador, nombre, apellido, edad, salario) VALUES (12, 'Emi', 'Díaz', 31, 34000);

-- Creación de la segunda tabla: Departamentos
DROP TABLE DEPARTAMENTOS;

CREATE TABLE Departamentos (
    id_departamento NUMBER PRIMARY KEY,
    nombre_departamento VARCHAR2(50),
    ubicacion VARCHAR2(100)
);

-- Inserciones en la tabla Departamentos
INSERT INTO Departamentos (id_departamento, nombre_departamento, ubicacion) VALUES (1, 'Ventas', 'Madrid');
INSERT INTO Departamentos (id_departamento, nombre_departamento, ubicacion) VALUES (2, 'Recursos Humanos', 'Barcelona');
INSERT INTO Departamentos (id_departamento, nombre_departamento, ubicacion) VALUES (3, 'Tecnología', 'Valencia');
INSERT INTO Departamentos (id_departamento, nombre_departamento, ubicacion) VALUES (4, 'Contabilidad', 'Sevilla');
INSERT INTO Departamentos (id_departamento, nombre_departamento, ubicacion) VALUES (5, 'Marketing', 'Bilbao');
INSERT INTO Departamentos (id_departamento, nombre_departamento, ubicacion) VALUES (6, 'Logística', 'Málaga');
INSERT INTO Departamentos (id_departamento, nombre_departamento, ubicacion) VALUES (7, 'Producción', 'Alicante');
INSERT INTO Departamentos (id_departamento, nombre_departamento, ubicacion) VALUES (8, 'Calidad', 'Zaragoza');
INSERT INTO Departamentos (id_departamento, nombre_departamento, ubicacion) VALUES (9, 'Legal', 'Valladolid');
INSERT INTO Departamentos (id_departamento, nombre_departamento, ubicacion) VALUES (10, 'Finanzas', 'Murcia');
INSERT INTO Departamentos (id_departamento, nombre_departamento, ubicacion) VALUES (11, 'Finanzas', 'Almería');

--1
SELECT *
FROM trabajadores
ORDER BY salario DESC;

--2
SELECT DISTINCT nombre_departamento
FROM Departamentos;



--3
SELECT *
FROM trabajadores
WHERE salario > 35000 AND salario < 40000;

--4
SELECT *
FROM trabajadores
WHERE nombre LIKE 'J%';

--5
SELECT *
FROM trabajadores
WHERE apellido IS NULL;

--6
SELECT *
FROM trabajadores
WHERE edad BETWEEN 28 AND 33;

--7
SELECT COUNT(*) 
FROM trabajadores;

--8
SELECT AVG(salario)
FROM trabajadores;

--9
SELECT SUM(salario)
FROM trabajadores;

--10
SELECT MAX(salario) , MIN(salario)
FROM trabajadores;