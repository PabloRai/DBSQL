CREATE VIEW Persona_Sup AS
SELECT V.Dni_per, calle, ciudad
FROM Vive V
INNER JOIN Supervisa S
ON V.Dni_per = S.Dni_sup;