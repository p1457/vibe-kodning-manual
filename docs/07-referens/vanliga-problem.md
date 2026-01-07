# Vanliga problem och lösningar

Samling av vanliga problem med lösningar.

---

## Claude Code

??? question "Kommandot 'claude' hittades inte"

    **Problem:** Terminalen känner inte igen `claude`-kommandot.

    **Lösningar:**

    1. Starta om terminalen
    2. Kontrollera att Node.js är installerat: `node --version`
    3. Installera om Claude Code:
       ```bash
       npm install -g @anthropic-ai/claude-code
       ```
    4. Kontrollera PATH:
       ```bash
       npm config get prefix
       ```

??? question "API-nyckelfel / Authentication error"

    **Problem:** Claude Code accepterar inte din API-nyckel.

    **Lösningar:**

    1. Kontrollera att nyckeln är korrekt kopierad (inga extra mellanslag)
    2. Verifiera på [console.anthropic.com](https://console.anthropic.com) att nyckeln är aktiv
    3. Sätt nyckeln på nytt:
       ```bash
       claude config set apiKey
       ```

??? question "Claude svarar långsamt eller timeout"

    **Problem:** Det tar lång tid att få svar.

    **Lösningar:**

    1. Komprimera historiken: `/compact`
    2. Rensa helt: `/clear`
    3. Kontrollera din internetuppkoppling
    4. Anthropics API kan ha tillfälliga problem

---

## Git

??? question "'git' hittades inte"

    **Lösning:** Installera Git från [git-scm.com](https://git-scm.com)

??? question "Not a git repository"

    **Problem:** Du försöker köra git-kommandon i en mapp utan Git.

    **Lösning:**
    ```bash
    git init
    ```

??? question "Permission denied (publickey)"

    **Problem:** SSH-autentisering misslyckas.

    **Lösningar:**

    1. Använd HTTPS istället för SSH
    2. Konfigurera SSH-nycklar:
       ```bash
       ssh-keygen -t ed25519
       ssh-add ~/.ssh/id_ed25519
       ```
    3. Lägg till public key på GitHub

??? question "Merge conflict"

    **Problem:** Git kan inte automatiskt slå ihop ändringar.

    **Lösning:**

    1. Öppna filen med konflikten
    2. Leta efter `<<<<<<<`, `=======`, `>>>>>>>`
    3. Välj vilken version du vill behålla
    4. Ta bort konfliktmarkeringarna
    5. `git add fil` och `git commit`

---

## Home Assistant

??? question "Invalid config"

    **Problem:** Home Assistant startar inte på grund av konfigurationsfel.

    **Lösningar:**

    1. Kör konfigurationsvalidering:
       ```bash
       ha core check
       ```
    2. Kontrollera YAML-indentation (använd mellanslag, inte tabs)
    3. Validera YAML online: [yamllint.com](https://www.yamllint.com)

??? question "Automation triggas inte"

    **Kontrollera:**

    1. Att automationen är aktiverad
    2. Att entity_id är korrekt stavat
    3. Att conditions uppfylls
    4. Developer Tools → States för att se aktuella states

??? question "Entity not found"

    **Lösningar:**

    1. Kontrollera stavning
    2. Gå till Developer Tools → States och sök
    3. Kontrollera att integrationen är korrekt konfigurerad

---

## Excel / Power Query

??? question "#REF! fel"

    **Problem:** Referensen pekar på celler som inte finns.

    **Vanliga orsaker:**

    - Borttagna kolumner/rader som formeln refererade till
    - Felaktiga intervall i VLOOKUP/INDEX

??? question "#VALUE! fel"

    **Problem:** Fel datatyp.

    **Vanliga orsaker:**

    - Text där siffra förväntas
    - Datum i fel format
    - Dolda mellanslag: `=TRIM(cell)`

??? question "Power Query laddar inte"

    **Lösningar:**

    1. Kontrollera datakällan (fil/URL)
    2. Uppdatera credentials
    3. Data → Queries & Connections → Refresh All

---

## Power BI

??? question "Measure ger blank"

    **Kontrollera:**

    1. Filterkontext - kanske filtreras all data bort
    2. Relationer mellan tabeller
    3. Datatyper i kolumnerna

??? question "Circular dependency"

    **Problem:** Measures refererar till varandra.

    **Lösning:** Omstrukturera DAX så att det inte finns cirkulära referenser. Använd variabler (VAR) för att bryta cirkeln.

---

## Webbappar

??? question "JavaScript fungerar inte"

    **Kontrollera:**

    1. Öppna Developer Tools (F12) → Console
    2. Leta efter röda felmeddelanden
    3. Är script-taggen rätt placerad? (före `</body>`)
    4. Finns filen som refereras?

??? question "CSS appliceras inte"

    **Kontrollera:**

    1. Är länken till CSS korrekt?
    2. Selektorn matchar HTML?
    3. Finns mer specifik CSS som överskrider?
    4. Cacha? Prova hard refresh (Ctrl+Shift+R)
