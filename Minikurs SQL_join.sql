--INNER JOIN
SELECT *
FROM Asortyment a
	INNER JOIN TypyAsortymentu ta
		ON a.IdTypyAsortymentu = ta.IdTypyAsortymentu

--��czenie kilku tabel
--ca�y sprzedany asortyment bez zwrot�w
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


--Pogrupowa� asortyment wg typu
SELECT ta.Nazwa, COUNT(*) AS Ilosc, AVG(Cena) AS SredniaCena
FROM Asortyment a
	JOIN TypyAsortymentu ta
		ON a.IdTypyAsortymentu = ta.IdTypyAsortymentu
GROUP BY ta.Nazwa

--Dzie� w Marcu, w kt�rym sprzeda�o si� najwi�cej sztuk asortymentu
SELECT TOP 1 DAY(DataZakupu) AS Dzien, SUM(Ilosc) AS SprzedanaIlosc
FROM Zakupy
WHERE MONTH(DataZakupu) = 3
GROUP BY DAY(DataZakupu)
ORDER BY SprzedanaIlosc DESC

