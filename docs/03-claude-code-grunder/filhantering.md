# Filhantering med Claude Code

Claude Code kan läsa, skapa och redigera filer i ditt projekt.

---

## Hur Claude ser filer

=== "Nybörjare"

    Claude Code kan bara se filer i den mapp där du startade den (projektmappen). Den kan inte komma åt filer på andra ställen på din dator.

    **Varför är det bra?**

    - Säkrare - Claude kan inte av misstag ändra viktiga systemfiler
    - Fokuserat - Claude förstår sammanhanget bättre

=== "Standard"

    Claude Code arbetar inom projektets rotmapp och kan:

    - Läsa alla filer i projektet
    - Skapa nya filer och mappar
    - Redigera befintliga filer
    - Söka efter filer med mönster

    Åtkomst utanför projektmappen är begränsad.

=== "Djupdykning"

    Claude Code använder olika verktyg för filoperationer:

    | Verktyg | Användning |
    |---------|------------|
    | `Read` | Läsa en fil |
    | `Write` | Skapa/skriva över en hel fil |
    | `Edit` | Redigera delar av en fil |
    | `Glob` | Hitta filer med mönster |
    | `Grep` | Söka i filinnehåll |

---

## Läsa filer

```
Visa innehållet i package.json
```

```
Vad står det i src/config.js?
```

```
Läs de första 50 raderna av data.csv
```

---

## Skapa filer

```
Skapa en ny fil components/Button.jsx med en enkel knappkomponent
```

```
Skapa mappen utils och en fil utils/helpers.js
```

---

## Redigera filer

=== "Nybörjare"

    Beskriv vad du vill ändra:

    ```
    I index.html, ändra rubriken från "Hej" till "Välkommen"
    ```

    ```
    Lägg till en ny funktion i helpers.js som räknar ut moms
    ```

    Claude hittar rätt ställe och gör ändringen.

=== "Standard"

    Var specifik om var ändringen ska göras:

    ```
    I src/api.js, i funktionen fetchUsers(), lägg till
    felhantering med try/catch
    ```

    ```
    Ersätt console.log med en riktig loggfunktion i alla filer
    ```

=== "Djupdykning"

    Claude använder `Edit`-verktyget som gör exakt strängersättning. Om du vill vara säker på exakt vad som ändras:

    ```
    Visa mig exakt vad som kommer ändras innan du gör det
    ```

---

## Söka efter filer

### Hitta filer med mönster

```
Hitta alla JavaScript-filer i projektet
```

```
Vilka filer finns i src-mappen?
```

### Söka i filinnehåll

```
Var använder vi funktionen calculateTotal?
```

```
Hitta alla TODO-kommentarer i koden
```

---

## Praktiskt exempel

=== "Nybörjare"

    **Scenario:** Du vill lägga till en ny sida i ditt projekt.

    ```
    Jag vill lägga till en "Om oss"-sida. Den ska ha samma stil
    som index.html men med information om företaget.
    ```

    Claude kommer:
    1. Läsa befintlig index.html för att förstå stilen
    2. Skapa en ny fil about.html
    3. Eventuellt uppdatera navigation om den finns

=== "Standard"

    **Refaktorering:**

    ```
    Flytta alla API-anrop från components/ till en ny mapp
    services/. Uppdatera alla importer.
    ```

=== "Djupdykning"

    **Massändringar med mönster:**

    ```
    Byt från CommonJS (require/module.exports) till
    ES modules (import/export) i alla .js-filer
    ```

---

## Nästa steg

Lär dig [konversationsteknik](konversationsteknik.md) för att få bättre resultat.
