-- Viser anbefalt skismøring for ulike brukernivåer.
-- Henter ut brukernivå (Niva), skismøringens navn, snøtype og temperatur.
-- Sorterer resultatet etter brukernivå i stigende rekkefølge.
SELECT BN.Beskrivelse
AS Niva, S.Navn, SF.Snotype, SF.Temperatur
FROM Anbefaling A
INNER JOIN Skismoring S ON A.SkismoringID = S.SkismoringID
INNER JOIN Snoforhold SF ON A.SnoforholdID = SF.SnoforholdID
INNER JOIN BrukerNiva BN ON A.NivaID = BN.NivaID
ORDER BY BN.NivaID ASC;
