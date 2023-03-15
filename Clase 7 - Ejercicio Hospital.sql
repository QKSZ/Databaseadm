
/*Establece el formato de la fecha en dia/mes/a�o, 
cualquiera de las dos*/
SET DATEFORMAT dmy
SET LANGUAGE spanish


/*Instruccion que indica que la proxima consulta 
se ejecutar� hasta que termine de ejecutarse la sentencia anterior*/

CREATE TABLE Departamento
(
	Num_Dpto			INT			NOT NULL,
	Dpto_Nombre			VARCHAR(50)		NULL,
	Localizacion			VARCHAR(50)		NULL,
	CONSTRAINT PK_Departamento PRIMARY KEY(Num_Dpto)
)
GO
CREATE TABLE Empleado
(
	ID_Empleado		INT			NOT NULL,
	Apellido		VARCHAR(50)		NULL,
	Oficio			VARCHAR(50)		NULL,
	Cod_Jefe		INT			NULL,
	Fecha_Ingreso	SMALLDATETIME		NULL,
	Salario			NUMERIC(9,2)	NULL,
	Comision		NUMERIC(9,2) 		NULL,
	Num_Dpto		INT			NULL
	CONSTRAINT PK_Empleado PRIMARY KEY(ID_Empleado),
	CONSTRAINT FK_Empleado_Departamento FOREIGN KEY (Num_Dpto) REFERENCES Departamento(Num_Dpto)
)
GO
CREATE TABLE Hospital
(
	Cod_Hospital		INT			NOT NULL,
	Nombre			VARCHAR(50)		NULL,
	Direccion		VARCHAR(50)		NULL,
	Telefono		VARCHAR(50)		NULL,
	Cant_Camas		INT			NULL,
	CONSTRAINT PK_Hospital PRIMARY KEY(Cod_Hospital)
)
GO
CREATE TABLE Doctor
(
	Num_Doctor		INT			NOT NULL,
	Cod_Hospital		INT			NOT NULL,
	Apellido		VARCHAR(50)		NULL,
	Especialidad		VARCHAR(50)		NULL
	CONSTRAINT PK_Doctor PRIMARY KEY(Num_Doctor),
	CONSTRAINT FK_Doctor_Hospital FOREIGN KEY (Cod_Hospital) REFERENCES Hospital(Cod_Hospital)
)
GO
CREATE TABLE Sala
(
	Cod_Sala		INT			NOT NULL,	
	Cod_Hospital		INT			NOT NULL,
	Nombre			VARCHAR(50)		NULL,
	Cant_Camas		INT			NULL
	CONSTRAINT PK_Sala PRIMARY KEY(Cod_Sala,Cod_Hospital),
	CONSTRAINT FK_Sala_Hospital FOREIGN KEY (Cod_Hospital) REFERENCES Hospital(Cod_Hospital)
)
GO


--***Insertar datos en las tablas de la Base de Datos de ejemplo llamada HOSPITAL***


-- A. DATOS DE EMPLEADOS Y SUS DEPARTAMENTOS (MODELO DE UNA EMPRESA).

--Insertar datos en la table Departamento
INSERT INTO Departamento(Num_Dpto,Dpto_Nombre,Localizacion) VALUES(10,'CONTABILIDAD','SEVILLA') 
INSERT INTO Departamento(Num_Dpto,Dpto_Nombre,Localizacion) VALUES(20,'INVESTIGACI�N','MADRID')
INSERT INTO Departamento(Num_Dpto,Dpto_Nombre,Localizacion) VALUES(30,'VENTAS','BARCELONA')
INSERT INTO Departamento(Num_Dpto,Dpto_Nombre,Localizacion) VALUES(40,'PRODUCCI�N','VALENCIA') 
GO
--Insertar datos en la tabla Empleado
INSERT INTO Empleado( ID_Empleado, Apellido, Oficio, Cod_Jefe, Fecha_Ingreso, Salario, Comision, Num_Dpto)
VALUES (7369,'SANCHEZ','EMPLEADO',7902,'17/12/2010',10400,0,20)
INSERT INTO Empleado( ID_Empleado, Apellido, Oficio, Cod_Jefe, Fecha_Ingreso, Salario, Comision, Num_Dpto)
VALUES(7499,'ARROYO','VENDEDOR',7698,'22/02/2011',208000,39000,30)
INSERT INTO Empleado( ID_Empleado, Apellido, Oficio, Cod_Jefe, Fecha_Ingreso, Salario, Comision, Num_Dpto)
VALUES(7521,'SALAS','VENDEDOR',689,'22/02/2016',162500,65000,30)
INSERT INTO Empleado( ID_Empleado, Apellido, Oficio, Cod_Jefe, Fecha_Ingreso, Salario, Comision, Num_Dpto)
VALUES(7566,'JIMENEZ','DIRECTOR',7839,'02/04/2011',386750,0,20)
INSERT INTO Empleado( ID_Empleado, Apellido, Oficio, Cod_Jefe, Fecha_Ingreso, Salario, Comision, Num_Dpto)
VALUES(7654,'MARTINEZ','VENDEDOR',7698,'28/09/2011',182000,182000,30)
INSERT INTO Empleado( ID_Empleado, Apellido, Oficio, Cod_Jefe, Fecha_Ingreso, Salario, Comision, Num_Dpto)
VALUES(7698,'NEGRINI','DIRECTOR',7839,'01/05/2011',370500,0,30)
INSERT INTO Empleado( ID_Empleado, Apellido, Oficio, Cod_Jefe, Fecha_Ingreso, Salario, Comision, Num_Dpto)
VALUES(7782,'CESPEDES','DIRECTOR',7839,'09/06/2011',318500,0,10)
INSERT INTO Empleado( ID_Empleado, Apellido, Oficio, Cod_Jefe, Fecha_Ingreso, Salario, Comision, Num_Dpto)
VALUES(7788,'NAVARRO','ANALISTA',7566,'30/03/2017',390000,0,20)
INSERT INTO Empleado( ID_Empleado, Apellido, Oficio, Cod_Jefe, Fecha_Ingreso, Salario, Comision, Num_Dpto)
VALUES(7839,'REYES','PRESIDENTE',0,'17/11/2011',650000,0,10)
INSERT INTO Empleado( ID_Empleado, Apellido, Oficio, Cod_Jefe, Fecha_Ingreso, Salario, Comision, Num_Dpto)
VALUES(7844,'TORRES','VENDEDOR',7698,'08/09/2011',195000,0,30)
INSERT INTO Empleado( ID_Empleado, Apellido, Oficio, Cod_Jefe, Fecha_Ingreso, Salario, Comision, Num_Dpto)
VALUES(7876,'ALVARADO','EMPLEADO',7788,'03/05/2017',143000,0,20)
INSERT INTO Empleado( ID_Empleado, Apellido, Oficio, Cod_Jefe, Fecha_Ingreso, Salario, Comision, Num_Dpto)
VALUES(7900,'JIMENEZ','EMPLEADO',7698,'03/12/2015',123500,0,30)
INSERT INTO Empleado( ID_Empleado, Apellido, Oficio, Cod_Jefe, Fecha_Ingreso, Salario, Comision, Num_Dpto)
VALUES(7902,'FERNANDEZ','ANALISTA',7566,'03/12/2011',390000,0,20)
INSERT INTO Empleado( ID_Empleado, Apellido, Oficio, Cod_Jefe, Fecha_Ingreso, Salario, Comision, Num_Dpto)
VALUES(7934,'MU�OZ','EMPLEADO',7782,'23/06/2012',169000,0,10)
INSERT INTO Empleado( ID_Empleado, Apellido, Oficio, Cod_Jefe, Fecha_Ingreso, Salario, Comision, Num_Dpto)
VALUES(7119,'SIERRA','DIRECTOR',7839,'19/11/2013',225000,39000,20)
INSERT INTO Empleado( ID_Empleado, Apellido, Oficio, Cod_Jefe, Fecha_Ingreso, Salario, Comision, Num_Dpto)
VALUES(7322,'GARCIA','EMPLEADO',7119,'12/10/2012',129000,0,20)
GO


-- B. DATOS DE HOSPITALES Y SUS RESPECTIVAS SALAS Y DOCTORES (GRUPOS DE HOSPITALES).

--Insertar datos en la tabla Hospital
INSERT INTO Hospital(Cod_Hospital,Nombre,Direccion,Telefono, Cant_Camas) VALUES(19,'Provincial','O Donell 50','964-4256',502)
INSERT INTO Hospital(Cod_Hospital,Nombre,Direccion,Telefono, Cant_Camas) VALUES(18,'General','Atocha s/n','595-3111',987)
INSERT INTO Hospital(Cod_Hospital,Nombre,Direccion,Telefono, Cant_Camas) VALUES(22,'La Paz','Castellana 1000','923-5411',412)
INSERT INTO Hospital(Cod_Hospital,Nombre,Direccion,Telefono, Cant_Camas) VALUES(45,'San Carlos','Ciudad Universitaria','597-1500',845)
GO
--Insertar datos en la tabla Doctor
INSERT INTO Doctor(Cod_Hospital,Num_Doctor,Apellido,Especialidad) VALUES(22,386,'Cabezas D.','Psiquiatr�a')
INSERT INTO Doctor(Cod_Hospital,Num_Doctor,Apellido,Especialidad) VALUES(22,398,'Bustos D.','Urolog�a')
INSERT INTO Doctor(Cod_Hospital,Num_Doctor,Apellido,Especialidad) VALUES(19,435,'L�pez A.','Cardiolog�a')
INSERT INTO Doctor(Cod_Hospital,Num_Doctor,Apellido,Especialidad) VALUES(22,453,'G�mez D.','Pediatr�a')
INSERT INTO Doctor(Cod_Hospital,Num_Doctor,Apellido,Especialidad) VALUES(45,522,'Adams C.','Neurolog�a')
INSERT INTO Doctor(Cod_Hospital,Num_Doctor,Apellido,Especialidad) VALUES(18,585,'Masis G.','Ginecolog�a')
INSERT INTO Doctor(Cod_Hospital,Num_Doctor,Apellido,Especialidad) VALUES(45,607,'Chaves P.','Pediatr�a')
INSERT INTO Doctor(Cod_Hospital,Num_Doctor,Apellido,Especialidad) VALUES(18,982,'Carvajal R.','Cardiolog�a')
GO 
--Insertar datos en la tabla Sala
INSERT INTO SALA VALUES(1,22,'Recuperaci�n',10)
INSERT INTO SALA VALUES(1,45,'Recuperaci�n',15)
INSERT INTO SALA VALUES(2,22,'Maternidad',34)
INSERT INTO SALA VALUES(2,45,'Maternidad',24)
INSERT INTO SALA VALUES(3,19,'Cuidados Intensivos',21)
INSERT INTO SALA VALUES(3,18,'Cuidados Intensivos',10)
INSERT INTO SALA VALUES(4,18,'Cardiolog�a',53)
INSERT INTO SALA VALUES(4,45,'Cardiolog�a',55)
INSERT INTO SALA VALUES(6,19,'Psiqui�tricos',67)
INSERT INTO SALA VALUES(6,22,'Psiqui�tricos',118) 
GO

