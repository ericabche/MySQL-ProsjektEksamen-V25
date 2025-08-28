-- Lagerstatus for skismøringer målt i antall enheter. 
-- Det første tallet viser til SkismoringID, og det andre tallet viser til antall produkter som er tilgjengelig.
-- Verdien 0 indikerer at produktet er utsolgt (SkismoringID 8 og 12).
INSERT INTO Tilgjengelighet (SkismoringID, Antall) VALUES
(1, 70),
(2, 24),
(3, 58),
(4, 22),
(5, 88),
(6, 102),
(7, 3),
(8, 0),     -- Utsolgt
(9, 12),
(10, 65),
(11, 11),
(12, 0),    -- Utsolgt
(13, 20),
(14, 50);

