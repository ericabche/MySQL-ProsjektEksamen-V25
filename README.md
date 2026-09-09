# Skismøring-anbefaling — relasjonsdatabase

Databasedesign for et anbefalingssystem for skismøring: gitt føre, temperatur og luftfuktighet
foreslår systemet riktig smurning, viser om produktet er på lager, og foreslår alternativer når
det ikke er det.

Prosjekteksamen i emnet Databasesystemer ved Høgskolen i Østfold, våren 2025. Utført sammen med
én medstudent.

<!-- TODO: sjekk at beskrivelsen over stemmer med hva systemet faktisk anbefaler ut fra.
     Juster parameterne hvis modellen bruker andre. -->

## Hva prosjektet inneholder

- Full normalisering fra unormalisert form (UNF) via 1NF, 2NF og 3NF til BCNF, med
  funksjonelle avhengigheter dokumentert underveis
- ER-modell med tilhørende relasjonsmodell
- Implementasjon i MySQL med tabeller, fremmednøkler og views
- SQL-spørringer for anbefalinger, lagerstatus og alternative produktforslag
- Testing av referanseintegritet ved oppdatering og sletting, blant annet oppførselen til
  `ON DELETE` og `ON UPDATE` på fremmednøkkelrelasjonene

## Mitt bidrag

<!-- TODO: to eller tre punkter om hva du gjorde kontra medstudenten. Dette er det
     eneste en leser ikke kan finne ut av selv, så det er verdt å være konkret.
     For eksempel: normaliseringen, ER-modellen, views, spørringene, testingen. -->

## Filer

<!-- TODO: list opp de faktiske filnavnene i repoet. Eksempel på formen:

| Fil | Innhold |
|---|---|
| `schema.sql` | Tabelldefinisjoner og fremmednøkler |
| `data.sql` | Testdata |
| `views.sql` | Views for anbefalinger og lagerstatus |
| `sporringer.sql` | Spørringene med forklaring |
| `docs/er-modell.png` | ER-diagram |
-->

## Kjøre databasen lokalt

```bash
mysql -u <bruker> -p < schema.sql
mysql -u <bruker> -p < data.sql
```

<!-- TODO: tilpass filnavnene over, og legg til databasenavn hvis skriptene
     ikke oppretter det selv. -->

## ER-modell

<!-- TODO: eksporter ER-diagrammet til PNG og legg det inn her. Dette er det første
     en leser ser etter i et databaseprosjekt:

     ![ER-modell](docs/er-modell.png)
-->

## Merk

Dette er en eksamensbesvarelse.
