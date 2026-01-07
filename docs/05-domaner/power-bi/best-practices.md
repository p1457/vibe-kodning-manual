# Best Practices för Power BI

Tips för effektiv Power BI-utveckling med Claude Code.

---

## Strukturera dina prompts

### Inkludera kontext

```
Jag bygger en säljrapport för [bransch].
Datamodellen har [beskriv tabeller].
Målgruppen är [vem som ska använda rapporten].
```

### Var specifik

```
# Vagt
"Jag behöver en formel för försäljning"

# Specifikt
"Jag behöver ett measure som summerar Amount från Sales-tabellen,
filtrerat på aktuellt år baserat på Date-tabellen"
```

---

## DAX-konventioner

Be Claude följa konventioner:

```
Följ dessa konventioner:
- Measure-namn börjar med verb (Calculate, Count, Sum)
- Använd variablar (VAR/RETURN) för läsbarhet
- Kommentera komplexa delar
```

---

## Dokumentation

```
Förklara denna DAX-formel rad för rad så jag kan förstå den:
[klistra in DAX]
```

---

## Vanliga fallgropar

!!! warning "Relationsproblem"

    Om DAX ger oväntade resultat, kontrollera relationer:

    ```
    Vilken kardinalitet bör relationen mellan Sales och Product ha?
    ```

!!! warning "Filterkontext"

    ```
    Förklara skillnaden mellan CALCULATE och CALCULATETABLE
    och när jag ska använda respektive.
    ```

---

## Integration med Power Query

```
Bör denna transformation göras i Power Query (M) eller DAX?
[beskriv transformationen]
```
