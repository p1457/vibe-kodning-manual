# Power BI med Claude Code

Använd Claude Code för att skapa DAX-formler och utveckla Power BI-lösningar.

!!! abstract "Vad du kommer lära dig"
    - Varför Claude Code är perfekt för DAX-formler
    - Hur arbetsflödet mellan Power BI och Claude ser ut
    - Hur du beskriver din datamodell för Claude

---

## Vad är Power BI?

=== "Nybörjare"

    **Power BI** är Microsofts verktyg för att skapa interaktiva rapporter och dashboards. Du kan koppla ihop data från olika källor och visualisera den.

=== "Standard"

    Power BI består av:

    - **Power BI Desktop** - Skapa rapporter
    - **Power BI Service** - Dela och publicera
    - **DAX** - Formelspråk för beräkningar
    - **Power Query (M)** - Datatransformation

---

## Varför Claude Code för Power BI?

DAX är kraftfullt men har brant inlärningskurva. Claude kan:

- Skriva komplexa DAX-formler
- Förklara befintliga formler
- Optimera långsamma measures
- Konvertera Excel-formler till DAX

---

## Arbetsflöde

Eftersom Power BI Desktop är ett grafiskt verktyg, arbetar du oftast så här:

1. **Beskriv vad du behöver** för Claude
2. **Kopiera** den genererade DAX-koden
3. **Klistra in** i Power BI
4. **Testa** och iterera

---

## Exempel: Skapa ett measure

**Din prompt:**
```
Skapa ett DAX measure som beräknar försäljning same period last year,
men bara för produkter som fanns förra året också.
```

**Claude Code svarar:**
```dax
Sales SPLY =
VAR CurrentProducts =
    VALUES('Product'[ProductID])
VAR LastYearProducts =
    CALCULATETABLE(
        VALUES('Product'[ProductID]),
        SAMEPERIODLASTYEAR('Date'[Date])
    )
VAR CommonProducts =
    INTERSECT(CurrentProducts, LastYearProducts)
RETURN
    CALCULATE(
        SUM('Sales'[Amount]),
        SAMEPERIODLASTYEAR('Date'[Date]),
        CommonProducts  -- Tabellen filtrerar automatiskt
    )
```

!!! info "Förklaring"
    - `VALUES()` hämtar unika produkter i aktuell filterkontext
    - `CALCULATETABLE()` hämtar produkter som fanns förra året
    - `INTERSECT()` hittar produkter som finns i båda perioderna
    - Tabellen `CommonProducts` används som filter i CALCULATE

---

## Prova själv

!!! example "Övning: Beskriv ditt behov"

    Tänk på en beräkning du behöver i Power BI och beskriv den för Claude:

    1. **Vilka tabeller har du?** (Sales, Product, Customer, Date, etc.)
    2. **Vad vill du beräkna?** (summa, genomsnitt, jämförelse, ranking, etc.)
    3. **Finns det filter eller villkor?**

    **Exempelprompt:**
    ```
    Jag har en Sales-tabell med kolumnerna Amount och Date,
    och en Product-tabell med ProductName och Category.
    De är kopplade via ProductID.

    Skapa ett measure som visar total försäljning för
    varje kategori som procent av total försäljning.
    ```

---

## Sammanfattning

!!! success "Det viktigaste att ta med sig"
    - Claude kan **inte läsa .pbix-filer** - du arbetar genom kopiera/klistra
    - Beskriv din **datamodell** (tabeller, kolumner, relationer) för bästa resultat
    - Claude är särskilt bra på **DAX** som är svårt att lära sig själv
    - **Kopiera DAX-koden** och klistra in i Power BI Desktop

---

## Nästa steg

Lär dig mer om det praktiska [arbetsflödet](arbetsflode.md) och [DAX med Claude](dax-med-claude.md).
