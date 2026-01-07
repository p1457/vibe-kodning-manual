# DAX med Claude Code

Tips för att få bästa möjliga DAX-kod från Claude.

---

## Beskriv din datamodell

Claude skriver bättre DAX om den förstår din data:

```
Min datamodell har:
- Faktatabell 'Sales' med kolumner: Date, ProductID, CustomerID, Quantity, Amount
- Dimension 'Product' med: ProductID, ProductName, Category
- Dimension 'Customer' med: CustomerID, CustomerName, Region
- Datumtabell 'Date' med: Date, Year, Month, Quarter

Skapa ett measure för...
```

---

## Vanliga DAX-mönster

### Tidsberäkningar

```
Beräkna försäljning YTD (year-to-date)
```

```
Jämför med samma period förra året (YoY)
```

```
Visa rolling 3-månaders genomsnitt
```

### Ranking

```
Ranka produkter efter försäljning inom varje kategori
```

### Procent av total

```
Visa varje produkts andel av total försäljning
```

---

## Felsökning

```
Mitt measure ger blankt resultat. Här är koden:
[klistra in DAX]

Tabellerna är: [beskriv strukturen]
```

---

## Optimering

```
Denna formel är långsam på stora datamängder:
[klistra in DAX]

Föreslå optimeringar.
```

---

## Nästa steg

Se [best practices](best-practices.md) för Power BI-utveckling.
