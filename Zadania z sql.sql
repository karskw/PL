--Ile zosta�o dokonanych zakup�w w marcu?
SELECT COUNT(*) AS SprzedaneWycieczki
FROM Zakup
WHERE MONTH(Data) = 3

--W kt�rym miesi�cu sprzedano najmniej wycieczek?
SELECT TOP 1 MONTH(Data) AS Miesiac, COUNT(*) AS SprzedaneWycieczki
FROM Zakup
GROUP BY MONTH(Data)
ORDER BY SprzedaneWycieczki

--Je�eli za sprzeda� wycieczki pracownik otrzymuje 150 z� prowizji, to ile sprzedali�my wycieczek ze strat�?
SELECT *
FROM Cena c
	INNER JOIN Zakup z
		ON c.IdCena = z.IdCeny
WHERE z.Cena - c.Kwota + c.KwotaProwizji - 150 < 0

--Poka� miejscowo�ci, w kt�rych jest jeden przystanek.
SELECT m.Nazwa, COUNT(*) AS LiczbaPrzystankow
FROM Miejscowosc m
	JOIN Przystanek p
		ON m.IdMiejscowosc = p.IdMiejscowosci
GROUP BY m.Nazwa
HAVING COUNT(*) = 1

--Ile sprzedali�my wycieczek dodatkowych rozpoczynaj�cych si� w lipcu?
SELECT COUNT(*) AS WycieczkiDodatkoweLipiec
FROM KupionaWycieczkaDodatkowa kwd
	INNER JOIN WycieczkaDodatkowa wd
		ON kwd.IdWycieczki = wd.IdWycieczkaDodatkowa
	INNER JOIN Transport t
		ON t.IdTransport = wd.IdTransport
WHERE MONTH(t.DataPoczatku) = 7

--Kt�ry hotel ma najwi�cej ofert z wy�ywieniem All Inclusive?
SELECT TOP 1 h.Nazwa, COUNT(*) AS LiczbaOfertZAI
FROM DostepneWyzywienie dw
	INNER JOIN Cena c
		ON dw.IdDostepneWyzywienie = c.IdWyzywienia
	INNER JOIN OfertaHotelu oh
		ON c.IdOfertyHotelu = oh.IdOfertaHotelu
	INNER JOIN Hotel h
		ON oh.IdHotelu = h.IdHotel
WHERE dw.Nazwa = 'AI - All Inclusive'
GROUP BY h.Nazwa
ORDER BY LiczbaOfertZAI DESC


--Poka� pracownik�w i liczb� wycieczek sprzedanych ze strat�.
SELECT s.Imie, s.Nazwisko,  COUNT(*) AS WycieczkiZeStrata
FROM Sprzedawca s
	INNER JOIN Zakup z
		ON s.IdSprzedawca = z.IdSprzedawcy
	INNER JOIN Cena c
		ON z.IdCeny = c.IdCena
WHERE z.Cena - c.Kwota + c.KwotaProwizji < 0
GROUP BY s.Imie, s.Nazwisko

--Poka� 2 hotele, kt�re maj� najwi�cej atrakcji w ofercie (ka�d� atrakcj� policz tylko raz).
SELECT TOP 2 h.Nazwa, COUNT(*) AS Atrakcje
FROM Hotel h
	INNER JOIN OfertaHotelu oh
		ON h.IdHotel = oh.IdHotelu
	INNER JOIN AtrakcjaOferta ao
		ON oh.IdOferty = ao.IdOferty
GROUP BY h.Nazwa
ORDER BY Atrakcje DESC

--Poka� 2 hotele, kt�re maj� najwi�cej atrakcji w ofercie (ka�d� atrakcj� policz tylko raz).
SELECT TOP 2 x.Nazwa, COUNT(*) AS LiczbaAtrakcji
FROM 
    (SELECT h.Nazwa, ao.IdAtrakcji
    FROM Hotel h
        INNER JOIN OfertaHotelu oh
            ON oh.IdHotelu = h.IdHotel
        INNER JOIN Oferta o
            ON o.IdOferta = oh.IdOferty
        INNER JOIN AtrakcjaOferta ao
            ON ao.IdOferty = o.IdOferta
    GROUP BY h.Nazwa, ao.IdAtrakcji) x
GROUP BY x.Nazwa
ORDER BY LiczbaAtrakcji DESC

--Poka� pracownik�w i liczb� wycieczek sprzedanych ze strat�, je�li od ka�dej sprzeda�y odejmiemy 150z� prowizji pracownika
SELECT s.Imie, s.Nazwisko, COUNT(*) AS WycieczkiZeStrata
FROM Sprzedawca s
	INNER JOIN Zakup z
		ON s.IdSprzedawca = z.IdSprzedawcy
	INNER JOIN Cena c
		ON z.IdCeny = c.IdCena
WHERE z.Cena - c.Kwota + c.KwotaProwizji - 150 < 0
GROUP BY s.Imie, s.Nazwisko

--Poka� ile mamy ofert dla ka�dego z hoteli i czy zawieraj� wy�ywienie All Inclusive
SELECT h.Nazwa, 
	COUNT(*) AS LiczbaOfert,
	IIF(MAX(IIF(dw.Nazwa = 'AI - All Inclusive', 1, 0)) = 1, 'Zawiera', 'Nie zawiera') AS AllInclusive
FROM Hotel h
	INNER JOIN OfertaHotelu oh
		ON h.IdHotel = oh.IdHotelu
	INNER JOIN Cena c
		ON oh.IdOfertaHotelu = c.IdOfertyHotelu
	INNER JOIN DostepneWyzywienie dw
		ON c.IdWyzywienia = dw.IdDostepneWyzywienie
GROUP BY h.Nazwa