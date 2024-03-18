--Un club dicta clases de distintos deportes a sus socios. El club tiene una tabla llamada "inscriptos" en la cual almacena el número de "socio", el código del deporte en el cual se inscribe y la cantidad de cuotas pagas (desde 0 hasta 10 que es el total por todo el año), y una tabla denominada "socios" en la que guarda los datos personales de cada socio.

--1- Elimine las tablas:

 drop table inscriptos;
 drop table socios;

--2- Cree las tablas:

 create table socios(
  numero number(5),
  documento char(8),
  nombre varchar2(30),
  domicilio varchar2(30),
  primary key (numero)
 );
 
 create table inscriptos (
  numerosocio number(5),
  deporte varchar2(20) not null,
  cuotas number(2) default 0,
  constraint CK_inscriptos_cuotas
   check (cuotas>=0 and cuotas<=10),
  primary key(numerosocio,deporte),
  constraint FK_inscriptos_socio
   foreign key (numerosocio)
   references socios(numero)
   on delete cascade
 );

--3- Ingrese algunos registros:

 insert into socios values(1,'23333333','Alberto Paredes','Colon 111');
 insert into socios values(2,'24444444','Carlos Conte','Sarmiento 755');
 insert into socios values(3,'25555555','Fabian Fuentes','Caseros 987');
 insert into socios values(4,'26666666','Hector Lopez','Sucre 344');

 insert into inscriptos values(1,'tenis',1);
 insert into inscriptos values(1,'basquet',2);
 insert into inscriptos values(1,'natacion',1);
 insert into inscriptos values(2,'tenis',9);
 insert into inscriptos values(2,'natacion',1);
 insert into inscriptos values(2,'basquet',default);
 insert into inscriptos values(2,'futbol',2);
 insert into inscriptos values(3,'tenis',8);
 insert into inscriptos values(3,'basquet',9);
 insert into inscriptos values(3,'natacion',0);
 insert into inscriptos values(4,'basquet',10);

SELECT * FROM inscriptos;
SELECT * FROM socios;


--4- Muestre el número de socio, el nombre del socio 
--y el deporte en que está inscripto con un join de ambas tablas
SELECT s.numero, s.nombre, i.deporte FROM socios S
JOIN inscriptos I 
ON I.numerosocio = S.numero;

--5- Muestre los socios que se serán compañeros en tenis 
--y también en natación (empleando subconsulta)
SELECT DISTINCT nombre FROM socios S
JOIN inscriptos I 
ON I.numerosocio = S.numero
WHERE i.deporte = ANY 
(SELECT deporte
FROM inscriptos
WHERE deporte = 'natacion' OR deporte = 'tenis');

--6- Vea si el socio 1 se ha inscripto en algún deporte 
--en el cual se haya inscripto el socio 2
SELECT  deporte AS deportesRepe FROM inscriptos 
WHERE numerosocio = 1 AND 
deporte = ANY 
(SELECT deporte FROM inscriptos 
WHERE numerosocio=2);

--7- Realice la misma consulta anterior pero empleando "in" 
--en lugar de "=any"
SELECT  deporte AS deportesRepe FROM inscriptos 
WHERE numerosocio = 1 AND 
deporte IN 
(SELECT deporte FROM inscriptos 
WHERE numerosocio=2);

--8- Obtenga el mismo resultado anterior pero empleando join
SELECT  i.deporte AS deportesRepe FROM socios S
JOIN inscriptos I 
ON I.numerosocio = S.numero
WHERE i.numerosocio = 1 

AND i.deporte IN 
(SELECT i.deporte FROM socios S
JOIN inscriptos I 
ON I.numerosocio = S.numero
WHERE i.numerosocio=2);

--solucion
select i1.deporte
  from inscriptos i1
  join inscriptos i2
  on i1.deporte=i2.deporte
  where i1.numerosocio=1 and
  i2.numerosocio=2;

--9- Muestre los deportes en los cuales el socio 2 pagó más 
--cuotas que ALGUN deporte en los que se inscribió el socio 1
SELECT  
i.deporte AS deportesRepe FROM socios S
JOIN inscriptos I 
ON I.numerosocio = S.numero
WHERE i.numerosocio = 1 AND 
i.deporte = ANY
(SELECT i.deporte FROM socios S
JOIN inscriptos I 
ON I.numerosocio = S.numero
WHERE i.numerosocio > );

--9- Muestre los deportes en los cuales el socio 2 pagó más cuotas que ALGUN deporte en
-- los que se inscribió el socio 1
SELECT deporte FROM inscriptos
WHERE  numerosocio = 2 AND
cuotas > ANY
(SELECT CUOTAs FROM INSCRIPTOS WHERE numerosocio=1);

--10- Realice la misma consulta anterior pero empleando "some" en lugar de "any"
SELECT deporte FROM inscriptos
WHERE  numerosocio = 2 AND
cuotas > SOME
(SELECT CUOTAs FROM INSCRIPTOS WHERE numerosocio=1);

--11- Muestre los deportes en los cuales el socio 2 pagó más cuotas que TODOS 
--los deportes en que se inscribió el socio 1
SELECT deporte FROM inscriptos
WHERE  numerosocio = 2 AND
cuotas > ALL
(SELECT CUOTAs FROM INSCRIPTOS WHERE numerosocio=1);

--12- Cuando un socio no ha pagado la matrícula de alguno de los deportes en que se ha inscripto, 
--se lo borra de la inscripción de todos los deportes. 
--Elimine todos los socios que no pagaron ninguna cuota en algún deporte (cuota=0)
DELETE FROM INSCRIPTOS 
WHERE NUMEROSOCIO = ANY
(SELECT NUMEROSOCIO FROM INSCRIPTOS
WHERE CUOTAS=0);

ROLLBACK;