-- Oppretter et view som viser anbefalt skismøring for brukere på nybegynnernivå
CREATE VIEW AnbefalingerNybegynner AS
SELECT DISTINCT
    -- Viser navnet på skismøringen
    S.Navn AS Skismoring,
    -- Viser type skismøring (f.eks. tørrvoks, klister, glider)
    S.Type,
    -- Viser anbefalt minimumstemperatur for skismøringen
    S.TempMin,
    -- Viser anbefalt maksimumstemperatur for skismøringen
    S.TempMax,
    -- Viser typen snø som gjelder for anbefalingen
    SF.Snotype,
    -- Viser aktuell snøtemperatur
    SF.Temperatur,
    -- Viser navnet på løypa der anbefalingen gjelder
    L.LoypeNavn,
    -- Viser brukernivået (filtrert til kun "Nybegynner" i dette viewet)
    BN.Beskrivelse AS Brukerniva
-- Henter data fra koblingstabellen Anbefaling
FROM Anbefaling A
-- Kobler skismøring til anbefalingene
INNER JOIN Skismoring S ON A.SkismoringID = S.SkismoringID
-- Kobler snøforhold til anbefalingene
INNER JOIN Snoforhold SF ON A.SnoforholdID = SF.SnoforholdID
-- Kobler brukernivå til anbefalingene
INNER JOIN BrukerNiva BN ON A.NivaID = BN.NivaID
-- Kobler løypeforhold til anbefalingene
INNER JOIN Loypeforhold L ON A.LopeforholdID = L.LopeforholdID
-- Filtrerer resultatet til kun å vise anbefalinger for brukere på nybegynnernivå
WHERE BN.Beskrivelse = 'Nybegynner';

