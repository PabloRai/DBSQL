/* a. Encontrar el nombre de todas las personas que trabajan en la empresa “Banelco”.*/

SELECT nombre_persona
FROM Trabaja T, Persona P
WHERE T.nombre_empresa = 'Banelco' AND T.Dni_per = P.dni;

/*b. Localizar el nombre y la ciudad de todas las personas que trabajan para la
empresa "Telecom" */

SELECT nombre_persona, ciudad
FROM Persona P
INNER JOIN Trabaja T
ON P.dni = T.Dni_per
INNER JOIN Vive V
ON T.Dni_per = V.Dni_per
WHERE T.nombre_empresa = 'Telecom';

/* c. Buscar el nombre, calle y ciudad de todas las personas que trabajan para la
empresa “Paulinas” y ganan más de $1500. */

SELECT nombre_persona, calle, ciudad
FROM Persona P
INNER JOIN Trabaja T
ON P.dni = T.Dni_per
INNER JOIN Vive V
ON T.Dni_per = V.Dni_per
WHERE T.nombre_empresa = 'Paulinas' AND T.salario > 1500;

/* d. Encontrar las personas que viven en la misma ciudad en la que se halla la
empresa en donde trabajan. */

SELECT  DISTINCT dni, nombre_persona, telefono
FROM Persona P
INNER JOIN Trabaja T
ON P.dni = T.Dni_per
INNER JOIN Vive V
ON T.Dni_per = V.Dni_per
INNER JOIN Situada_En S
ON V.ciudad = S.ciudad;

/* e. Hallar todas las personas que viven en la misma ciudad y en la misma calle que
su supervisor. */

SELECT DISTINCT V.Dni_per, V.calle, V.ciudad
FROM Vive V
INNER JOIN Persona_Sup PS
ON V.calle = PS.calle AND V.ciudad = PS.ciudad AND V.Dni_per != PS.Dni_per;

/* f. Encontrar todas las personas que ganan más que cualquier empleado de la
empresa “Clarín” */ 

SELECT Dni_per
FROM Trabaja
WHERE salario > (SELECT MAX(salario)
				 FROM Trabaja 
				 WHERE nombre_empresa = 'empresa10');

/* g. Localizar las ciudades en las que todos los trabajadores que vienen en ellas
ganan más de $1000. */

SELECT DISTINCT V.ciudad
FROM Vive V
EXCEPT
SELECT VV.ciudad
FROM Vive VV, Trabaja T
WHERE VV.Dni_per = T.Dni_per AND T.salario <= 1000;

/* h. Listar los primeros empleados que la compañía “Sony” contrató. */

SELECT T.Dni_per
FROM Trabaja T
WHERE nombre_empresa = 'empresa1' AND T.fecha_ingreso = (SELECT MIN(TT.fecha_ingreso)
														 FROM Trabaja TT
														 WHERE TT.nombre_empresa = 'empresa1');

/* i. Listar los empleados que hayan ingresado en mas de 4 Empresas en el periodo
01-01-2000 y 31-03-2004 y que no hayan tenido menos de 5 supervisores */

SELECT T.Dni_per
FROM Trabaja T, Supervisa S
WHERE T.fecha_ingreso >= '2000-01-01' AND T.fecha_egreso <= '2004-03-31'
GROUP BY T.Dni_per
HAVING COUNT(T.Dni_per) >= 4 AND COUNT(S.Dni_per) > 5;
						 




