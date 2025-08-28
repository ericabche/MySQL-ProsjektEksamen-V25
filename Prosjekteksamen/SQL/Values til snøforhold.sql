-- Legger inn realistiske snøtyper og tilhørende temperaturer som grunnlag for anbefalinger.
-- Eksempler:
-- - Tørr snø og kunstsnø ved kaldt vær
-- - Våt snø og grovkornet snø ved mildvær
-- - Is/snø-blanding og nysnø ved overgangsforhold
-- Kombinasjonen av snøtype og temperatur er viktig for valg av riktig skismøring.

INSERT INTO Snoforhold (Snotype, Temperatur) VALUES
('Tørr snø', -15),
('Tørr snø', -5),
('Våt snø', 1),
('Is/snø blanding', -3),
('Grovkornet snø', 3),
('Kunstsnø', -8),
('Nysnø', -1);

