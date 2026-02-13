# Power Query med Claude Code

Transformera och städa data med M-språket.

!!! abstract "Vad du kommer lära dig"
    - Vad Power Query är och varför det är kraftfullt
    - Hur du arbetar med M-kod via Claude Code
    - Vanliga transformationer och hur du ber om dem
    - Hur du optimerar långsamma queries
    - Felhantering och felsökning

---

## Vad är Power Query?

=== "Nybörjare"

    **Power Query** är ett verktyg i Excel (och Power BI) för att hämta, transformera och rengöra data. Tänk på det som en automatisk "datapreparering" som körs varje gång du uppdaterar.

    **Exempel på vad du kan göra:**

    - Kombinera alla CSV-filer i en mapp automatiskt
    - Ta bort tomma rader och dubbletter
    - Omvandla kolumnnamn och datatyper
    - Slå ihop data från flera källor

    Det kallas också **"Get & Transform Data"** i Excel-menyn.

=== "Standard"

    Power Query använder **M-språket** (Power Query Formula Language) för transformationer. Varje steg du gör i UI:t genererar M-kod bakom kulisserna.

    **M-kodens struktur:**
    ```
    let
        Steg1 = [källa],
        Steg2 = [transformation av Steg1],
        Steg3 = [transformation av Steg2]
    in
        Steg3
    ```

    Du kan:
    - Använda UI för grundläggande transformationer
    - Skriva M-kod för avancerade fall
    - Skapa återanvändbara funktioner

=== "Djupdykning"

    M är ett funktionellt språk med:

    - **Lat utvärdering** - steg körs bara om de behövs
    - **Immutable data** - varje steg skapar ny data
    - **Typinferens** - typer bestäms automatiskt
    - **Rika standardbibliotek** - Table, List, Text, Date, etc.

    **Query folding** är nyckeln till prestanda - när möjligt "vikas" M-kod tillbaka till SQL-frågor mot källan.

---

## Arbetsflöde med Claude Code

### Hitta M-koden i Excel

1. **Data** → **Hämta data** → **Starta Power Query Editor**
2. Högerklicka på din query → **Avancerad redigerare**
3. Kopiera all kod (++ctrl+a++ sedan ++ctrl+c++)

### Be Claude om hjälp

**Din prompt:**
```
Här är min Power Query-kod:

let
    Source = Excel.Workbook(File.Contents("C:\Data\rapport.xlsx")),
    Sheet1 = Source{[Name="Blad1"]}[Data]
in
    Sheet1

Jag vill:
1. Ta bort första raden (den är en rubrik)
2. Sätta kolumnnamn från den nya första raden
3. Filtrera bort rader där kolumn "Status" är tom
```

### Klistra tillbaka

1. Öppna **Avancerad redigerare** i Power Query
2. Markera all befintlig kod (++ctrl+a++)
3. Klistra in ny kod (++ctrl+v++)
4. Klicka **Klar**
5. Verifiera i förhandsvisningen
6. **Stäng och läs in**

---

## M-språkets grunder

### Strukturen

```m
let
    // Varje steg har ett namn och ett uttryck
    Source = Excel.CurrentWorkbook(){[Name="Tabell1"]}[Content],

    // Varje steg refererar till föregående
    FilteredRows = Table.SelectRows(Source, each [Status] = "Aktiv"),

    // Du kan ha hur många steg som helst
    AddedColumn = Table.AddColumn(FilteredRows, "FulltNamn",
        each [Förnamn] & " " & [Efternamn])
in
    // Sista steget returneras
    AddedColumn
```

### Vanliga funktioner

| Funktion | Beskrivning |
|----------|-------------|
| `Table.SelectRows` | Filtrera rader |
| `Table.SelectColumns` | Välj kolumner |
| `Table.AddColumn` | Lägg till kolumn |
| `Table.RemoveColumns` | Ta bort kolumner |
| `Table.TransformColumnTypes` | Ändra datatyper |
| `Table.PromoteHeaders` | Första raden som rubriker |
| `Table.Combine` | Kombinera tabeller vertikalt |
| `Table.NestedJoin` | Slå ihop tabeller (merge) |
| `Table.UnpivotOtherColumns` | Unpivot |

---

## Vanliga transformationer

### Kombinera filer från mapp

**Din prompt:**
```
Skapa en Power Query som:
1. Läser alla CSV-filer i mappen C:\Data\Månadsrapporter
2. Kombinerar dem till en tabell
3. Lägger till en kolumn "Filnamn" som visar vilken fil datan kom från
```

**Claude Code svarar:**
```m
let
    // Hämta alla filer i mappen
    Source = Folder.Files("C:\Data\Månadsrapporter"),

    // Filtrera till bara CSV-filer
    FilteredFiles = Table.SelectRows(Source, each
        Text.EndsWith([Name], ".csv")
    ),

    // Lägg till kolumn med filinnehåll
    AddedContent = Table.AddColumn(FilteredFiles, "Innehåll", each
        Csv.Document([Content], [Delimiter=";", Encoding=1252])
    ),

    // Lägg till filnamn som kolumn i varje tabell
    AddedFilename = Table.AddColumn(AddedContent, "Data", each
        Table.AddColumn([Innehåll], "Källfil", each [Name])
    ),

    // Expandera alla tabeller till en
    Combined = Table.Combine(AddedFilename[Data]),

    // Använd första raden som rubriker
    PromotedHeaders = Table.PromoteHeaders(Combined)
in
    PromotedHeaders
```

!!! tip "Automatisk uppdatering"
    När du lägger nya filer i mappen och klickar **Uppdatera** inkluderas de automatiskt!

---

### Slå ihop två tabeller (Merge)

**Din prompt:**
```
Jag har två queries:
- "Ordrar" med kolumner: OrderID, KundID, Datum, Belopp
- "Kunder" med kolumner: KundID, Namn, Email, Region

Slå ihop dem så att jag får kundnamn och region på varje order.
```

**Claude Code svarar:**
```m
let
    // Referera till befintliga queries
    Orders = Ordrar,
    Customers = Kunder,

    // Gör en LEFT OUTER JOIN på KundID
    Merged = Table.NestedJoin(
        Orders,           // Första tabellen
        {"KundID"},       // Nyckelkolumn i första
        Customers,        // Andra tabellen
        {"KundID"},       // Nyckelkolumn i andra
        "KundInfo",       // Namn på ny kolumn
        JoinKind.LeftOuter
    ),

    // Expandera de kolumner vi vill ha
    Expanded = Table.ExpandTableColumn(
        Merged,
        "KundInfo",
        {"Namn", "Region"},
        {"KundNamn", "KundRegion"}
    )
in
    Expanded
```

**Join-typer:**

| JoinKind | Beskrivning |
|----------|-------------|
| `Inner` | Endast matchande rader |
| `LeftOuter` | Alla från vänster + matchande från höger |
| `RightOuter` | Alla från höger + matchande från vänster |
| `FullOuter` | Alla rader från båda tabellerna |
| `LeftAnti` | Rader från vänster som INTE matchar höger |
| `RightAnti` | Rader från höger som INTE matchar vänster |

---

### Unpivot (kolumner till rader)

**Din prompt:**
```
Min data ser ut så här:
| Produkt | Jan | Feb | Mar |
|---------|-----|-----|-----|
| A       | 100 | 150 | 200 |
| B       | 80  | 90  | 110 |

Jag vill ha:
| Produkt | Månad | Värde |
|---------|-------|-------|
| A       | Jan   | 100   |
| A       | Feb   | 150   |
...
```

**Claude Code svarar:**
```m
let
    Source = Excel.CurrentWorkbook(){[Name="Tabell1"]}[Content],

    // Unpivot alla kolumner utom "Produkt"
    Unpivoted = Table.UnpivotOtherColumns(
        Source,
        {"Produkt"},        // Kolumner att behålla
        "Månad",            // Namn på ny attributkolumn
        "Värde"             // Namn på ny värdekolumn
    ),

    // Ändra datatyp på Värde till heltal
    ChangedType = Table.TransformColumnTypes(Unpivoted, {
        {"Värde", Int64.Type}
    })
in
    ChangedType
```

---

### Datarengöring

**Din prompt:**
```
Min data har problem:
- Mellanslag före och efter text i kolumn "Namn"
- Konstiga tecken (�) i kolumn "Adress"
- Kolumn "Telefon" har blandade format (070-123456, 070 123 456, +46701234567)

Rengör datan.
```

**Claude Code svarar:**
```m
let
    Source = Excel.CurrentWorkbook(){[Name="Kontakter"]}[Content],

    // Trimma mellanslag i Namn
    TrimmedNames = Table.TransformColumns(Source, {
        {"Namn", Text.Trim}
    }),

    // Ta bort ogiltiga tecken i Adress
    CleanedAddress = Table.TransformColumns(TrimmedNames, {
        {"Adress", each Text.Clean(Text.From(_))}
    }),

    // Standardisera telefonnummer (behåll bara siffror)
    StandardizedPhone = Table.TransformColumns(CleanedAddress, {
        {"Telefon", each Text.Select(_, {"0".."9"})}
    }),

    // Formatera telefon som 07X-XXXXXXX
    FormattedPhone = Table.TransformColumns(StandardizedPhone, {
        {"Telefon", each
            if Text.Length(_) = 10 then
                Text.Start(_, 3) & "-" & Text.Middle(_, 3)
            else _
        }
    })
in
    FormattedPhone
```

**Vanliga rengöringsfunktioner:**

| Funktion | Användning |
|----------|------------|
| `Text.Trim` | Ta bort mellanslag i början/slutet |
| `Text.Clean` | Ta bort icke-skrivbara tecken |
| `Text.Upper` / `Text.Lower` | Ändra case |
| `Text.Replace` | Ersätt text |
| `Text.Select` | Behåll bara vissa tecken |
| `Table.Distinct` | Ta bort dubbletter |
| `Table.FillDown` | Fyll tomma celler med värdet ovanför |

---

### Dynamiskt datumfilter

**Din prompt:**
```
Filtrera tabellen på senaste 30 dagarna relativt dagens datum.
```

**Claude Code svarar:**
```m
let
    Source = Excel.CurrentWorkbook(){[Name="Försäljning"]}[Content],

    // Beräkna gränsdatum (30 dagar bakåt från idag)
    CutoffDate = Date.AddDays(DateTime.Date(DateTime.LocalNow()), -30),

    // Filtrera rader
    FilteredRows = Table.SelectRows(Source, each
        [Datum] >= CutoffDate
    )
in
    FilteredRows
```

**Fler datumfunktioner:**

```m
// Aktuellt år
Date.Year(DateTime.LocalNow())

// Första dagen i månaden
Date.StartOfMonth([Datum])

// Kvartal
Date.QuarterOfYear([Datum])

// Antal dagar mellan två datum
Duration.Days([SlutDatum] - [StartDatum])
```

---

### Skapa en återanvändbar funktion

**Din prompt:**
```
Jag läser ofta Excel-filer med samma struktur.
Skapa en funktion som tar en filsökväg och returnerar första arket med rubriker.
```

**Claude Code svarar:**
```m
// Spara som egen query med namn "fnReadExcel"
let
    ReadExcel = (FilePath as text) =>
    let
        Source = Excel.Workbook(File.Contents(FilePath)),
        FirstSheet = Source{0}[Data],
        PromotedHeaders = Table.PromoteHeaders(FirstSheet)
    in
        PromotedHeaders
in
    ReadExcel
```

**Användning i andra queries:**
```m
let
    File1 = fnReadExcel("C:\Data\fil1.xlsx"),
    File2 = fnReadExcel("C:\Data\fil2.xlsx"),
    Combined = Table.Combine({File1, File2})
in
    Combined
```

---

## Felhantering

### try/otherwise

```m
let
    Source = Excel.CurrentWorkbook(){[Name="Data"]}[Content],

    // Metod 1: try/otherwise för en kolumn
    SafeDivision = Table.AddColumn(Source, "Andel", each
        try [Värde] / [Total] otherwise 0
    ),

    // Metod 2: Ersätt fel i befintlig kolumn
    ReplacedErrors = Table.ReplaceErrorValues(SafeDivision, {
        {"Andel", 0}
    }),

    // Metod 3: Ta bort rader med fel
    RemovedErrors = Table.RemoveRowsWithErrors(ReplacedErrors, {"Andel"})
in
    RemovedErrors
```

### Kontrollera om värde finns

```m
// Säker lookup med try
SafeLookup = Table.AddColumn(Source, "KundNamn", each
    try Kunder{[ID = [KundID]]}[Namn] otherwise "Okänd"
)
```

---

## Optimering

=== "Nybörjare"

    Om din query är långsam, prova:

    1. **Filtrera tidigt** - Ta bort onödig data så tidigt som möjligt
    2. **Ta bort onödiga kolumner** - Behåll bara det du behöver
    3. **Undvik "komplett omläsning"** - Vissa operationer tvingar omläsning

=== "Standard"

    **Prestandatips:**

    | Problem | Lösning |
    |---------|---------|
    | Långsam filkombinering | Använd `Table.Buffer` för lookup-tabeller |
    | Många HTTP-anrop | Batcha förfrågningar |
    | Stor data | Filtrera på källa innan import |
    | Långsam merge | Indexera/sortera nyckelkolumner |

    **Strukturera effektivt:**
    ```m
    let
        // 1. Läs data
        Source = ...,

        // 2. Filtrera tidigt (minskar datamängd)
        Filtered = Table.SelectRows(Source, each [År] = 2024),

        // 3. Välj kolumner (minskar bredd)
        Selected = Table.SelectColumns(Filtered, {"ID", "Namn", "Belopp"}),

        // 4. Transformera
        Transformed = ...
    in
        Transformed
    ```

=== "Djupdykning"

    **Query folding** är nyckeln till prestanda. När möjligt, "vikas" M-kod tillbaka till källan (SQL, OData, etc.).

    Operationer som **bryter** query folding:
    - `Table.Buffer`
    - `Table.AddColumn` med komplex logik
    - Anpassade funktioner
    - `List.Generate`

    **Kontrollera folding:** Högerklicka på steg → **Visa inbyggd fråga** (visar SQL om folding fungerar)

    **Buffer för lookup-tabeller:**
    ```m
    // Läs lookup-tabell en gång och buffra i minnet
    BufferedLookup = Table.Buffer(SmallLookupTable),

    // Använd i merge
    Merged = Table.NestedJoin(LargeTable, ..., BufferedLookup, ...)
    ```

---

## Felsökning

??? question "Query laddar inte - 'Couldn't refresh'"

    **Vanliga orsaker:**

    1. **Filen har flyttats** - Kontrollera sökvägen i första steget
    2. **Kolumn borttagen** - Ett steg refererar till kolumn som inte finns
    3. **Behörigheter** - Datakällan kräver ny autentisering

    **Felsök med Claude:**
    ```
    Visa mig denna M-kod och identifiera vad som kan orsaka felet:
    [klistra in M-kod]

    Felmeddelande: [klistra in]
    ```

??? question "Fel datatyper efter transformation"

    Lägg till explicit typkonvertering:
    ```m
    Table.TransformColumnTypes(PreviousStep, {
        {"Datum", type date},
        {"Belopp", type number},
        {"ID", type text}
    })
    ```

??? question "Steg i fel ordning"

    I Avancerad redigerare, flytta steget uppåt/nedåt. Se till att varje steg refererar till steget innan:
    ```m
    let
        Step1 = Source,
        Step2 = DoSomething(Step1),  // Refererar till Step1
        Step3 = DoMore(Step2)         // Refererar till Step2
    in
        Step3
    ```

??? question "Query är långsam"

    1. Öppna Power Query Editor
    2. Högerklicka på varje steg och kolla tiden
    3. Identifiera det långsamma steget
    4. Be Claude optimera just det steget

---

## Prova själv

!!! example "Övning 1: Kombinera månadsrapporter"

    1. Skapa en mapp `C:\Test\Rapporter`
    2. Skapa tre CSV-filer med samma struktur:
       - `jan.csv`, `feb.csv`, `mar.csv`
       - Kolumner: Produkt, Antal, Pris
    3. Be Claude Code:
       ```
       Skapa en Power Query som kombinerar alla CSV-filer i
       C:\Test\Rapporter, lägger till en kolumn "Månad" baserat
       på filnamnet (utan .csv), och beräknar Total = Antal * Pris
       ```
    4. Klistra in koden i Power Query Editor
    5. Lägg till nya filer och klicka **Uppdatera** - de inkluderas automatiskt!

!!! example "Övning 2: Rensa kunddata"

    1. Skapa en Excel-tabell med "dålig" data:
       - Namn med extra mellanslag
       - Blandade stora/små bokstäver
       - Telefonnummer i olika format
    2. Be Claude Code skapa en Power Query som standardiserar datan
    3. Testa att uppdatera efter att du lagt till fler "dåliga" rader

---

## Sammanfattning

!!! success "Det viktigaste att ta med sig"
    - **Power Query** transformerar data automatiskt varje gång du uppdaterar
    - **M-koden** finns i Avancerad redigerare - kopiera den till Claude
    - **Beskriv transformationen** du vill göra, så genererar Claude M-kod
    - **Filtrera tidigt** och ta bort onödiga kolumner för bättre prestanda
    - **try/otherwise** gör dina queries robusta mot felaktig data
    - **Återanvändbara funktioner** sparar tid vid återkommande uppgifter

---

## Nästa steg

Se [best practices](best-practices.md) för fler tips om effektivt Excel-arbete.
