# Filhantering med Claude Code

Claude Code kan läsa, skapa och redigera filer i ditt projekt.

!!! abstract "Vad du kommer lära dig"
    - Var filer hamnar när Claude skapar dem
    - Hur du styr vilka mappar Claude har tillgång till
    - Hur du läser, skapar och redigerar filer
    - Hur du söker i projektet

---

## Var hamnar filer som Claude skapar?

=== "Nybörjare"

    **Enkelt svar:** I den mapp där du startade Claude Code.

    ```bash
    # Du står i denna mapp
    cd C:\Users\Peter\Documents\mitt-projekt

    # Du startar Claude
    claude

    # Du ber Claude skapa en fil
    > Skapa en fil som heter test.html

    # Filen hamnar här:
    # C:\Users\Peter\Documents\mitt-projekt\test.html
    ```

    !!! tip "Kom ihåg"
        Kontrollera alltid att du är i **rätt mapp** innan du startar Claude Code. Använd `pwd` för att se var du är.

=== "Standard"

    Claude skapar filer relativt till **working directory** (där du körde `claude`).

    ```
    mitt-projekt/           <- Du kör "claude" här
    ├── src/
    │   └── app.js
    ├── index.html
    └── [nya filer hamnar här]
    ```

    **Med sökväg:**
    ```
    Skapa filen src/components/Button.jsx
    ```
    Resultat: `mitt-projekt/src/components/Button.jsx`

=== "Djupdykning"

    Claude Code kan bara skriva filer inom tillåtna mappar (sandboxing).

    **Se vilka mappar som är tillåtna:**
    ```
    /permissions
    ```

    **Lägg till extra mappar:**
    ```bash
    # Vid start
    claude --add-dir ../shared-lib ../config

    # Under sessionen
    /add-dir /path/to/another/directory
    ```

---

## Lägga till extra mappar

=== "Nybörjare"

    Ibland behöver Claude komma åt filer i andra mappar än ditt projekt. Då kan du lägga till dem:

    ```bash
    # Starta Claude med tillgång till extra mappar
    claude --add-dir ../annan-mapp
    ```

    Eller under sessionen:
    ```
    /add-dir C:\Users\Peter\Documents\delad-kod
    ```

=== "Standard"

    ```bash
    # Flera mappar
    claude --add-dir ../lib ../config ../shared

    # Under sessionen
    /add-dir /path/to/directory
    ```

    **Permanent i projektinställningar:**

    Skapa filen `.claude/settings.json`:
    ```json
    {
      "additionalDirectories": [
        "../shared-lib",
        "../config"
      ]
    }
    ```

=== "Djupdykning"

    Claude kan **aldrig** skriva utanför tillåtna mappar - detta är en säkerhetsåtgärd.

    Om du försöker referera till en fil utanför tillåtna mappar får du ett felmeddelande.

---

## Läsa filer

=== "Nybörjare"

    **Metod 1: Be Claude läsa**
    ```
    Visa innehållet i package.json
    ```

    **Metod 2: Använd @ (snabbare)**
    ```
    Förklara vad @package.json gör
    ```

    Skillnaden är att `@` direkt inkluderar filen utan att Claude behöver söka.

=== "Standard"

    ```
    # Läs specifik fil
    Vad står det i @src/config.js?

    # Läs del av fil
    Visa rad 50-100 i @data.csv

    # Läs flera filer
    Jämför @src/old-api.js och @src/new-api.js
    ```

=== "Djupdykning"

    Claude använder **Read**-verktyget internt. För stora filer läser den i delar.

    **Begränsningar:**
    - Binärfiler (bilder, .exe) kan inte läsas som text
    - Väldigt stora filer (>1MB) kan trunkeras
    - Vissa filer kan vara låsta av andra program

---

## Skapa filer

=== "Nybörjare"

    Beskriv bara vad du vill ha:

    ```
    Skapa en HTML-sida med en blå bakgrund och texten "Välkommen"
    ```

    Claude skapar filen och berättar vad den heter och var den hamnar.

    **Med specifikt namn:**
    ```
    Skapa filen about.html med information om vårt företag
    ```

=== "Standard"

    ```
    # Med sökväg
    Skapa src/components/Header.jsx med en responsiv header

    # Skapa mapp och fil
    Skapa mappen utils och en fil utils/helpers.js med vanliga hjälpfunktioner

    # Baserat på befintlig fil
    Skapa en test-fil för @src/api.js
    ```

=== "Djupdykning"

    Claude använder **Write**-verktyget för nya filer.

    **Observera:**
    - Hela filinnehållet skrivs på en gång
    - Om filen redan finns skrivs den över (Claude bör varna)
    - Mappar skapas automatiskt om de inte finns

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

    !!! tip "Ångra ändringar"
        Om något blev fel, tryck ++esc++ ++esc++ för att ångra!

=== "Standard"

    Var specifik om var ändringen ska göras:

    ```
    I @src/api.js, i funktionen fetchUsers(), lägg till
    felhantering med try/catch
    ```

    ```
    Ersätt alla console.log med logger.info i @src/
    ```

    **Förhandsgranska ändringar:**
    ```
    Visa mig exakt vad som kommer ändras innan du gör det
    ```

=== "Djupdykning"

    Claude använder **Edit**-verktyget som gör exakt strängersättning.

    **Hur Edit fungerar:**
    1. Claude hittar exakt textsträngen som ska ersättas
    2. Ersätter med ny text
    3. Om strängen inte hittas eller finns flera gånger - felmeddelande

    **Tips för säkra edits:**
    - Inkludera tillräckligt med kontext så rätt ställe hittas
    - Be om att se diff innan ändring vid känsliga filer

---

## Söka efter filer

### Hitta filer med namn/mönster

```
Hitta alla JavaScript-filer i projektet
```

```
Vilka filer finns i src-mappen?
```

```
Lista alla .yaml-filer
```

### Söka i filinnehåll

```
Var använder vi funktionen calculateTotal?
```

```
Hitta alla TODO-kommentarer i koden
```

```
I vilka filer importeras axios?
```

=== "Djupdykning"

    Claude använder:

    - **Glob** - Hitta filer med mönster (`*.js`, `src/**/*.tsx`)
    - **Grep** - Söka i filinnehåll med regex

    ```
    Använd Grep för att hitta alla ställen där "deprecated" nämns
    ```

---

## Praktiskt exempel: Refaktorering

=== "Nybörjare"

    **Scenario:** Du vill lägga till en ny sida i ditt projekt.

    ```
    Jag vill lägga till en "Om oss"-sida. Den ska ha samma stil
    som @index.html men med information om företaget.
    ```

    Claude kommer:
    1. Läsa befintlig index.html för att förstå stilen
    2. Skapa en ny fil about.html
    3. Eventuellt uppdatera navigation om den finns

=== "Standard"

    **Flytta och organisera:**

    ```
    Flytta alla API-anrop från @src/components/ till en ny mapp
    services/. Uppdatera alla importer.
    ```

=== "Djupdykning"

    **Massändringar:**

    ```
    Byt från CommonJS (require/module.exports) till
    ES modules (import/export) i alla .js-filer under src/
    ```

    **Med verifiering:**
    ```
    Gör ändringarna, kör sedan testerna för att verifiera
    ```

---

## Säkerhet och begränsningar

!!! warning "Viktigt att veta"

    - Claude kan **inte** komma åt filer utanför projektmappen (om du inte lagt till dem)
    - Claude **frågar** innan den ändrar filer (om du inte aktiverat auto-accept)
    - Du kan **alltid ångra** med ++esc++ ++esc++
    - Känsliga filer (`.env`, `secrets.yaml`) bör du vara försiktig med

---

## Sammanfattning

!!! success "Det viktigaste att ta med sig"
    - Filer skapas i **mappen där du startade Claude** (working directory)
    - Använd **@filnamn** för att snabbt referera till filer
    - **`/add-dir`** lägger till extra mappar som Claude kan komma åt
    - Claude kan **läsa, skapa och redigera** - men bara inom tillåtna mappar
    - **++esc++ ++esc++** ångrar senaste filändringar

---

## Nästa steg

Lär dig [konversationsteknik](konversationsteknik.md) för att få bättre resultat från Claude.
