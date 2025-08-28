-- Finner alternativer til skismøring med ID = 3.
-- Samme type og overlappende temperaturintervall.
-- Viser også antall på lager og status ("På lager" / "Utsolgt").
SELECT 
    s2.SkismoringID,
    s2.Navn,
    s2.Type,
    s2.TempMin,
    s2.TempMax,
    t.Antall,
    CASE 
        WHEN t.Antall > 0 THEN 'På lager'
        ELSE 'Utsolgt'
    END AS Lagerstatus
FROM Skismoring s1
JOIN Skismoring s2 ON 
    s1.Type = s2.Type AND 
    (
        s2.TempMin BETWEEN s1.TempMin AND s1.TempMax OR
        s2.TempMax BETWEEN s1.TempMin AND s1.TempMax OR
        s1.TempMin BETWEEN s2.TempMin AND s2.TempMax
    )
LEFT JOIN Tilgjengelighet t ON s2.SkismoringID = t.SkismoringID
WHERE s1.SkismoringID = 3
  AND s2.SkismoringID != 3;
  
  
  