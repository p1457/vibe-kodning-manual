# Best Practices för Excel

Tips för effektivt Excel-arbete med Claude Code.

---

## Formler

### Beskriv tydligt

```
# Vagt
"Jag behöver en formel för summa"

# Bättre
"Summera kolumn C (Belopp) för rader där kolumn A (Datum)
är inom aktuell månad och kolumn B (Status) är 'Godkänd'"
```

### Ange Excel-version

```
Jag använder Excel 365 / Excel 2019 / Excel för Mac
```

Nyare versioner har funktioner som XLOOKUP, FILTER, UNIQUE som inte finns i äldre.

---

## VBA

### Säkerhet

```
Skapa makrot utan att använda ActiveSheet eller Select.
Referera explicit till ranges.
```

### Felhantering

```
Lägg till felhantering (On Error) i makrot
```

---

## Power Query

### Dokumentera steg

```
Ge varje steg ett beskrivande namn istället för "Step1, Step2"
```

### Optimering

```
Filtrera data så tidigt som möjligt i query-kedjan
för bättre prestanda.
```

---

## Felsökning

```
Formeln ger #VALUE!. Här är formeln:
[formel]

Data ser ut så här:
[exempel på data]
```

---

## Konvertera till tabeller

Använd alltid namngivna tabeller (Ctrl+T) istället för vanliga ranges. Det gör formler mer läsbara.
