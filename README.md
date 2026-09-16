# Skismøring-anbefaling — relasjonsdatabase

Databasedesign for et system som foreslår passende skismøring ut fra snøtype, temperatur og
brukerens ferdighetsnivå, og som foreslår alternative produkter når den anbefalte smøringen er
utsolgt.

Prosjekteksamen i ITF10319 Databasesystemer ved Høgskolen i Østfold, våren 2025. Utført i gruppe
på to studenter (prosjektgruppe 53).

## Oppgaven

Casen tar utgangspunkt i at riktig skismøring er avgjørende for feste og gli, men at det er
vanskelig å finne den optimale smøringen — særlig når produktet man planla å bruke ikke er på
lager, eller når føret endrer seg. Oppgaven var å designe den bakenforliggende databasen for en
slik løsning; brukergrensesnittet var eksplisitt utenfor omfanget.

Leveransen skulle bestå av fem deler: normalisering fra unormalisert form til BCNF, ER-modell,
implementasjon i MySQL, realistiske testdata, og views med tilhørende spørringer.

## Datamodell

Seks tabeller etter full normalisering til BCNF:

| Tabell | Attributter |
|---|---|
| `Skismoring` | `SkismoringID` (PK), `Navn`, `Type`, `TempMin`, `TempMax` |
| `Snoforhold` | `SnoforholdID` (PK), `Snotype`, `Temperatur` |
| `BrukerNiva` | `NivaID` (PK), `Beskrivelse` |
| `Loypeforhold` | `LoypeforholdID` (PK), `Loypenavn`, `Dato`, `SnoForholdID` (FK), `NivaID` (FK) |
| `Tilgjengelighet` | `SkismoringID` (PK, FK), lagerstatus |
| `Anbefaling` | `AnbefalingID` (PK), `SkismoringID` (FK), `SnoforholdID` (FK), `NivaID` (FK), `LoypeforholdID` (FK) |

`Anbefaling` er koblingstabellen som binder sammen produkt, snøforhold, ferdighetsnivå og løype.
Det er den som gjør at systemet kan svare på «hvilken smøring passer for en nybegynner i denne
løypa, under disse forholdene».

![ER-modell](Screenshots/ER%20Diagram.png)

ER-modellen er laget i MySQL Workbench. Kildefilen ligger som `ER Diagram.mwb`.

## Normalisering

Normaliseringen er dokumentert i rapporten, kapittel 2, og går gjennom hele kjeden:

- **UNF** — all informasjon samlet i én tabell med repeterende grupper
- **1NF** — atomære verdier, repeterende grupper fjernet
- **2NF** — delvise avhengigheter av sammensatt nøkkel fjernet
- **3NF** — transitive avhengigheter fjernet
- **BCNF** — kontrollert at alle determinanter er kandidatnøkler

Et eksempel på vurderingen som ble gjort i BCNF-steget: avhengigheten `Navn → Type` er ikke
tillatt alene, siden produktnavnet ikke er en kandidatnøkkel. Dette løses ved at `SkismoringID`
er primærnøkkel.

## Views og spørringer

Tre views med tilhørende spørringer, som dekker kundens ønsker som ikke lot seg løse direkte i
tabellstrukturen:

| View | Formål |
|---|---|
| Løypeforhold–anbefaling | Kobler løyper til anbefalt smøring, sorterbart på løypenavn eller brukernivå |
| Tilgjengelige skismøringer | Produkter med lagerstatus |
| `AnbefalingerNybegynner` | Anbefalinger filtrert til nybegynnernivå |

Spørringer bygget oppå disse:

- **Alternativ vare** — finner produkter av samme type med overlappende temperaturintervall når
  et gitt produkt ikke er ønsket eller tilgjengelig, med lagerstatus (`På lager` / `Utsolgt`)
- **Smøring for gitt temperatur og snøtype** — kjernespørringen i casen
- **Lav lagerstatus** — produkter med 55 enheter eller færre, merket `Utsolgt` eller `Snart tom`
- **Anbefaling per brukernivå** — anbefalinger sortert stigende på ferdighetsnivå

Rapporten dokumenterer også testing av referanseintegritet ved oppdatering og sletting
(kapittel 6.4).

## Innhold i repoet

```
├── SQL/                                   # Tabeller, testdata, views og spørringer
├── Screenshots/
│   ├── ER Diagram.png
│   ├── Create table/                      # Tabelldefinisjoner kjørt i Workbench
│   ├── Values/                            # Innlegging av testdata
│   └── View og spørringer/                # Spørringer med resultatsett
├── ER Diagram.mwb                         # MySQL Workbench-modell
├── Eksamen2025.pdf                        # Oppgaveteksten
└── Prosjektgruppe 53 - Eksamen 2025.pdf   # Besvarelsen (44 sider)
```

## Kjøre databasen lokalt

Krever MySQL. Opprett en database og kjør skriptene i `SQL/` i denne rekkefølgen, siden
fremmednøklene krever at referertetabellene finnes først:

```bash
mysql -u <bruker> -p -e "CREATE DATABASE skismoring;"
mysql -u <bruker> -p skismoring < SQL/Snoforhold.sql
mysql -u <bruker> -p skismoring < SQL/BrukerNiva.sql
mysql -u <bruker> -p skismoring < SQL/Loypeforhold.sql
```

Deretter testdata, og til slutt views. Se merknaden under om hvilke skript som mangler.

## Merknader om repoet

Dette er en eksamensbesvarelse levert 25. april 2025, ikke et vedlikeholdt prosjekt. Noen ting
er verdt å vite for den som vil kjøre koden:

- `SQL/`-mappen er ufullstendig. Tabelldefinisjonene for `Skismoring`, `Tilgjengelighet` og
  `Anbefaling`, samt testdata for `Skismoring`, finnes kun som skjermbilder i `Screenshots/`
  og i rapporten.
- `Tilgjengelighet` ble opprettet med et boolsk felt, men endret underveis til et antall
  (`Antall`). ER-diagrammet og `Create_Table`-skjermbildet viser den opprinnelige varianten,
  mens spørringene bruker den nye.
- Flere skript finnes i to versjoner fra ulike tidspunkter i arbeidet, og enkelte
  `INSERT`-setninger vil legge inn duplikate rader hvis de kjøres i sin helhet.

## Mitt bidrag

**Fyll inn:** to–tre punkter om hva du gjorde kontra medstudenten — normaliseringen,
ER-modellen, views, spørringene eller rapportskrivingen.
