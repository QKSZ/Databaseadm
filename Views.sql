
/*Establece el formato de la fecha en dia/mes/año, 
cualquiera de las dos*/
SET DATEFORMAT dmy
SET LANGUAGE spanish

-- A1. SCRIPT DE CREACION DE TABLAS (MODELO DE FACTURACION).
CREATE TABLE Provincia
(
	Cod_Provincia	INT			NOT NULL,
	Nombre			VARCHAR(30)		NULL,	
	CONSTRAINT PK_Provincia PRIMARY KEY(Cod_Provincia)
)
GO

CREATE TABLE Cliente
(
	Id_Cliente	INT			NOT NULL,	
	Nombre		VARCHAR(30)		NULL,
	Apellido	VARCHAR(30)		NULL,
	Cod_Prov	INT		NULL,
	CONSTRAINT PK_Cliente PRIMARY KEY(Id_Cliente),
	CONSTRAINT FK_Cliente_Provincia FOREIGN KEY (Cod_Prov) REFERENCES Provincia(Cod_Provincia)
)
GO

CREATE TABLE Factura
(
	Id_Factura	INT	IDENTITY	NOT NULL,
	Cliente		INT				NULL,	
	Fecha		DateTime		NOT	NULL,
	Tipo_Pago	INT				NOT NULL,
	CONSTRAINT PK_Facturas PRIMARY KEY(Id_Factura),
	CONSTRAINT CH_Tipo_Pago CHECK (Tipo_Pago BETWEEN 1 AND 3) 
)
GO

CREATE TABLE Categoria(
	Id_Categoria int NOT NULL,
	Nombre_Categoria varchar(50) NULL,
 CONSTRAINT PK_Categoria PRIMARY KEY (Id_Categoria ASC)
) 
GO

CREATE TABLE Articulo(
	Id_Articulo int NOT NULL,
	Nombre_Articulo varchar(50) NULL,
	Precio numeric(9,2) NULL,
	Id_Categoria int NOT NULL,
 CONSTRAINT PK_Articulo PRIMARY KEY (Id_Articulo ASC),
 CONSTRAINT FK_Articulo_Categoria FOREIGN KEY(Id_Categoria) REFERENCES Categoria (Id_Categoria)
) 
GO


-- A2. SCRIPT DE INSERCIÓN DE DATOS EN LAS TABLAS (MODELO DE FACTURACION).

CREATE TABLE DetalleFactura(
	Id_Factura	int				NOT NULL,
	Id_Articulo int	NOT NULL,
	Cantidad	numeric(7,0)	NOT NULL,
	Precio		numeric(9,2)	NOT NULL,
 CONSTRAINT PK_Detalle_Factura PRIMARY KEY (Id_Factura, Id_Articulo),
 CONSTRAINT FK_DetalleFactura_Factura FOREIGN KEY(Id_Factura) REFERENCES Factura (Id_Factura)
) 
GO

INSERT INTO Provincia VALUES (1,'San Jose')
INSERT INTO Provincia VALUES (2,'Alajuela')
INSERT INTO Provincia VALUES (3,'Cartago')
INSERT INTO Provincia VALUES (4,'Heredia')
INSERT INTO Provincia VALUES (5,'Guanacaste')
INSERT INTO Provincia VALUES (6,'Puntarenas')
INSERT INTO Provincia VALUES (7,'Limón')
GO

INSERT INTO Cliente VALUES (1000,'Jason','Perez',2)
INSERT INTO Cliente VALUES (2000,'Miguel','Marin',2)
INSERT INTO Cliente VALUES (3000,'Karina','Sanchez',3)
INSERT INTO Cliente VALUES (4000,'Pedro','Castro',1)
INSERT INTO Cliente VALUES (5000,'Juan','Solis',1)
INSERT INTO Cliente VALUES (6000,'Maria','Badilla',6)
INSERT INTO Cliente VALUES (7000,'Ana','Chaves',6)
INSERT INTO Cliente VALUES (8000,'Jose','González',1)
GO

INSERT INTO Factura VALUES (7000,'10/11/2016',1)
INSERT INTO Factura VALUES (5000,'12/11/2016',1)
INSERT INTO Factura VALUES (NULL,'19/11/2016',2)
INSERT INTO Factura VALUES (4000,'25/11/2016',1)
INSERT INTO Factura VALUES (NULL,'25/11/2016',3)

GO
INSERT INTO Categoria (Id_Categoria, Nombre_Categoria) VALUES (1, 'Bebidas')
INSERT INTO Categoria (Id_Categoria, Nombre_Categoria) VALUES (2, 'Lacteos')
INSERT INTO Categoria (Id_Categoria, Nombre_Categoria) VALUES (3, 'Frutas/Verduras')

GO
INSERT Articulo (Id_Articulo, Nombre_Articulo, Precio, Id_Categoria) VALUES (1, 'Cerveza negra Steeleye', 1800, 1)
INSERT Articulo (Id_Articulo, Nombre_Articulo, Precio, Id_Categoria) VALUES (2, 'Queso Mozzarella i', 14500, 2)
INSERT Articulo (Id_Articulo, Nombre_Articulo, Precio, Id_Categoria) VALUES (3, 'Tomates Frescos', 1025, 3)
INSERT Articulo (Id_Articulo, Nombre_Articulo, Precio, Id_Categoria) VALUES (4, 'Cerveza Sasquatch ', 15000, 1)
INSERT Articulo (Id_Articulo, Nombre_Articulo, Precio, Id_Categoria) VALUES (5, 'Crema de almejas estilo Nueva Inglaterra', 9750, 2)
INSERT Articulo (Id_Articulo, Nombre_Articulo, Precio, Id_Categoria) VALUES (6, 'Manzanas', 450, 3)
INSERT Articulo (Id_Articulo, Nombre_Articulo, Precio, Id_Categoria) VALUES (7, 'Vino Côte de Blaye', 25250, 1)
INSERT Articulo (Id_Articulo, Nombre_Articulo, Precio, Id_Categoria) VALUES (8, 'Cerveza Heineken', 2050, 1)
INSERT Articulo (Id_Articulo, Nombre_Articulo, Precio, Id_Categoria) VALUES (9, 'Coca Cola', 575, 1)

GO
INSERT INTO DetalleFactura VALUES(1,2,10,14500)
INSERT INTO DetalleFactura VALUES(1,6,12,400)
INSERT INTO DetalleFactura VALUES(2,2,10,14500)
INSERT INTO DetalleFactura VALUES(2,6,12,400)
INSERT INTO DetalleFactura VALUES(2,1,10,2000)
INSERT INTO DetalleFactura VALUES(2,7,1,18000)


  ALTER TABLE DetalleFactura
      DROP PK_Detalle_Factura
Alter table DetalleFactura alter column Id_Articulo int not null
Alter table DetalleFactura add constraint FK_DetalleFactura foreign key (Id_Articulo) references Articulo (Id_Articulo)
alter table DetalleFactura add constraint PK_Detalle_Factura PRIMARY KEY (Id_Factura, Id_Articulo)



CREATE VIEW FacturasConClientes
AS
	SELECT Id_Factura,Cliente,Fecha,Tipo_Pago FROM Factura where Cliente is not null


	SELECT * FROM FacturasConClientes

	
	
	CREATE VIEW FacturasSinClientes
AS
	SELECT Id_Factura,Fecha,Tipo_Pago FROM Factura where Cliente is null


	SELECT * FROM FacturasSinClientes

	--	//Drop VIEW FacturasSinClientes//--

	CREATE VIEW FacturasMonto
AS
	SELECT P.Id_Factura,P.Fecha,Sum(b.Cantidad*b.Precio) as TotalMonto FROM DetalleFactura B  inner join Factura P  on p.Id_Factura = b.Id_Factura  group by P.Id_Factura,Fecha

	SELECT * FROM FacturasMonto

	Drop view FacturasMonto

	go
	CREATE FUNCTION Fn_Montodelaostia (@NumPedido numeric(10,0)) RETURNS Numeric(10,2)

AS BEGIN 
    DECLARE @Montodelaostia  Numeric(10,2)

     SELECT @Montodelaostia  = Sum([Cantidad] * P.[Precio])
            FROM [DetalleFactura] P INNER JOIN [Factura] A ON P.[Id_Factura] = A.[Id_Factura]
            WHERE A.[Id_Factura] = @NumPedido group by p.Id_Factura
 
    RETURN @Montodelaostia
END

SELECT [dbo].[fn_Montodelaostia](1) as Monto

drop Function Fn_Montodelaostia