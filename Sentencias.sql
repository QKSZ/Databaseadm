use Duck

Select distinct [Especialidad],[Apellido] from [dbo].[Doctor]
go

--mostrar nombres de sala

select distinct [Nombre] from [dbo].[Sala]
go
--Mostrar el apellido y num de departamento de los empleados cuyo apellido inicie en M termine en z ordenados por departamento

Select  [Apellido],[Num_Dpto] from [dbo].[Empleado] where  [Apellido] like 'M%Z' order by [Num_Dpto]
go

--Mostrar Id y apellidos de los empleados que contengan en su apellido ER

Select  [ID_Empleado],[Apellido] from [dbo].[Empleado] where  [Apellido] like '%ER%' order by [Num_Dpto]
go

--Mostrar ID apellido y num de dep de los empleados cuyo apellido sean de 4 letras y este termine con la letra a

Select  [ID_Empleado],[Num_Dpto],[Apellido] from [dbo].[Empleado] where  [Apellido] like '___e__z' order by [Num_Dpto]
go

--Mostrar id, apellido y num depto de los empleados cuyo apellido inicien con e,f,g,o h*/

Select  [ID_Empleado],[Num_Dpto],[Apellido] from [dbo].[Empleado] where  [Apellido] like '[e-h]%' order by [Num_Dpto]
go

----Mostrar Id , apellido y mun departamento empleados cuyo apellido comience por la letra a , 
----contenga dentro de su apellido de la letra a a la m y que termine en O

Select  [ID_Empleado],[Apellido],[Num_Dpto] from [dbo].[Empleado] where  [Apellido] like 'a%[a-m]%o' order by [Num_Dpto]
go

--Mostrar Id apellido y dep empleado cuyo apellido comience por la letra  m y la segunda no sea la a

Select  [ID_Empleado],[Apellido],[Num_Dpto] from [dbo].[Empleado] where  [Apellido] like 'm[^a]%' order by [Num_Dpto]
go

--Mostrar Id apellido y dep empleado cuyo apellido comience por la letra  m y la tercer letra no sea la r
Select  [ID_Empleado],[Apellido],[Num_Dpto] from [dbo].[Empleado] where  [Apellido] like 'm_[^r]%' order by [Num_Dpto]
go

--FUNCIONES DE AGREGADO

--Mostrar cuentos empleados existen en, salario minimo, salario maximo, salario promedio

select count (*) as Total_empleado,min (Salario) as Salario_minimo ,MAX(Salario) as Salario_maximo, Avg(Salario) as Promedio_salarial from [dbo].[Empleado]

--Mostrar cuantos empleados existen, salario minimo, salario maximo, salario promedio de todos los empleados con oficio vendedores
select count (*) as Total_empleado,min (Salario) as Salario_minimo ,MAX(Salario) as Salario_maximo, Avg(Salario) as Promedio_salarial from [dbo].[Empleado] where [Oficio] = 'Vendedor'

--Inner Join Listar los hospitales (codigo,nombre) y los doctores que trabajan en ese hospital (num,apellido)
Select * from [dbo].[Hospital]
select * from [dbo].[Hospital]
--/*4 hospitales y 8 doctores (numeros importantes)*/  [dbo].[Hospital] H(alias)
--mala practica
Select H.[Cod_Hospital], [Nombre],[Num_Doctor],[Apellido] from [dbo].[Hospital] H,[dbo].[Doctor] D 
where h.Cod_Hospital = d.Cod_Hospital


