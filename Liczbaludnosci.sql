USE LiczbaLudnosci 


SELECT * FROM Powiaty2020
ALTER TABLE Powiaty2020
ADD Wojewodztwo nvarchar(50);

ALTER TABLE Powiaty2020
ADD IdPowiat INT IDENTITY(1,1)

UPDATE Powiaty2020
SET WOJEWODZTWO = 'Dolnoœl¹skie'
WHERE idpowiat between 1 and 31;

UPDATE Powiaty2020
SET WOJEWODZTWO = 'Kujawsko-pomorskie'
WHERE idpowiat between 32 and 55;

UPDATE Powiaty2020
SET WOJEWODZTWO = 'Lubelskie'
WHERE idpowiat between 56 and 80;

UPDATE Powiaty2020
SET WOJEWODZTWO = 'Lubuskie'
WHERE idpowiat between 81 and 95;

UPDATE Powiaty2020
SET WOJEWODZTWO = '£ódzkie'
WHERE idpowiat between 96 and 120;

UPDATE Powiaty2020
SET WOJEWODZTWO = 'Ma³opolskie'
WHERE idpowiat between 121 and 143;

UPDATE Powiaty2020
SET WOJEWODZTWO = 'Mazowieckie'
WHERE idpowiat between 144 and 186;

UPDATE Powiaty2020
SET WOJEWODZTWO = 'Opolskie'
WHERE idpowiat between 187 and 199;

UPDATE Powiaty2020
SET WOJEWODZTWO = 'Podkarpackie'
WHERE idpowiat between 200 and 225;

UPDATE Powiaty2020
SET WOJEWODZTWO = 'Podlaskie'
WHERE idpowiat between 226 and 243;

UPDATE Powiaty2020
SET WOJEWODZTWO = 'Pomorskie'
WHERE idpowiat between 244 and 264;

UPDATE Powiaty2020
SET WOJEWODZTWO = 'Œl¹skie'
WHERE idpowiat between 265 and 301;

UPDATE Powiaty2020
SET WOJEWODZTWO = 'Œwiêtokrzyskie'
WHERE idpowiat between 302 and 316;

UPDATE Powiaty2020
SET WOJEWODZTWO = 'Warmiñsko-mazurskie'
WHERE idpowiat between 317 and 338;

UPDATE Powiaty2020
SET WOJEWODZTWO = 'Wielkopolskie'
WHERE idpowiat between 339 and 374;

UPDATE Powiaty2020
SET WOJEWODZTWO = 'Zachodniopomorskie'
WHERE idpowiat between 375 and 396;

SELECT * FROM Powiaty2015
ALTER TABLE Powiaty2015
ADD Wojewodztwo nvarchar(50);

ALTER TABLE Powiaty2015
ADD IdPowiat INT IDENTITY(1,1)

UPDATE Powiaty2015
SET WOJEWODZTWO = 'Dolnoœl¹skie'
WHERE idpowiat between 1 and 31;

UPDATE Powiaty2015
SET WOJEWODZTWO = 'Kujawsko-pomorskie'
WHERE idpowiat between 32 and 55;

UPDATE Powiaty2015
SET WOJEWODZTWO = 'Lubelskie'
WHERE idpowiat between 56 and 80;

UPDATE Powiaty2015
SET WOJEWODZTWO = 'Lubuskie'
WHERE idpowiat between 81 and 95;

UPDATE Powiaty2015
SET WOJEWODZTWO = '£ódzkie'
WHERE idpowiat between 96 and 120;

UPDATE Powiaty2015
SET WOJEWODZTWO = 'Ma³opolskie'
WHERE idpowiat between 121 and 143;

UPDATE Powiaty2015
SET WOJEWODZTWO = 'Mazowieckie'
WHERE idpowiat between 144 and 186;

UPDATE Powiaty2015
SET WOJEWODZTWO = 'Opolskie'
WHERE idpowiat between 187 and 199;

UPDATE Powiaty2015
SET WOJEWODZTWO = 'Podkarpackie'
WHERE idpowiat between 200 and 225;

UPDATE Powiaty2015
SET WOJEWODZTWO = 'Podlaskie'
WHERE idpowiat between 226 and 243;

UPDATE Powiaty2015
SET WOJEWODZTWO = 'Pomorskie'
WHERE idpowiat between 244 and 264;

UPDATE Powiaty2015
SET WOJEWODZTWO = 'Œl¹skie'
WHERE idpowiat between 265 and 301;

UPDATE Powiaty2015
SET WOJEWODZTWO = 'Œwiêtokrzyskie'
WHERE idpowiat between 302 and 316;

UPDATE Powiaty2015
SET WOJEWODZTWO = 'Warmiñsko-mazurskie'
WHERE idpowiat between 317 and 338;

UPDATE Powiaty2015
SET WOJEWODZTWO = 'Wielkopolskie'
WHERE idpowiat between 339 and 374;

UPDATE Powiaty2015
SET WOJEWODZTWO = 'Zachodniopomorskie'
WHERE idpowiat between 375 and 396;

ALTER TABLE Powiaty2020
ALTER COLUMN LiczbaLudnosci DECIMAL (10,0);

ALTER TABLE Powiaty2015
ALTER COLUMN LiczbaLudnosci DECIMAL (10,0);

SELECT t.* INTO DaneWyjsciowe
FROM 
(
SELECT P2020.IdPowiat, P2020.Powiat, P2020.Wojewodztwo, P2020.LiczbaLudnosci AS LiczbaLudnosci2020, P2015.LiczbaLudnosci AS LiczbaLudnosci2015,
(SELECT P2020.LiczbaLudnosci - P2015.LiczbaLudnosci) AS Roznica, (SELECT  ((P2020.LiczbaLudnosci - P2015.LiczbaLudnosci) / P2015.LiczbaLudnosci)*100) AS ProcRoznica
FROM Powiaty2020 P2020
JOIN Powiaty2015 P2015
ON P2020.IdPowiat = P2015.IdPowiat

) t

SELECT * FROM DaneWyjsciowe
ORDER BY ProcRoznica DESC

ALTER TABLE DaneWyjsciowe
ALTER COLUMN PROCROZNICA FLOAT;

SELECT *, ROUND(ProcRoznica, 2) as ProcRoznicaZaokraglona
FROM DaneWyjsciowe




