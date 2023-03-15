Use AlejandroO 


Create table Paises (
ID_Pais varchar (10) not null,
nombre varchar (10) null,
constraint FK_ID_Pais primary key (ID_Pais)
)
go



Create table Editorial (
Cod_editorial varchar (10) not null,
nombre varchar (15) null,
Pais varchar (10) not null,
constraint PK_Editorial primary key  (Cod_editorial),
constraint FK_Paises foreign key (Pais) references Paises (ID_Pais)
)

go

Create table Libro (
ISBN varchar (15) not null,
Titulo varchar (15) null,
Paginas int null,
YearPublication date null,
Editorial varchar (10) not null,
constraint PK_ISBN primary key (ISBN),
constraint FK_Editorial foreign key (Editorial) references Editorial (Cod_editorial)

 )
go
Create Table Autor (
Cod_Autor varchar (10) not null,
Nom_Autor varchar (10) null,
Pais varchar (10) not null,
constraint PK_Cod_Autor primary key (Cod_Autor),
constraint Fk_Pais2 foreign key (Pais) references Paises (ID_Pais)
)

go 

Create Table RelacionLibro (
Cod_Autor varchar (10),
ISBN varchar (15),
constraint PK_PrRelacion primary key (Cod_Autor,ISBN),
constraint Fk_Libro3 foreign key (ISBN) references Libro (ISBN),
constraint FK_Autor foreign key (Cod_Autor) references Autor(Cod_Autor)
)



Select C.[ISBN],C.Titulo,O.[Cod_Autor],O.[Nom_Autor]  from Libro C inner join RelacionLibro R on C.ISBN = R.ISBN  inner join Autor O on  R.Cod_Autor = O.Cod_Autor

Select P.[Cod_editorial],P.[nombre],L.[ISBN],L.[Titulo]  from Editorial P inner join Libro L on P.Cod_editorial= L.Editorial

Select SUM(ISBN) from RelacionLibro where Cod_Autor = 'x' 
 
