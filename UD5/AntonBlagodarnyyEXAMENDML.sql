-- Creación de la tabla de sedes
drop table sedes cascade constraints;
CREATE TABLE sedes (
    idsede NUMBER PRIMARY KEY,
    nombre VARCHAR(50),
    ubicacion VARCHAR(100)
);

-- Creación de la tabla de técnicos
drop table tecnicos cascade constraints;
CREATE TABLE tecnicos (
    idtecnico NUMBER PRIMARY KEY,
    nombre VARCHAR(50),
    apellido1 VARCHAR(50),
    apellido2 VARCHAR(50),
    salario NUMBER(6,2),
    idsede NUMBER,
    CONSTRAINT fk_sede_tecnico FOREIGN KEY (idsede) REFERENCES sedes(idsede)
);

-- Creación de la tabla de asignaciones de técnicos a sedes
drop table asignaciones cascade constraints;
CREATE TABLE asignaciones (
    idasignacion NUMBER PRIMARY KEY,
    idtecnico NUMBER,
    idsede NUMBER,
    fecha_inicio DATE,
    fecha_fin DATE,
    CONSTRAINT fk_tecnico FOREIGN KEY (idtecnico) REFERENCES tecnicos(idtecnico),
    CONSTRAINT fk_sede_asignacion FOREIGN KEY (idsede) REFERENCES sedes(idsede)
);


INSERT INTO tecnicos (idtecnico, nombre, apellido1, apellido2, salario, idsede) VALUES (1, 'juan', 'perez', 'gomez', 2500.00, 1);
INSERT INTO tecnicos (idtecnico, nombre, apellido1, apellido2, salario, idsede) VALUES (2, 'maria', 'lopez', 'fernandez', 2800.00, 2);
INSERT INTO tecnicos (idtecnico, nombre, apellido1, apellido2, salario, idsede) VALUES (3, 'carlos', 'garcia', 'martinez', 2600.00, 1);
INSERT INTO tecnicos (idtecnico, nombre, apellido1, apellido2, salario, idsede) VALUES (4, 'JUAN', 'PEREZ', 'GOMEZ', 3000.00, 3);
INSERT INTO tecnicos (idtecnico, nombre, apellido1, apellido2, salario, idsede) VALUES (5, 'MARIA', 'LOPEZ', 'FERNANDEZ', 3200.00, 2);
INSERT INTO tecnicos (idtecnico, nombre, apellido1, apellido2, salario, idsede) VALUES (6, 'Pedro', 'gonzalez', 'Ruiz', 2900.00, 3);
INSERT INTO tecnicos (idtecnico, nombre, apellido1, apellido2, salario, idsede) VALUES (7, 'LUISA', 'pérez', 'GARCIA', 2700.00, 1);
INSERT INTO tecnicos (idtecnico, nombre, apellido1, apellido2, salario, idsede) VALUES (8, 'ana', 'SANCHEZ', 'Gonzalez', 3100.00, 2);
INSERT INTO tecnicos (idtecnico, nombre, apellido1, apellido2, salario, idsede) VALUES (9, 'Antonio', 'MARTÍNEZ', 'Fernández', 2800.00, 1);
INSERT INTO tecnicos (idtecnico, nombre, apellido1, apellido2, salario, idsede) VALUES (10, 'luis', 'ramirez', 'sanchez', 2600.00, 3);
INSERT INTO tecnicos (idtecnico, nombre, apellido1, apellido2, salario, idsede) VALUES (11, 'sofia', 'hernandez', 'rodriguez', 3000.00, 1);
INSERT INTO tecnicos (idtecnico, nombre, apellido1, apellido2, salario, idsede) VALUES (12, 'pablo', 'moreno', 'gutierrez', 2900.00, 2);
INSERT INTO tecnicos (idtecnico, nombre, apellido1, apellido2, salario, idsede) VALUES (13, 'Rosa', 'Martinez', 'Lopez', 2700.00, NULL);
INSERT INTO tecnicos (idtecnico, nombre, apellido1, apellido2, salario, idsede) VALUES (14, 'Daniel', 'Gonzalez', 'Ruiz', 2800.00, NULL);
INSERT INTO tecnicos (idtecnico, nombre, apellido1, apellido2, salario, idsede) VALUES (15, 'Juan', NULL, 'Gomez', 2500.00, 1);
INSERT INTO tecnicos (idtecnico, nombre, apellido1, apellido2, salario, idsede) VALUES (16, NULL, 'Lopez', 'Fernandez', 2800.00, 2);
INSERT INTO tecnicos (idtecnico, nombre, apellido1, apellido2, salario, idsede) VALUES (17, 'Maria', NULL, 'Martinez', 2600.00, 1);



INSERT INTO sedes (idsede, nombre, ubicacion) VALUES (1, 'Sede Principal', 'Calle Principal 123, Ciudad Principal');
INSERT INTO sedes (idsede, nombre, ubicacion) VALUES (2, 'Sucursal Norte', 'Avenida Norte 456, Ciudad Principal');
INSERT INTO sedes (idsede, nombre, ubicacion) VALUES (3, 'Sucursal Sur', 'Carrera Sur 789, Ciudad Principal');
INSERT INTO sedes (idsede, nombre, ubicacion) VALUES (4, 'Oficina Central', 'Plaza Central 001, Ciudad Principal');
INSERT INTO sedes (idsede, nombre, ubicacion) VALUES (5, 'Sede Central', 'Calle Central 789, Ciudad Secundaria');
INSERT INTO sedes (idsede, nombre, ubicacion) VALUES (6, 'Sucursal Este', 'Avenida Este 012, Ciudad Secundaria');
INSERT INTO sedes (idsede, nombre, ubicacion) VALUES (7, 'Sucursal Oeste', 'Carrera Oeste 345, Ciudad Secundaria');
INSERT INTO sedes (idsede, nombre, ubicacion) VALUES (8, 'Oficina Principal', 'Plaza Principal 567, Ciudad Terciaria');
INSERT INTO sedes (idsede, nombre, ubicacion) VALUES (9, 'Sede Principal', 'Calle Principal 890, Ciudad Terciaria');

-- Registros de asignaciones de técnicos a sedes
INSERT INTO asignaciones (idasignacion, idtecnico, idsede, fecha_inicio, fecha_fin) VALUES (1, 1, 1, '01/01/2024', '01/03/2024');
INSERT INTO asignaciones (idasignacion, idtecnico, idsede, fecha_inicio, fecha_fin) VALUES (2, 2, 2, '01/02/2024', '01/04/2024');
INSERT INTO asignaciones (idasignacion, idtecnico, idsede, fecha_inicio, fecha_fin) VALUES (3, 3, 3, '01/03/2024', '01/05/2024');
INSERT INTO asignaciones (idasignacion, idtecnico, idsede, fecha_inicio, fecha_fin) VALUES (4, 4, 4, '01/04/2024', '01/06/2024');
INSERT INTO asignaciones (idasignacion, idtecnico, idsede, fecha_inicio, fecha_fin) VALUES (5, 5, 5, '01/05/2024', '01/07/2024');
INSERT INTO asignaciones (idasignacion, idtecnico, idsede, fecha_inicio, fecha_fin) VALUES (6, 6, 6, '01/06/2024', '01/08/2024');
INSERT INTO asignaciones (idasignacion, idtecnico, idsede, fecha_inicio, fecha_fin) VALUES (7, 7, 7, '01/07/2024', '01/09/2024');
INSERT INTO asignaciones (idasignacion, idtecnico, idsede, fecha_inicio, fecha_fin) VALUES (8, 8, 8, '01/08/2024', '01/10/2024');
INSERT INTO asignaciones (idasignacion, idtecnico, idsede, fecha_inicio, fecha_fin) VALUES (9, 9, 9, '01/09/2024', '01/11/2024');
INSERT INTO asignaciones (idasignacion, idtecnico, idsede, fecha_inicio, fecha_fin) VALUES (10, 10, 1, '01/10/2024', '01/12/2024');
INSERT INTO asignaciones (idasignacion, idtecnico, idsede, fecha_inicio, fecha_fin) VALUES (11, 11, 2, '01/11/2024', '01/01/2025');
INSERT INTO asignaciones (idasignacion, idtecnico, idsede, fecha_inicio, fecha_fin) VALUES (12, 12, 3, '01/12/2024', '01/02/2025');
INSERT INTO asignaciones (idasignacion, idtecnico, idsede, fecha_inicio, fecha_fin) VALUES (13, 15, 1, '01/01/2024', '01/03/2024');
INSERT INTO asignaciones (idasignacion, idtecnico, idsede, fecha_inicio, fecha_fin) VALUES (14, 16, 2, '01/02/2024', '01/04/2024');
INSERT INTO asignaciones (idasignacion, idtecnico, idsede, fecha_inicio, fecha_fin) VALUES (15, 17, 3, '01/03/2024', '01/05/2024');

-------EXAMEN------
SELECT * FROM TECNICOS;

SELECT * FROM SEDES;

SELECT * FROM ASIGNACIONES;

SELECT * FROM TECNICOS T
JOIN ASIGNACIONES A 
ON A.idtecnico = t.idtecnico
JOIN SEDES S
ON S.IDSEDE = A.IDSEDE;

--1)
SELECT salario FROM TECNICOS
ORDER BY salario ASC FETCH FIRST ROW ONLY;

--2)
SELECT * FROM TECNICOS T
JOIN ASIGNACIONES A
ON A.idasignacion=T.idtecnico
WHERE fecha_fin < TO_DATE('01/04/24');

--3)
SELECT t.nombre || ' ' ||t.apellido1 || ' ' || t.apellido2 AS nombre_tecnico , a.fecha_inicio AS fecha_inicio, s.nombre AS nombre_sede from TECNICOS T
JOIN ASIGNACIONES A 
ON A.idtecnico = t.idtecnico
JOIN SEDES S
ON S.IDSEDE = A.IDSEDE;

--4)
CREATE OR REPLACE VIEW ejercicio4 (nombre,salario) AS
SELECT nombre , salario FROM TECNICOS;

SELECT * FROM ejercicio4;

--5)
SELECT salario FROM TECNICOS
WHERE salario IN (SELECT salario FROM TECNICOS ORDER BY salario DESC ) ;

--6)
SELECT * FROM TECNICOS T
JOIN SEDES S
ON S.idsede = t.idsede
WHERE s.ubicacion='Carrera Oeste 345, Ciudad Secundaria' AND
    t.salario BETWEEN 2600 AND 2750;

--7)
SELECT * FROM TECNICOS
WHERE salario > (SELECT AVG(salario) FROM TECNICOS);

--8)
SELECT s.nombre FROM SEDES S
JOIN TECNICOS T
ON s.idsede = t.idsede
WHERE s.nombre in(SELECT COUNT(idtecnico) ORDER BY COUNT(idtecnico) desc  FETCH FIRST ROW ONLY) 
OR s.nombre in(SELECT COUNT(idtecnico) FROM SEDES FETCH LAST ROW ONLY);


--9)
CREATE OR REPLACE VIEW nombre_sede, numero_tecnicos, salario_promedio AS  
SELECT  s.nombre,  COUNT(t.idtecnico), AVG(t.salario)
FROM SEDES S
JOIN TECNICOS T
ON S.IDSEDE=T.IDSEDE
GROUP BY s.nombre;

SELECT  s.nombre,  COUNT(t.idtecnico), AVG(t.salario)
FROM SEDES S
JOIN TECNICOS T
ON S.IDSEDE=T.IDSEDE
GROUP BY s.nombre;

--10)
SELECT S.NOMBRE, COUNT(t.idtecnico) AS tecnicos_asignados FROM SEDES S
JOIN TECNICOS T
ON T.IDSEDE= S.IDSEDE
GROUP BY S.NOMBRE
HAVING COUNT(t.idtecnico) >1;

--11
SELECT t.idtecnico as idtecnico, t.nombre||' '||t.apellido1||' '||t.apellido2 as nombre_completo, salario, fecha_inicio, fecha_fin FROM TECNICOS T
JOIN ASIGNACIONES A
ON A.IDTECNICO = T.IDTECNICO
JOIN SEDES S
ON S.IDSEDE=A.IDSEDE
WHERE s.nombre='Sede Principal';

--12)
SELECT INITCAP(nombre ||' '|| SUBSTR(apellido2 ,1,3))AS nombre_tecnico FROM TECNICOS;

--13)
SELECT  s.nombre AS sede, SUM(salario) AS salario_total FROM SEDES S
lEFT JOIN TECNICOS T--left join para ver las sedes sin salario. Sin el left join solo imprime las que lo tienen
ON T.IDSEDE = S.IDSEDE
GROUP BY s.nombre;

--14)
SELECT idtecnico, salario FROM TECNICOS
WHERE idtecnico NOT IN (SELECT idtecnico FROM ASIGNACIONES);

--15)
CREATE OR REPLACE VIEW ejercicio15 (nombre_tecnico, nombre_sede, salariotec) AS
SELECT nombre, idsede, salario FROM TECNICOS;

SELECT * FROM ejercicio15;

--16)
SELECT s.nombre, SUM(salario) FROM SEDES S
LEFT JOIN TECNICOS T 
ON T.IDSEDE = S.IDSEDE
GROUP BY s.nombre
ORDER BY SUM(salario)DESC;

--17)
SELECT COUNT(*) AS numero_tecnicos FROM TECNICOS
WHERE salario>2999;

--18)
SELECT DISTINCT s.idsede FROM sedes s
join tecnicos t 
on t.idsede= s.idsede
where t.salario > (select AVG(salario) FROM TECNICOS);


--19)
SELECT DISTINCT s.nombre, s.ubicacion FROM sedes s
join tecnicos t 
on t.idsede= s.idsede
where t.salario > (select AVG(salario) FROM TECNICOS);

--20)
SELECT T.NOMBRE FROM TECNICOS T

JOIN ASIGNACIONES A
ON A.idtecnico=t.idtecnico
JOIN SEDES S 
ON A.IDSEDE = S.IDSEDE

WHERE S.ubicacion LIKE '%Ciudad Principal';
´