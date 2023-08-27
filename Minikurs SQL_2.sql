--FUNKCJE TEKSTOWE
--Wszystkie osoby z PESELem z niepoprawn� ilo�ci� znak�w
SELECT *
FROM Pracownicy
WHERE LEN(PESEL) <> 11

--Zanmiana tekstu
SELECT Nazwa, REPLACE(Miasto, 'Wroclaw', 'Wroc�aw') AS Miasto
FROM Dostawcy

--Zamiana na wielkie/ma�e litery
--Znajd� niezale�nie od wielko�ci znak�w
SELECT *
FROM Dostawcy
WHERE UPPER(Miasto) = 'WROC�AW'

--Usuwanie bia�ych znak�w z lewej/prawej
SELECT LTRIM(RTRIM('       nazwa miasta                    '))


