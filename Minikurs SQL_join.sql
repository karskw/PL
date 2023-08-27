--INNER JOIN
SELECT *
FROM Asortyment a
	INNER JOIN TypyAsortymentu ta
		ON a.IdTypyAsortymentu = ta.IdTypyAsortymentu

--£¹czenie kilku tabel
--ca³y sprzedany asortyment bez zwrotów
SELECT *
FROM Asortyment a
	INNER JOIN Zakupy zak
		ON a.IdAsortyment = zak.IdAsortyment
	LEFT JOIN Zwroty zw
		ON zw.IdZakupy = zak.IdZakupy
WHERE zw.IdZwroty IS NULL


--GRUPOWANIE I FILTROWANIE
SELECT IdAsortyment, SUM(Ilosc) AS Ilosc
FROM Zakupy
WHERE MONTH(DataZakupu) = 3
GROUP BY IdAsortyment
HAVING SUM(Ilosc) > 5
ORDER BY Ilosc


--Pogrupowaæ asortyment wg typu
SELECT ta.Nazwa, COUNT(*) AS Ilosc, AVG(Cena) AS SredniaCena
FROM Asortyment a
	JOIN TypyAsortymentu ta
		ON a.IdTypyAsortymentu = ta.IdTypyAsortymentu
GROUP BY ta.Nazwa

--Dzieñ w Marcu, w którym sprzeda³o siê najwiêcej sztuk asortymentu
SELECT TOP 1 DAY(DataZakupu) AS Dzien, SUM(Ilosc) AS SprzedanaIlosc
FROM Zakupy
WHERE MONTH(DataZakupu) = 3
GROUP BY DAY(DataZakupu)
ORDER BY SprzedanaIlosc DESC

