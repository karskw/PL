--POBIERANIE DANYCH
--Poka¿ wszystkich pracowników
SELECT *
FROM Pracownik

--Poka¿ wszystkie wydarzenia
SELECT *
FROM Wydarzenia

--Poka¿ wszystkie dzia³y
SELECT *
FROM Dzial

--Poka¿ imiona i nazwiska pracowników
SELECT Imie, Nazwisko
FROM Pracownik

--Poka¿ 4 pracowników
SELECT TOP 4 *
FROM Pracownik

--Poka¿ unikalne imiona pracowników
SELECT DISTINCT Imie
FROM Pracownik


--FILTROWANIE DANYCH
--Poka¿ wszystkich pracowników o imieniu Anna
SELECT *
FROM Pracownik
	WHERE Imie = 'Anna'

--Poka¿ dzia³ Promocja
SELECT *
FROM Dzial
	WHERE NazwaDzialu = 'Promocja'

--Poka¿ nazwiska wszystkich pracowników o imieniu Stefan
SELECT Nazwisko
FROM Pracownik
	WHERE Imie = 'Stefan'

--Poka¿ wydarzenie z dnia 26 lipca 2015 roku
SELECT *
FROM Wydarzenia
	WHERE DataWydarzenia = '2015-07-26'


--SORTOWANIE
--Poka¿ posortowanych pracowników wed³ug imienia
SELECT *
FROM Pracownik
	ORDER BY Imie

--Poka¿ posortowane malej¹co wydarzenia wed³ug nazwy
SELECT *
FROM Wydarzenia
	ORDER BY Nazwa DESC

--Poka¿ nazwê i datê wydarzenia posortowane wed³ug daty malej¹co
SELECT Nazwa, DataWydarzenia
FROM Wydarzenia
	ORDER BY DataWydarzenia DESC

--Poka¿ wydarzenia, które odby³y siê do koñca lipca 2015 roku i posortuj je wed³ug nazwy malej¹co
SELECT *
FROM Wydarzenia
	WHERE DataWydarzenia < '2015-08-01'
	ORDER BY Nazwa DESC

--Poka¿ imiona i nazwiska pracowników, którzy nie maj¹ na imiê Anna i posortuj ich alfabetycznie po nazwisku
SELECT Imie, Nazwisko
FROM Pracownik
WHERE Imie <> 'Anna'
ORDER BY Nazwisko

--Poka¿ 3 najlepiej zarabiaj¹cych pracowników
SELECT TOP 3 *
FROM Pracownik
ORDER BY Pensja DESC


--ZAAWANSOWANE FILTROWANIE
--ZnajdŸ wydarzenia, które odby³y siê w wakacje (2015 rok)
SELECT *
FROM Wydarzenia
WHERE DataWydarzenia BETWEEN '2015-07-01' AND '2015-08-31'

--Poka¿ wszystkie Anny i Natalie
SELECT *
FROM Pracownik
WHERE Imie IN('Anna', 'Natalia')

--Poka¿ wszystkie Anny nie maj¹ce na nazwisko Nowak
SELECT *
FROM Pracownik
WHERE Imie = 'Anna' AND Nazwisko <> 'Nowak'

--Poka¿ pracowników posiadaj¹cych numer PESEL
SELECT *
FROM Pracownik
WHERE PESEL IS NOT NULL

--Poka¿ pracowników nie posiadaj¹cych numeru PESEL, którzy zarabiaj¹ wiêcej ni¿ 2000z³
SELECT *
FROM Pracownik
WHERE PESEL IS NULL 
AND Pensja > 2000


--FUNKCJE TEKSTOWE
--£¹czenie tekstu z u¿yciem +
SELECT Imie + ' ' + Nazwisko
FROM Pracownik

--£¹czenie tekstu (concat)
SELECT CONCAT(Imie, ' ', Nazwisko)
FROM Pracownik

--Poka¿ imiona kobiece (koñcz¹ce siê na 'a')
SELECT *
FROM Pracownik
WHERE RIGHT(Imie, 1) = 'a'

--Dzieñ urodzenia z PESELu (5 i 6 znak)
SELECT Imie, Nazwisko, SUBSTRING(PESEL, 5, 2) AS DzienUrodzenia
FROM Pracownik

--Wszystkie osoby z PESELem z niepoprawn¹ iloœci¹ znaków
SELECT *
FROM Pracownik
WHERE LEN(PESEL) <> 11

--Wszystkie osoby z PESELem z niepoprawn¹ iloœci¹ znaków lub brakiem PESELu
SELECT *
FROM Pracownik
WHERE PESEL IS NULL OR LEN(PESEL) <> 11

--Poka¿ nazwy dzia³ów
SELECT NazwaDzialu
FROM Dzial

--Poka¿ nazwê i miejsce wszystkich wydarzeñ
SELECT Nazwa, Miejsce
FROM Wydarzenia

--Poka¿ jedno wydarzenie
SELECT TOP 1 *
FROM Wydarzenia

--Poka¿ numery piêter zajmowanych przez nasz¹ firmê
SELECT DISTINCT NrPietra
FROM Dzial

--Poka¿ wydarzenie: Dzieñ dziecka
SELECT *
FROM Wydarzenia
WHERE Nazwa = 'Dzieñ dziecka'

--Poka¿ pracowników zarabiaj¹cych poni¿ej 2000z³
SELECT *
FROM Pracownik
WHERE Pensja < 2000

--Poka¿ pracowników zatrudnionych przed rokiem 2000
SELECT *
FROM Pracownik
WHERE DataZatrudnienia < '2000-01-01'

--Poka¿ wydarzenia, które odby³y siê przed wakacjami 2015 roku (01.07.2015)
SELECT *
FROM Wydarzenia
WHERE DataWydarzenia < '2015-07-01'

--Poka¿ posortowanych pracowników wed³ug pensji
SELECT *
FROM Pracownik
ORDER BY Pensja

--Poka¿ imiona pracowników posortowane wg nazwiska
SELECT Imie
FROM Pracownik
ORDER BY Nazwisko

--Poka¿ pracowników zarabiaj¹cych powy¿ej 2000z³ posortowanych wg nazwiska
SELECT *
FROM Pracownik
WHERE Pensja > 2000
ORDER BY Nazwisko

--Poka¿ nazwy dzia³ów z pierwszego piêtra posortowane wed³ug nazwy
SELECT NazwaDzialu
FROM Dzial
WHERE NrPietra = 1
ORDER BY NazwaDzialu

--Poka¿ Nazwy 2 najstarszych Wydarzeñ
SELECT TOP 2 Nazwa
FROM Wydarzenia
ORDER BY DataWydarzenia

--Poka¿ imiona i nazwiska 4 najs³abiej zarabiaj¹cych pracowników zatrudnionych po 1 stycznia 2000 roku
SELECT TOP 4 Imie, Nazwisko
FROM Pracownik
WHERE DataZatrudnienia > '2000-01-01'
ORDER BY Pensja


--£¥CZENIE TABEL
--INNER JOIN - tylko pasuj¹ce rekordy
SELECT Imie, Nazwisko, NazwaDzialu
FROM Pracownik
	INNER JOIN Dzial
		ON Pracownik.IdDzialu = Dzial.IdDzial

--LEFT (OUTER) JOIN - wszystkie z lewej i pasuj¹ce z prawej
SELECT Imie, Nazwisko, NazwaDzialu
FROM Pracownik
	LEFT JOIN Dzial
		ON Pracownik.IdDzialu = Dzial.IdDzial

--FULL OUTER JOIN - wszystkie rekordy z obu lub wiêcej tabel
SELECT Imie, Nazwisko, NazwaDzialu
FROM Pracownik
	FULL JOIN Dzial
		ON Pracownik.IdDzialu = Dzial.IdDzial

--CROSS JOIN
SELECT Imie, Nazwisko, NazwaDzialu
FROM Pracownik CROSS JOIN Dzial
--to samo powoduje sam przecinek
SELECT Imie, Nazwisko, NazwaDzialu
FROM Pracownik, Dzial