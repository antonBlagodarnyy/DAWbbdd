--DROPS PARA LIBERAR LA BD DE LOS EJERCICIOS DE CLASE
DROP TABLE ALUMNO;
DROP TABLE CURSO;
DROP TABLE PROFESOR;
------------------------------------------------------------------------------------------------------------------------------------------------------------
--1)
--CREAMOS LA TABLA
CREATE TABLE ALUMNO (
CodAlumno NUMBER,--pk
DNI VARCHAR(9),--pk
NombreAlumno VARCHAR(40),
Apellido1 VARCHAR(50),
Apellido2 VARCHAR(50),
Direccion VARCHAR (100),
Sexo VARCHAR (1) CHECK (Sexo IN ('H','M')),
FechaNac DATE,
Curso NUMBER--fk
);
    --aniadimos pks
ALTER TABLE ALUMNO
ADD CONSTRAINT pk_alumno PRIMARY KEY (CodAlumno, DNI);

--CREAMOS LA TABLA Y PK
CREATE TABLE CURSO (
CodCurso NUMBER CONSTRAINT pk_curso PRIMARY KEY,--pk
NombreCurso VARCHAR(35),
Profesor VARCHAR(9),--fk
MaximoAlumnos NUMBER,
FechaInicio DATE,
FechaFin DATE ,
NumHoras NUMBER);

--CREAMOS LA TABLA Y PK
CREATE TABLE PROFESOR (
DNIProfesor VARCHAR(9) CONSTRAINT pk_profesor PRIMARY KEY,--pk
NombrePro VARCHAR(45),
Apellido1 VARCHAR(50),
Apellido2 VARCHAR(50),
Direccion VARCHAR(100),
Titulo VARCHAR (55),
Cuota NUMBER(4,2));
    --leyendo el enunciado he decidido cambiar el valor de cuota, 4 digitos enteros es exagerado.
    ALTER TABLE PROFESOR
    MODIFY Cuota NUMBER(2);
    
--ANIADIMOS FK
    --ALUMNO
ALTER TABLE ALUMNO
ADD CONSTRAINT fk_alumno_curso FOREIGN KEY (Curso) REFERENCES CURSO (CodCurso);
    --CURSO
ALTER TABLE CURSO
ADD CONSTRAINT fk_curso_profesor FOREIGN KEY (Profesor) REFERENCES PROFESOR (DNIProfesor);
----------------------------------------------------------------------------------------------------------------------------------------------------

--2)
    --a
    ALTER TABLE CURSO
    MODIFY NumHoras NOT NULL;
    
    --b
    ALTER TABLE PROFESOR
    MODIFY Cuota NOT NULL;
    
    --c
    ALTER TABLE CURSO
    MODIFY NombreCurso UNIQUE;
    ALTER TABLE PROFESOR
    MODIFY NombrePro UNIQUE;
    
    --d
    
    
    --e
        --hecho con las pk ya definidas
        
    --f
    ALTER TABLE CURSO 
    ADD CONSTRAINT fechaMenor CHECK (FechaInicio < FechaFin);
    
    --g
    ALTER TABLE PROFESOR
    RENAME COLUMN Cuota TO Tarifa;
    
    --h
        --hecho con las fk ya definidas
        
    --i
    ALTER TABLE PROFESOR
    ADD Edad Number;
    
    --j
    ALTER TABLE PROFESOR 
    ADD CONSTRAINT edad_mayor_de CHECK (Edad>25);
    ALTER TABLE PROFESOR 
    ADD CONSTRAINT edad_menor_de CHECK (Edad<65);
    
    --k
    ALTER TABLE CURSO
    ADD CONSTRAINT alumnos_minimos CHECK (MaximoAlumnos > 99);
    
    --l
    ALTER TABLE CURSO
    ADD CONSTRAINT horas CHECK (NumHoras > 60);
    
    --m
    ALTER TABLE ALUMNO
    DROP CONSTRAINT SYS_C008542;--he revisado el nombre de constraint en las conexiones de la bd
    
    --n
    ALTER TABLE PROFESOR
    DROP CONSTRAINT SYS_C008549;--he revisado el nombre de constraint en las conexiones de la bd
    
    --o
    ALTER TABLE CURSO
   MODIFY FechaInicio NOT NULL;
---------------------------------------------------------------------------------------------------------------------------------------------------

--3)
 --PROFESOR
 INSERT INTO PROFESOR(DNIProfesor,  NombrePro,Apellido1,Apellido2,Direccion,Titulo,Tarifa)
 VALUES ( '31906229R', 'JuanLuis','Guitierrez','Gonzalez','Avda/Direccion','Doctorado',25);
 
  INSERT INTO PROFESOR(DNIProfesor,  NombrePro,Apellido1,Apellido2,Direccion,Titulo,Tarifa)
 VALUES ( '31978235R', 'JoseLuis','Buitierrez','Alvarez','Calle/Direccion','Master',24);
 
  INSERT INTO PROFESOR(DNIProfesor,  NombrePro,Apellido1,Apellido2,Direccion,Titulo,Tarifa)
 VALUES ( '71906229J', 'Jaime','Escudo','Manolo','Avda/Alemania','Bachelors',23);
 
 --CURSO
  INSERT INTO CURSO(CodCurso,NombreCurso,Profesor,MaximoAlumnos,FechaInicio,FechaFin,NumHoras)
 VALUES ( 4, 'Algebra', '71906229J' ,200 , TO_DATE('2022-27-12','yyyy-dd-mm'),TO_DATE('2023-28-01','yyyy-dd-mm'),70);
 
 INSERT INTO CURSO(CodCurso,NombreCurso,Profesor,MaximoAlumnos,FechaInicio,FechaFin,NumHoras)
 VALUES ( 5, 'Matematicas','31978235R',200,TO_DATE('2022-27-12','yyyy-dd-mm'),TO_DATE('2023-28-01','yyyy-dd-mm'),70);
 
 INSERT INTO CURSO(CodCurso,NombreCurso,Profesor,MaximoAlumnos,FechaInicio,FechaFin,NumHoras)
 VALUES ( 6, 'Geografia','31906229R',200,TO_DATE('2022-27-12','yyyy-dd-mm'),TO_DATE('2023-28-01','yyyy-dd-mm'),70);
 
 --ALUMNO
  INSERT INTO ALUMNO (CodAlumno,DNI,NombreAlumno,Apellido1,Apellido2,Direccion,Sexo,FechaNac,Curso)
 VALUES ( 1234, '31906199R', 'Jaimito','Jaimon','Gutierrez','Avda/Direccion','X',TO_DATE('1998-27-12','yyyy-dd-mm'),4);
 
   INSERT INTO ALUMNO (CodAlumno,DNI,NombreAlumno,Apellido1,Apellido2,Direccion,Sexo,FechaNac,Curso)
 VALUES ( 5678, '31906159R', 'Juanse','Jaimon','Gutierrez','Avda/Direccion','X',TO_DATE('1998-27-12','yyyy-dd-mm'),4);
 
   INSERT INTO ALUMNO (CodAlumno,DNI,NombreAlumno,Apellido1,Apellido2,Direccion,Sexo,FechaNac,Curso)
 VALUES ( 12, '31906799R', 'Jorge','Fulanito','Gutierrez','Avda/Direccion','X',TO_DATE('1998-27-12','yyyy-dd-mm'),4);
 
