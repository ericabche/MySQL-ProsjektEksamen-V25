-- Viser navn, type og lagerstatus for 
-- skismøringer med 55 eller færre enheter på lager.
-- Lagerstatus vises som "Utsolgt" ved 0, ellers "Snart tom".
SELECT 
    S.Navn,
    S.Type,
    T.Antall,
    CASE 
        WHEN T.Antall = 0 THEN 'Utsolgt'
        ELSE 'Snart tom'
    END AS LagerStatus
FROM Skismoring S
INNER JOIN Tilgjengelighet T ON S.SkismoringID = T.SkismoringID
WHERE T.Antall <= 55
ORDER BY T.Antall ASC;

