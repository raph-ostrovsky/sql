
/*
W bazie danych ABDPrzychodnia, zrobić zestawienie wizyt z 22.04.2013, w których brali udział pacjenci urodzeni po roku  1987  a lekarz był kobietą. W zestawieniu powinny się znajdować następujące dane:  nazwisko i imię pacjenta, numer ewidencyjny lekarza oraz kwota opłaty za wizytę.

Wynik uporządkować według nazwiska pacjenta malejąco.
*/
USE TRPrzychodnia

SELECT P.Nazwisko AS NazwiskoPacjenta, P.Imie AS ImiePacjenta, l.NrEwid AS EwidencyjnyLekarza, w.Oplata
FROM Lekarze l
	JOIN Wizyty w ON l.IdLekarza = w.IdLekarza
	JOIN Pacjenci p ON p.IdPacjenta = w.IdPacjenta

WHERE w.DataWizyty='20130422' AND year(p.DataUrodzenia) > 1987 AND l.CzyKobieta = 1
ORDER BY p.Nazwisko DESC


/*
W bazie danych ABDPrzychodnia napisać zapytanie zwracające następujące dane: nazwisko, imię, pesel i płeć tych pacjentów, którzy w pierwszym półroczu 2013 byli w diabetologa lub chirurga.*
*/

SELECT P.Nazwisko, P.Imie, P.Pesel, P.CzyKobieta
FROM Pacjenci P JOIN Wizyty W ON P.IdPacjenta = W.IdPacjenta
                JOIN Lekarze L ON L.IdLekarza = W.IdLekarza
				JOIN Specjalizacje S ON S.idspecjalizacji = L.Idspecjalizacji
WHERE DataWizyty >= '20130101' AND DataWizyty <= '20130630'
	AND (NazwaSpecjalizacji = 'Chirurg' OR NazwaSpecjalizacji = 'Diabetolog')


/*
W bazie danych ABDPrzychodnia napisać zapytanie zwracające następujące dane: nazwisko i imię lekarza, nazwisko i imię pacjenta, datę wizyty i kwotę opłaty za wizytę dla wizyt  z marca 2013  w których lekarz był tej samej płci co pacjent i był od niego straszy.

Wynik uporządkować według  daty wizyty rosnąco.
*/

SELECT L.Nazwisko, L.Imie, P.Nazwisko, P.Imie, W.DataWizyty, W.Oplata
FROM Lekarze L JOIN Wizyty W ON L.IdLekarza = W.IdLekarza
               JOIN Pacjenci P ON P.IdPacjenta = W.IdPacjenta
WHERE YEAR(DataWizyty) = 2013 AND MONTH(DataWizyty) = 03 AND (L.CzyKobieta = P.CzyKobieta) AND (L.DataUrodzenia > P.DataUrodzenia)
ORDER BY DataWizyty

