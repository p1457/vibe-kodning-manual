# Excel med Claude Code

Använd Claude Code för att skapa formler, makron och Power Query-lösningar.

!!! abstract "Vad du kommer lära dig"
    - Varför Claude Code är ett perfekt komplement till Excel
    - Hur du får hjälp med formler, VBA och Power Query
    - Hur du beskriver ditt problem för bästa resultat

---

## Varför Claude Code för Excel?

=== "Nybörjare"

    Excel har tusentals funktioner - ingen kan alla utantill. Claude kan:

    - Skriva komplexa formler åt dig
    - Förklara hur befintliga formler fungerar
    - Skapa VBA-makron för automation
    - Hjälpa med Power Query-transformationer

=== "Standard"

    Fördelar:

    - Snabbt konvertera logik till formel
    - Kombinera funktioner du kanske inte kände till
    - Felsöka #REF! och #VALUE!-fel
    - Optimera långsamma kalkylblad

---

## Arbetsflöde

### Kopiera formler

1. Beskriv vad du behöver för Claude
2. Claude genererar formeln
3. Kopiera och klistra in i Excel
4. Justera cellreferenser efter behov

---

## Exempel: Komplex formel

**Din prompt:**
```
Skapa en Excel-formel som hittar det senaste datumet i kolumn A
där motsvarande värde i kolumn B är "Klar".
```

**Claude svarar:**
```excel
=MAXIFS(A:A, B:B, "Klar")
```

---

## VBA-makron

```
Skapa ett VBA-makro som:
1. Går igenom alla rader i Sheet1
2. Om kolumn C är tom, färgar raden röd
3. Sparar resultatet som PDF med dagens datum i filnamnet
```

---

## Power Query (M)

```
Skapa en Power Query-transformation som:
- Läser in alla CSV-filer från en mapp
- Kombinerar dem till en tabell
- Lägger till en kolumn med filnamnet
```

---

## Prova själv

!!! example "Övning: Beskriv ditt formel-problem"

    Tänk på en Excel-uppgift du ofta gör manuellt eller en formel du vill ha:

    1. **Vad har du?** (data i kolumn A och B, etc.)
    2. **Vad vill du få fram?** (summa, sök ett värde, hitta datum, etc.)
    3. **Finns det villkor?** (bara om värdet är större än X, etc.)

    **Exempelprompt:**
    ```
    Jag har en tabell med:
    - Kolumn A: Produktnamn
    - Kolumn B: Kategori
    - Kolumn C: Försäljning

    Skapa en formel som summerar försäljningen för alla
    produkter i kategorin "Elektronik", men bara om
    försäljningen är över 1000.
    ```

---

## Sammanfattning

!!! success "Det viktigaste att ta med sig"
    - Claude Code kan **läsa Excel-filer** direkt för att analysera data
    - För **formler och VBA**: kopiera/klistra är enklast
    - Beskriv din **datastruktur** (vilka kolumner, vad de innehåller)
    - Ange din **Excel-version** - nyare versioner har fler funktioner
    - Claude kan förklara **komplexa formler** steg för steg

---

## Nästa steg

Lär dig mer om [arbetsflödet](arbetsflode.md), [Power Query](power-query.md) och [best practices](best-practices.md).
