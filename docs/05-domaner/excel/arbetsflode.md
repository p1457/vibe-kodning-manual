# Arbetsflöde: Claude Code och Excel

Hur du praktiskt använder Claude Code för att få hjälp med Excel-formler, VBA och Power Query.

---

## Det viktiga: Flera sätt att arbeta

=== "Nybörjare"

    Till skillnad från Power BI kan Claude Code faktiskt **läsa Excel-filer** om de ligger på din dator! Men ofta är det enklare att kopiera formler och data som text.

    **Två huvudmetoder:**

    1. **Läsa filen direkt** - Claude analyserar data med Python
    2. **Kopiera/klistra** - Du kopierar formler eller VBA-kod

=== "Standard"

    | Metod | När du använder den |
    |-------|---------------------|
    | Läsa .xlsx direkt | Analysera data, hitta mönster |
    | Kopiera formler | Felsöka eller skapa formler |
    | Kopiera VBA | Arbeta med makron |
    | Kopiera M-kod | Power Query-transformationer |
    | Exportera CSV | Stora filer (>30MB) |

=== "Djupdykning"

    Claude Code använder `pandas` och `openpyxl` för att läsa Excel-filer. Formler läses som text (inte beräknade värden) om inte `data_only=True` anges. För att skapa Excel-filer med formatering används `openpyxl`.

---

## Metod 1: Läsa Excel-filer direkt

### Analysera data

**Din prompt:**
```
Läs filen C:\Rapporter\Försäljning2025.xlsx och visa:
1. De första 10 raderna
2. Vilka kolumner som finns
3. Summering av kolumnen "Belopp"
```

Claude Code läser filen och ger dig analysen.

### Hitta mönster

```
Läs C:\Data\kunddata.xlsx och hitta:
- Alla dubbletter i kolumnen "Email"
- Rader där "Belopp" är större än 10000
- Genomsnittligt belopp per "Region"
```

!!! tip "Bra att veta"
    - Max filstorlek: ~30MB
    - Formler läses som text, inte värden
    - Perfekt för dataanalys och utforskning

---

## Metod 2: Kopiera formler

### Få hjälp med formler

**Din prompt:**
```
Jag behöver en Excel-formel som:
- Letar i kolumn A efter värdet i cell D2
- Returnerar motsvarande värde från kolumn C
- Om inget hittas ska den visa "Ej funnen"

Data finns i A2:C100
```

**Claude Code svarar:**
```excel
=IFERROR(VLOOKUP(D2,A2:C100,3,FALSE),"Ej funnen")
```

### Felsöka formler

```
Denna formel ger #VALUE!-fel:
=SUMIFS(B:B,A:A,">2024-01-01")

Kolumn A innehåller datum (2024-01-15 etc)
Kolumn B innehåller belopp (1500, 2300 etc)

Vad är fel?
```

**Claude Code svarar:**

Problemet är att datumjämförelser i SUMIFS kräver korrekt datumformat.
Textsträngen `">2024-01-01"` tolkas inte som ett datum.

**Lösningar:**

```excel
# Lösning 1: Använd DATE-funktionen
=SUMIFS(B:B,A:A,">"&DATE(2024,1,1))

# Lösning 2: Använd DATEVALUE
=SUMIFS(B:B,A:A,">"&DATEVALUE("2024-01-01"))

# Lösning 3: Referera till en cell med datum
=SUMIFS(B:B,A:A,">"&E1)
```

Operatorn (`>`) måste konkateneras med datumvärdet med `&`.

### Moderna formler (Microsoft 365)

```
Jag har Excel 365. Kan du skriva om denna VLOOKUP till XLOOKUP?

=VLOOKUP(A2,Data!$A:$D,3,FALSE)
```

---

## Metod 3: VBA-makron

### Exportera VBA från Excel

1. Tryck ++alt+f11++ för att öppna VBA-editorn
2. Hitta din modul i projektfönstret
3. Kopiera koden (++ctrl+a++ sedan ++ctrl+c++)

### Be om hjälp med VBA

**Din prompt:**
```
Jag har detta VBA-makro som ska gå igenom alla rader
och färga celler med negativa värden röda, men det fungerar inte:

Sub FärgaNegativa()
    Dim cell As Range
    For Each cell In Range("B2:B100")
        If cell.Value < 0 Then
            cell.Interior.Color = vbRed
        End If
    Next cell
End Sub
```

### Skapa nya makron

```
Skapa ett VBA-makro som:
1. Går igenom alla ark i arbetsboken
2. I varje ark, hittar sista raden med data i kolumn A
3. Lägger till en summa-rad under
4. Sparar arbetsboken
```

**Kopiera tillbaka:**

1. ++alt+f11++ i Excel
2. Infoga ny modul eller öppna befintlig
3. Klistra in koden
4. Kör med ++f5++ eller via knapp

---

## Metod 4: Power Query (M-kod)

### Hitta M-koden

1. **Data** → **Hämta data** → **Starta Power Query Editor**
2. Högerklicka på din query → **Avancerad redigerare**
3. Kopiera all kod

### Be om hjälp

**Din prompt:**
```
Min Power Query-transformation är långsam (tar 5 minuter).
Kan du optimera denna M-kod?

let
    Source = Folder.Files("C:\Data"),
    FilteredFiles = Table.SelectRows(Source, each Text.EndsWith([Name], ".csv")),
    ...
in
    Result
```

### Klistra tillbaka

1. Öppna **Avancerad redigerare** i Power Query
2. Markera all befintlig kod
3. Klistra in ny kod
4. Klicka **Klar**
5. Verifiera resultatet
6. **Stäng och läs in**

---

## Metod 5: Skapa Excel-filer

Claude Code kan skapa Excel-filer åt dig!

**Din prompt:**
```
Skapa en Excel-fil C:\Rapporter\mall.xlsx med:
- Ark "Data" med kolumner: Datum, Produkt, Antal, Pris
- Ark "Sammanfattning" med en pivottabell-liknande summering
- Formatera rubriker som feta med blå bakgrund
```

Claude Code använder Python (openpyxl) för att skapa filen med formatering och formler.

---

## CSV för stora filer

Om din Excel-fil är större än 30MB:

1. **I Excel:** Arkiv → Spara som → CSV
2. **Till Claude Code:**
   ```
   Läs C:\Export\stordata.csv och analysera...
   ```

!!! warning "CSV-begränsningar"
    - Förlorar formatering och formler
    - Endast ett ark
    - Datumformat kan bli konstiga

---

## Vanliga uppgifter

| Uppgift | Metod |
|---------|-------|
| Analysera data i Excel | Läs filen direkt |
| Skapa/fixa formel | Kopiera/klistra text |
| Automatisera med VBA | Kopiera från VBA-editor |
| Transformera data | Power Query M-kod |
| Skapa rapport | Låt Claude skapa .xlsx |
| Stor fil (>30MB) | Exportera till CSV |

---

## Tips för bättre resultat

### Var specifik om struktur

```
# Bra
"Kolumn A har datum (2024-01-15), kolumn B har produktnamn,
kolumn C har antal (heltal), kolumn D har pris (decimal)"

# Dåligt
"Jag har en tabell med försäljningsdata"
```

### Ange Excel-version

```
"Jag har Excel 2019"  (saknar XLOOKUP, FILTER, etc)
"Jag har Microsoft 365"  (har alla nya funktioner)
```

### Ge exempeldata

```
Mina data ser ut så här:
| Datum      | Produkt | Belopp |
|------------|---------|--------|
| 2024-01-15 | A       | 1500   |
| 2024-01-16 | B       | 2300   |
```

---

## Arbetsflöde sammanfattning

```
┌─────────────────────────────────────────┐
│              Excel-fil                   │
└──────────────────┬──────────────────────┘
                   │
    ┌──────────────┼──────────────┐
    │              │              │
    ▼              ▼              ▼
┌────────┐  ┌───────────┐  ┌───────────┐
│  Läs   │  │  Kopiera  │  │  Kopiera  │
│ direkt │  │  formler  │  │   VBA/M   │
└───┬────┘  └─────┬─────┘  └─────┬─────┘
    │             │              │
    └──────────┬──┴──────────────┘
               │
               ▼
       ┌───────────────┐
       │  Claude Code  │
       └───────┬───────┘
               │
               ▼
       ┌───────────────┐
       │ Kopiera/läs   │
       │ tillbaka      │
       └───────────────┘
```

---

## Nästa steg

Lär dig mer om [Power Query](power-query.md) och se [best practices](best-practices.md).
