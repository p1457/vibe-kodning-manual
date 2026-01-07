# Power Query med Claude Code

Transformera och städa data med M-språket.

---

## Vad är Power Query?

=== "Nybörjare"

    **Power Query** är ett verktyg i Excel (och Power BI) för att importera och omvandla data. Det kallas också "Get & Transform Data".

    Du kan:
    - Hämta data från filer, databaser, webben
    - Kombinera flera källor
    - Städa och omformatera data
    - Automatisera återkommande import

=== "Standard"

    Power Query använder **M-språket** (Power Query Formula Language) under huven. Du kan:

    - Använda UI för grundläggande transformationer
    - Skriva M-kod för avancerade fall
    - Skapa återanvändbara funktioner

---

## M-språket (Formula Language)

```
let
    Source = Excel.CurrentWorkbook(){[Name="Tabell1"]}[Content],
    FilteredRows = Table.SelectRows(Source, each [Status] = "Aktiv"),
    AddedColumn = Table.AddColumn(FilteredRows, "FulltNamn",
        each [Förnamn] & " " & [Efternamn])
in
    AddedColumn
```

---

## Vanliga transformationer

### Kombinera filer från mapp

```
Skapa M-kod som läser alla Excel-filer från en mapp
och kombinerar dem till en tabell.
```

### Unpivot

```
Jag har månadsvärden i separata kolumner (Jan, Feb, Mar...).
Omvandla till rader med en Månad-kolumn och en Värde-kolumn.
```

### Dynamisk datum

```
Filtrera tabellen på senaste 30 dagarna relativt dagens datum.
```

---

## Tips för Claude-prompts

Beskriv din datastruktur:

```
Jag har en Excel-tabell med kolumnerna:
- Datum (date)
- Produkt (text)
- Antal (number)
- Region (text)

Skapa en Power Query som...
```

---

## Nästa steg

Se [best practices](best-practices.md) för Excel-utveckling.
