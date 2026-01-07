# Ditt första projekt

Nu ska vi skapa och arbeta med ditt första projekt i Claude Code!

!!! abstract "Vad du kommer lära dig"
    - Hur du skapar en projektmapp på din dator
    - Hur du startar Claude Code i projektet
    - Hur du ger din första instruktion till Claude
    - Hur du ser resultatet och fortsätter förbättra

---

## Vad är ett "projekt"?

=== "Nybörjare"

    Ett **projekt** är helt enkelt en mapp på din dator som innehåller allt som hör till det du arbetar med - kod, bilder, inställningar, och så vidare.

    Tänk på det som en pärm där du samlar allt om ett ämne.

=== "Standard"

    Ett projekt är en katalogstruktur som innehåller din kod och relaterade filer. Claude Code arbetar inom projektmappen och har tillgång till alla filer där.

=== "Djupdykning"

    Claude Code detekterar automatiskt projektrot genom att leta efter:

    - `.git/` - Git repository
    - `package.json` - Node.js projekt
    - `CLAUDE.md` - Claude Code-specifik konfiguration
    - Andra markörer som `pyproject.toml`, `Cargo.toml`, etc.

---

## Skapa en projektmapp

=== "Windows"

    Öppna **Windows Terminal** och skapa en mapp:

    ```powershell
    # Navigera till var du vill ha projektet
    cd C:\Users\DittNamn\Documents

    # Skapa projektmappen
    mkdir mitt-forsta-projekt

    # Gå in i mappen
    cd mitt-forsta-projekt
    ```

=== "macOS"

    Öppna **Terminal** och skapa en mapp:

    ```bash
    # Navigera till var du vill ha projektet
    cd ~/Documents

    # Skapa projektmappen
    mkdir mitt-forsta-projekt

    # Gå in i mappen
    cd mitt-forsta-projekt
    ```

=== "Linux"

    ```bash
    cd ~/projects  # eller var du vill
    mkdir mitt-forsta-projekt
    cd mitt-forsta-projekt
    ```

---

## Starta Claude Code i projektet

Nu startar vi Claude Code:

```bash
claude
```

Du ser nu Claude Codes interface. Det viktigaste att veta:

- **Skriv vanlig text** för att prata med Claude
- **Tryck Enter** för att skicka
- **Skriv `/help`** för att se tillgängliga kommandon
- **Skriv `/exit`** för att avsluta

---

## Din första prompt

Låt oss be Claude skapa något enkelt:

=== "Nybörjare"

    Skriv detta till Claude:

    ```
    Skapa en enkel HTML-sida som säger "Hej världen!"
    med en blå bakgrund
    ```

    Claude kommer att:
    1. Förstå vad du vill
    2. Skapa filen åt dig
    3. Förklara vad den gjorde

=== "Standard"

    ```
    Skapa en index.html med "Hej världen!" och blå bakgrund.
    Lägg till lite grundläggande CSS.
    ```

=== "Djupdykning"

    ```
    Scaffolda en minimal HTML5-sida med inline CSS.
    Inkludera viewport meta tag för responsivitet.
    ```

---

## Se resultatet

Efter att Claude skapat filen kan du:

=== "Windows"

    ```powershell
    # Lista filer i mappen
    dir

    # Öppna filen i standardwebbläsare
    start index.html
    ```

=== "macOS"

    ```bash
    # Lista filer
    ls

    # Öppna i webbläsare
    open index.html
    ```

=== "Linux"

    ```bash
    ls
    xdg-open index.html
    ```

---

## Iterera och förbättra

Det fina med vibe-kodning är att du kan fortsätta konversationen:

```
Lägg till en knapp som säger "Klicka mig!" och
när man klickar på den så byts bakgrundsfärgen till grön
```

Claude kommer att uppdatera filen baserat på ditt nya önskemål.

---

## Prova själv

!!! example "Övning: Bygg vidare på din sida"

    Nu när du har en grundläggande HTML-sida, prova att be Claude om fler förändringar:

    1. **Lägg till din egen text:**
       ```
       Ändra texten till "Välkommen till min första webbsida!"
       ```

    2. **Experimentera med färger:**
       ```
       Ändra bakgrundsfärgen till mörkblå och texten till vit
       ```

    3. **Lägg till mer innehåll:**
       ```
       Lägg till en paragraf som beskriver vad jag lär mig
       ```

    Observera hur Claude uppdaterar filen och förklarar ändringarna!

---

## Sammanfattning

!!! success "Det viktigaste att ta med sig"
    - Ett **projekt** är en mapp där Claude Code kan se och ändra filer
    - Du startar Claude Code med kommandot `claude` i projektmappen
    - Du **beskriver vad du vill** - Claude skapar koden
    - Du kan **fortsätta konversationen** för att förbättra resultatet
    - **Experimentera fritt** - det är svårt att göra oåterkalleliga fel

---

## Nästa steg

Nu när du har skapat ditt första projekt, låt oss lära oss lite mer om [terminalen](grundlaggande-terminal.md).
