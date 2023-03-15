
--SELECCIONAR Y MOSTRAR
Use Choclo
Select * From [dbo].[Empleado] --no se recomienda
Select [ID_Empleado],[Apellido],[Oficio],[Cod_Jefe],[Fecha_Ingreso],[Salario],[Comision],[Num_Dpto] From [dbo].[Empleado]


--/*Mostrar ID , Apellido,Oficio,fecha ingreso de todods los empleados./*

Select [ID_Empleado],[Apellido],[Oficio],[Cod_Jefe],[Fecha_Ingreso] From [dbo].[Empleado]

select [ID_Empleado],[Apellido] AS Apell1,[Oficio],CONVERT (varchar (10),[Fecha_Ingreso],103) As Fecha_de_Ingreso From [dbo]. [Empleado]

--AS se usa para renombrar una Columna
--3 Mostrar el apellido ,oficio,salario,y el salario anueal para aquellos empleados con comision mayor de 100.000.
Select [Apellido],[Oficio],[Salario],([Salario]*12) As Salario_Anual,[Comision] From [dbo].[Empleado] Where [Comision] >100000

--Mostrar apellido oficio salario y slario anual que supere 2.200.000
Select [Apellido],[Oficio],[Salario],([Salario]*12) As Salario_Anual,[Comision] From [dbo].[Empleado] Where ([Salario]*12) >2200000

--Mostrar el apellido ,oficio ,salario y el salario anual para aquellos empleados que si salario anual mas su comision supere los 3000000.
Select [Apellido],[Oficio],[Salario],([Salario]*12) As Salario_Anual,[Comision] From [dbo].[Empleado] Where ([Salario]*12 ) + ([Comision]*12)  >3000000

--Mostrar apellido , num dept y oficio de todos los empleados, ordenados por departamento y dentro de este por oficio
Select [Apellido],[Num_Dpto],[Oficio] From [dbo].[Empleado] Order by [Num_Dpto] , [Oficio]   --//asc ascendente   -- desc desendente

--Mostar todas las salas para el hospital 45
Select [Cod_Sala],[Cod_Hospital],[Nombre] From [dbo].[Sala] where [Cod_Hospital] =45

--Visualizar los empleados de la tabla empleado que no ingresaron entre el 01/01/2010 y el 12/12/2012
Select [Apellido],[Oficio],CONVERT (varchar(10),[Fecha_Ingreso],103) AS Fecha_Ingreso From  [dbo].[Empleado] where not( [Fecha_Ingreso] > '01/01/2010' and [Fecha_Ingreso] < '12/12/2012' )

Select [Apellido],[Oficio],CONVERT (varchar(10),[Fecha_Ingreso],103) AS Fecha_Ingreso From  [dbo].[Empleado] where not( [Fecha_Ingreso] Between '01/01/2010' and  '12/12/2012' )

--Mostrar los nombres de los departamentos y las localidades situados en madrid o en madrid
 Select [Num_Dpto],[Dpto_Nombre],[Localizacion] From [dbo].[Departamento]  where  [Localizacion] = 'Madrid' or  [Localizacion] = 'Barcelona' order by [Num_Dpto] Desc
 Select [Num_Dpto],[Dpto_Nombre],[Localizacion] From [dbo].[Departamento]  where  [Localizacion]  in ('Madrid', 'barcelona')

 --Mostrar apellido y salario de los empleados con slario entre 150k y 400k ordenado por salario
 Select [Apellido],[Salario] From [dbo].[Empleado] Where [Salario] >150000 and  [Salario] < 400000 order by [Salario] desc

 --Mostrar Apellido salario oficio y nm apto de los empleado con salario  entre 150k y 400k pero tambien incluir aquellos que no siendo analistas pertenecen al departamento 20

  Select [Apellido],[Salario],[Oficio],[Num_Dpto] From [dbo].[Empleado] Where ([Salario] between 150000 and 400000 ) or (Not [Oficio] = 'ANALISTA' and [Num_Dpto]=20)