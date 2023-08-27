--POBIERANIE DANYCH
--Poka� wszystkich pracownik�w
SELECT *
FROM Pracownik

--Poka� wszystkie wydarzenia
SELECT *
FROM Wydarzenia

--Poka� wszystkie dzia�y
SELECT *
FROM Dzial

--Poka� imiona i nazwiska pracownik�w
SELECT Imie, Nazwisko
FROM Pracownik

--Poka� 4 pracownik�w
SELECT TOP 4 *
FROM Pracownik

--Poka� unikalne imiona pracownik�w
SELECT DISTINCT Imie
FROM Pracownik


--FILTROWANIE DANYCH
--Poka� wszystkich pracownik�w o imieniu Anna
SELECT *
FROM Pracownik
	WHERE Imie = 'Anna'

--Poka� dzia� Promocja
SELECT *
FROM Dzial
	WHERE NazwaDzialu = 'Promocja'

--Poka� nazwiska wszystkich pracownik�w o imieniu Stefan
SELECT Nazwisko
FROM Pracownik
	WHERE Imie = 'Stefan'

--Poka� wydarzenie z dnia 26 lipca 2015 roku
SELECT *
FROM Wydarzenia
	WHERE DataWydarzenia = '2015-07-26'


--SORTOWANIE
--Poka� posortowanych pracownik�w wed�ug imienia
SELECT *
FROM Pracownik
	ORDER BY Imie

--Poka� posortowane malej�co wydarzenia wed�ug nazwy
SELECT *
FROM Wydarzenia
	ORDER BY Nazwa DESC

--Poka� nazw� i dat� wydarzenia posortowane wed�ug daty malej�co
SELECT Nazwa, DataWydarzenia
FROM Wydarzenia
	ORDER BY DataWydarzenia DESC

--Poka� wydarzenia, kt�re odby�y si� do ko�ca lipca 2015 roku i posortuj je wed�ug nazwy malej�co
SELECT *
FROM Wydarzenia
	WHERE DataWydarzenia < '2015-08-01'
	ORDER BY Nazwa DESC

--Poka� imiona i nazwiska pracownik�w, kt�rzy nie maj� na imi� Anna i posortuj ich alfabetycznie po nazwisku
SELECT Imie, Nazwisko
FROM Pracownik
WHERE Imie <> 'Anna'
ORDER BY Nazwisko

--Poka� 3 najlepiej zarabiaj�cych pracownik�w
SELECT TOP 3 *
FROM Pracownik
ORDER BY Pensja DESC


--ZAAWANSOWANE FILTROWANIE
--Znajd� wydarzenia, kt�re odby�y si� w wakacje (2015 rok)
SELECT *
FROM Wydarzenia
WHERE DataWydarzenia BETWEEN '2015-07-01' AND '2015-08-31'

--Poka� wszystkie Anny i Natalie
SELECT *
FROM Pracownik
WHERE Imie IN('Anna', 'Natalia')

--Poka� wszystkie Anny nie maj�ce na nazwisko Nowak
SELECT *
FROM Pracownik
WHERE Imie = 'Anna' AND Nazwisko <> 'Nowak'

--Poka� pracownik�w posiadaj�cych numer PESEL
SELECT *
FROM Pracownik
WHERE PESEL IS NOT NULL

--Poka� pracownik�w nie posiadaj�cych numeru PESEL, kt�rzy zarabiaj� wi�cej ni� 2000z�
SELECT *
FROM Pracownik
WHERE PESEL IS NULL 
AND Pensja > 2000


--FUNKCJE TEKSTOWE
--��czenie tekstu z u�yciem +
SELECT Imie + ' ' + Nazwisko
FROM Pracownik

--��czenie tekstu (concat)
SELECT CONCAT(Imie, ' ', Nazwisko)
FROM Pracownik

--Poka� imiona kobiece (ko�cz�ce si� na 'a')
SELECT *
FROM Pracownik
WHERE RIGHT(Imie, 1) = 'a'

--Dzie� urodzenia z PESELu (5 i 6 znak)
SELECT Imie, Nazwisko, SUBSTRING(PESEL, 5, 2) AS DzienUrodzenia
FROM Pracownik

--Wszystkie osoby z PESELem z niepoprawn� ilo�ci� znak�w
SELECT *
FROM Pracownik
WHERE LEN(PESEL) <> 11

--Wszystkie osoby z PESELem z niepoprawn� ilo�ci� znak�w lub brakiem PESELu
SELECT *
FROM Pracownik
WHERE PESEL IS NULL OR LEN(PESEL) <> 11

--Poka� nazwy dzia��w
SELECT NazwaDzialu
FROM Dzial

--Poka� nazw� i miejsce wszystkich wydarze�
SELECT Nazwa, Miejsce
FROM Wydarzenia

--Poka� jedno wydarzenie
SELECT TOP 1 *
FROM Wydarzenia

--Poka� numery pi�ter zajmowanych przez nasz� firm�
SELECT DISTINCT NrPietra
FROM Dzial

--Poka� wydarzenie: Dzie� dziecka
SELECT *
FROM Wydarzenia
WHERE Nazwa = 'Dzie� dziecka'

--Poka� pracownik�w zarabiaj�cych poni�ej 2000z�
SELECT *
FROM Pracownik
WHERE Pensja < 2000

--Poka� pracownik�w zatrudnionych przed rokiem 2000
SELECT *
FROM Pracownik
WHERE DataZatrudnienia < '2000-01-01'

--Poka� wydarzenia, kt�re odby�y si� przed wakacjami 2015 roku (01.07.2015)
SELECT *
FROM Wydarzenia
WHERE DataWydarzenia < '2015-07-01'

--Poka� posortowanych pracownik�w wed�ug pensji
SELECT *
FROM Pracownik
ORDER BY Pensja

--Poka� imiona pracownik�w posortowane wg nazwiska
SELECT Imie
FROM Pracownik
ORDER BY Nazwisko

--Poka� pracownik�w zarabiaj�cych powy�ej 2000z� posortowanych wg nazwiska
SELECT *
FROM Pracownik
WHERE Pensja > 2000
ORDER BY Nazwisko

--Poka� nazwy dzia��w z pierwszego pi�tra posortowane wed�ug nazwy
SELECT NazwaDzialu
FROM Dzial
WHERE NrPietra = 1
ORDER BY NazwaDzialu

--Poka� Nazwy 2 najstarszych Wydarze�
SELECT TOP 2 Nazwa
FROM Wydarzenia
ORDER BY DataWydarzenia

--Poka� imiona i nazwiska 4 najs�abiej zarabiaj�cych pracownik�w zatrudnionych po 1 stycznia 2000 roku
SELECT TOP 4 Imie, Nazwisko
FROM Pracownik
WHERE DataZatrudnienia > '2000-01-01'
ORDER BY Pensja


--��CZENIE TABEL
--INNER JOIN - tylko pasuj�ce rekordy
SELECT Imie, Nazwisko, NazwaDzialu
FROM Pracownik
	INNER JOIN Dzial
		ON Pracownik.IdDzialu = Dzial.IdDzial

--LEFT (OUTER) JOIN - wszystkie z lewej i pasuj�ce z prawej
SELECT Imie, Nazwisko, NazwaDzialu
FROM Pracownik
	LEFT JOIN Dzial
		ON Pracownik.IdDzialu = Dzial.IdDzial

--FULL OUTER JOIN - wszystkie rekordy z obu lub wi�cej tabel
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