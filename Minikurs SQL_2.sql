--FUNKCJE TEKSTOWE
--Wszystkie osoby z PESELem z niepoprawn¹ iloœci¹ znaków
SELECT *
FROM Pracownicy
WHERE LEN(PESEL) <> 11

--Zanmiana tekstu
SELECT Nazwa, REPLACE(Miasto, 'Wroclaw', 'Wroc³aw') AS Miasto
FROM Dostawcy

--Zamiana na wielkie/ma³e litery
--ZnajdŸ niezale¿nie od wielkoœci znaków
SELECT *
FROM Dostawcy
WHERE UPPER(Miasto) = 'WROC£AW'

--Usuwanie bia³ych znaków z lewej/prawej
SELECT LTRIM(RTRIM('       nazwa miasta                    '))


