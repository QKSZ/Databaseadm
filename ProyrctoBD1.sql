/*1.	Listar todas las Infracciones cometidas por un Conductor en un Rango de Fechas. Mostrando código 
y nombre del conductor, el código de la infracción, fecha y monto de la misma.*/

SELECT C.Nombre, C.Cedula_conductor, M.Codigo, M.Fehca_Emision, M.Monto FROM CONDUCTOR C INNER JOIN MULTA M 
ON C.Cedula_conductor = M.Cedula_Conductor WHERE M.FECHA_EMISION BETWEEN '' AND ''

/*2.	Listar todos los conductores con licencias activas que tienen todos los conductores ordenado por conductor. Mostrando 
Cedula y nombre del conductor, tipo de licencia, indicador de activa y fecha de vencimiento.*/

SELECT C.Nombre, C.Cedula, L.TIPO, L.ESTADO L.Fecha_Vencimiento FROM CONDUCTOR C INNER JOIN Registro_Licencias R
ON C.Cedula_conductor= R.Cedula_conductor where R.Estado = 1 order by C.Cedula_conductor

/*3.	Mostrar las infracciones registradas por un tráfico determinado en un 
Rango de Fechas (Los datos a mostrar serán el id y nombre del oficial, código de la infracción, fecha y monto.*/

SELECT M.Codigo , M.ID_Oficial ,O.Nombre From Multas M Inner Join Oficiales O on M.ID_Oficial = O.ID_Oficial where M.fecha_vencimiento between '' and ''

/*4.	Mostrar el total, el promedio, el mínimo y el máximo de las multas aplicadas por los tráficos en un
 rango de fechas (Mostrar código del oficial y los valores solicitados.)*/

SELECT AVG(M.monto),MIN(M.monto),MAX(M.monto), O.ID_Oficial,O.Nombre from Oficiales O inNer Join Multas M ON O.ID_Oficial= M.ID_Oficial where M.Fecha_emision between '' and ''

/*5.	El historial de multas de un conductor dado (datos a mostrar queda a criterio de los alumnos).*/

SELECT M.MONTO, M.CODIGO, M.CEDULA_CONDUCTOR, M.FECHA.EMISION, C.NOMBRE FROM MULTAS M INNER JOIN CONDUCTOR C ON M.CEDULA_CONDUCTOR = C.CEDULA_CONDUCTOR
WHERE M.CEDULA_CONDUCTOR = '' ORDER BY M.FECHA.EMISION
