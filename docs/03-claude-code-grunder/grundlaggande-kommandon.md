# Grundläggande kommandon i Claude Code

Här lär du dig de viktigaste kommandona för att arbeta effektivt med Claude Code.

!!! abstract "Vad du kommer lära dig"
    - Hur du startar och avslutar Claude Code
    - @-kommandon för att referera till filer
    - Hur du låter Claude arbeta utan att fråga om tillåtelse
    - Slash-kommandon och tangentbordsgenvägar
    - Sessionshantering - spara och återuppta arbete

---

## Starta och avsluta

```bash
# Starta Claude Code i nuvarande mapp
claude

# Avsluta sessionen
/exit

# Eller tryck Ctrl+D
```

---

## @-kommandon: Referera till filer

=== "Nybörjare"

    Med **@-symbolen** kan du peka på filer direkt i din fråga. Detta är snabbare än att be Claude leta efter filer själv.

    ```
    Förklara vad @src/app.js gör
    ```

    ```
    Jämför @index.html och @about.html
    ```

    ```
    Vad finns i mappen @src/components?
    ```

    **Varför använda @?**

    - Claude läser filen direkt istället för att söka
    - Sparar tid och kontext
    - Du vet exakt vilken fil Claude tittar på

=== "Standard"

    **@-syntax:**

    | Exempel | Vad det gör |
    |---------|-------------|
    | `@filnamn.js` | Läser in filen |
    | `@src/components/` | Visar mappstruktur |
    | `@*.yaml` | Alla yaml-filer |
    | `@package.json` | Specifik fil i roten |

    **Praktiska exempel:**

    ```
    Lägg till felhantering i @src/api.js baserat på mönstret i @src/utils/errors.js
    ```

    ```
    Skapa tester för @src/components/Button.jsx
    ```

=== "Djupdykning"

    @-referensen inkluderar hela filens innehåll i konversationen. För mappar visas en fillista.

    **MCP-resurser:**
    ```
    @github:repos/owner/repo/issues
    @postgres:query "SELECT * FROM users"
    ```

    Format: `@servername:resourcepath`

---

## Låta Claude arbeta utan avbrott

=== "Nybörjare"

    Som standard frågar Claude om tillåtelse innan den ändrar filer eller kör kommandon. Det är säkert, men kan bli jobbigt om du vill gå iväg och låta Claude arbeta.

    **Lösning: Tryck ++shift+tab++ för att byta läge!**

    Varje gång du trycker ++shift+tab++ byter du mellan:

    1. **Normal** - Claude frågar om allt (standard)
    2. **Auto-accept** - Claude får ändra filer utan att fråga
    3. **Plan** - Claude får bara läsa, inte ändra något

    !!! tip "Rekommendation"
        Använd **Auto-accept** när du litar på uppgiften och vill att Claude ska jobba klart själv.

=== "Standard"

    **Permission modes:**

    | Läge | Bash-kommandon | Filer | Användning |
    |------|----------------|-------|------------|
    | Normal | Frågar | Frågar | Daglig användning |
    | Auto-accept | Frågar | Godkänner | Fokuserat arbete |
    | Plan | Blockerat | Blockerat | Säker analys |

    **Byt läge:**

    - Under sessionen: ++shift+tab++
    - Vid start: `claude --permission-mode acceptEdits`

    **Se nuvarande läge:**
    ```
    /permissions
    ```

=== "Djupdykning"

    **Alla permission modes:**

    ```bash
    claude --permission-mode default      # Standard
    claude --permission-mode acceptEdits  # Auto-accept filer
    claude --permission-mode plan         # Endast läsning
    claude --permission-mode bypassPermissions  # Ingen frågar (riskabelt!)
    ```

    **Permanent inställning i projekt:**

    ```json
    // .claude/settings.json
    {
      "permissions": {
        "defaultMode": "acceptEdits"
      }
    }
    ```

    **Trust-regler för specifika kommandon:**
    ```
    /permissions
    ```
    Här kan du lägga till regler för att alltid tillåta vissa kommandon.

---

## Slash-kommandon

Claude Code har inbyggda kommandon som börjar med `/`:

### De viktigaste

| Kommando | Beskrivning |
|----------|-------------|
| `/help` | Visa hjälp och alla kommandon |
| `/exit` | Avsluta Claude Code |
| `/clear` | Rensa konversationshistoriken |
| `/compact` | Komprimera historiken för att spara kontext |

### Sessioner och minne

| Kommando | Beskrivning |
|----------|-------------|
| `/memory` | Visa och redigera projektminnet (CLAUDE.md) |
| `/rename` | Ge sessionen ett namn |
| `/resume` | Växla till en tidigare session |

### Inställningar

| Kommando | Beskrivning |
|----------|-------------|
| `/permissions` | Se och ändra tillåtelse-regler |
| `/config` | Visa eller ändra inställningar |
| `/model` | Byt AI-modell (sonnet, opus, haiku) |
| `/cost` | Se hur mycket du har använt (tokens/kostnad) |

### Avancerat

| Kommando | Beskrivning |
|----------|-------------|
| `/vim` | Aktivera Vim-redigeringsläge |
| `/agents` | Se och skapa underagenter |
| `/add-dir` | Lägg till extra mappar som Claude kan komma åt |

---

## Tangentbordsgenvägar

=== "Nybörjare"

    | Genväg | Vad det gör |
    |--------|-------------|
    | ++enter++ | Skicka meddelande |
    | ++ctrl+c++ | Avbryt nuvarande operation |
    | ++ctrl+d++ | Avsluta Claude Code |
    | ++shift+tab++ | Byt tillåtelse-läge |
    | ++up++ / ++down++ | Bläddra i tidigare meddelanden |
    | ++tab++ | Autokomplettera filnamn |
    | ++esc++ ++esc++ | Ångra senaste ändringen |

=== "Standard"

    | Genväg | Vad det gör |
    |--------|-------------|
    | ++ctrl+l++ | Rensa skärmen (behåller historik) |
    | ++ctrl+o++ | Visa/dölj Claude's tankegång (verbose) |
    | ++ctrl+r++ | Sök i kommandohistorik |
    | ++shift+tab++ | Cykla permission modes |
    | ++esc++ ++esc++ | Ångra senaste filändringar |

=== "Djupdykning"

    **Plattformsspecifika:**

    | Funktion | macOS | Windows/Linux |
    |----------|-------|---------------|
    | Byt modell | ++option+p++ | ++alt+p++ |
    | Klistra bild | ++ctrl+v++ | ++alt+v++ |

    **Tips:** ++ctrl+o++ är ovärderligt för att förstå hur Claude tänker när den löser problem.

---

## Sessionshantering

=== "Nybörjare"

    Du kan **spara ditt arbete** och fortsätta senare:

    **Namnge sessionen:**
    ```
    /rename mitt-projekt-auth
    ```

    **Nästa gång - fortsätt där du slutade:**
    ```bash
    claude --resume mitt-projekt-auth
    ```

    **Eller visa alla sparade sessioner:**
    ```bash
    claude --resume
    ```

    !!! tip "Varför är detta bra?"
        Claude kommer ihåg hela konversationen - vad ni pratat om, vilka filer ni ändrat, och vad som återstår att göra.

=== "Standard"

    **Sessionskommandon:**

    ```bash
    # Fortsätt senaste sessionen
    claude --continue

    # Fortsätt namngiven session
    claude --resume mitt-feature

    # Lista sessioner och välj
    claude --resume
    ```

    **Under sessionen:**
    ```
    /rename feature-auth
    /resume  # byt till annan session
    ```

=== "Djupdykning"

    Sessioner sparas lokalt och innehåller:

    - Hela konversationshistoriken
    - Kontext från lästa filer
    - Permission-inställningar för sessionen

    **Kombinera med Git worktrees för parallellt arbete:**
    ```bash
    git worktree add ../project-feature-a -b feature-a
    cd ../project-feature-a
    claude  # Helt isolerad session
    ```

---

## Köra bash-kommandon direkt

=== "Nybörjare"

    Du kan be Claude köra terminalkommandon:

    ```
    Kör npm install för att installera dependencies
    ```

    Men du kan också köra kommandon **direkt** utan att Claude analyserar dem - skriv bara `!` före:

    ```
    ! npm test
    ! git status
    ```

    !!! info "Skillnaden"
        - Utan `!`: Claude ser resultatet och kan hjälpa dig tolka det
        - Med `!`: Snabbare, inget svar från Claude

=== "Standard"

    **Bash-mode med `!`:**

    ```
    ! npm run build
    ! docker ps
    ! ls -la src/
    ```

    Resultatet visas men Claude analyserar det inte automatiskt.

=== "Djupdykning"

    **Print mode för automation:**

    ```bash
    # Kör Claude utan interaktiv session
    claude -p "Förklara denna fil" < code.js > explanation.txt

    # Piped input
    cat error.log | claude -p "Vad är root causen?"

    # JSON-output
    claude -p "Lista alla TODO:s" --output-format json
    ```

---

## Kontexthantering

=== "Nybörjare"

    Claude kommer ihåg vad ni pratat om tidigare i sessionen. Men om historiken blir för lång kan den "glömma" äldre saker.

    **Om Claude verkar glömma:**

    ```
    /compact
    ```

    Detta sammanfattar historiken för att spara utrymme.

=== "Standard"

    Claude Code har en **kontextfönster** som begränsar hur mycket den kan komma ihåg.

    - Använd `/compact` för att komprimera historiken
    - Använd `/clear` för att börja om helt
    - Använd **@-referens** istället för att be Claude läsa filer

=== "Djupdykning"

    Kontextfönstret är ~200k tokens. När det fylls används automatisk sammanfattning.

    **Extended thinking för komplexa problem:**
    ```
    ultrathink: designa en arkitektur för vår caching-lösning
    ```

    **Se Claude's tankegång:**

    Tryck ++ctrl+o++ för verbose mode - visar Claude's resonemang i grå text.

---

## Bildanalys

=== "Nybörjare"

    Claude kan analysera bilder! Du kan:

    1. **Dra och släpp** en bild i terminalfönstret
    2. **Klistra** från urklipp: ++ctrl+v++ (macOS/Linux) eller ++alt+v++ (Windows)
    3. **Ange sökväg**: "Analysera bilden @screenshot.png"

    **Exempel:**
    ```
    [dra in en skärmdump]
    Vad visar denna skärmdump? Finns det några fel?
    ```

=== "Standard"

    ```
    Analysera @mockup.png och generera HTML/CSS som matchar designen
    ```

    ```
    Vad visar felmeddelandet i @error-screenshot.png?
    ```

---

## Prova själv

!!! example "Övning: Testa de nya funktionerna"

    1. **Starta Claude Code** i valfri mapp:
       ```bash
       claude
       ```

    2. **Testa @-referens:**
       ```
       Vad finns i mappen @.?
       ```

    3. **Namnge sessionen:**
       ```
       /rename min-ovning
       ```

    4. **Byt till auto-accept mode:**
       Tryck ++shift+tab++ och se hur läget ändras i prompten

    5. **Skapa en fil:**
       ```
       Skapa en fil test.txt med lite text
       ```
       (Nu bör Claude skapa filen utan att fråga!)

    6. **Se verbose mode:**
       Tryck ++ctrl+o++ och ställ en fråga - se hur Claude tänker

    7. **Avsluta:**
       ```
       /exit
       ```

    8. **Återuppta sessionen:**
       ```bash
       claude --resume min-ovning
       ```

---

## Sammanfattning

!!! success "Det viktigaste att ta med sig"
    - **@-kommandon** (`@filnamn`) refererar direkt till filer
    - **++shift+tab++** byter mellan tillåtelse-lägen (auto-accept är smidigt!)
    - **/rename** och **--resume** låter dig spara och fortsätta arbete
    - **!** före ett kommando kör det direkt utan Claude's analys
    - **++ctrl+o++** visar hur Claude tänker (verbose mode)
    - **++esc++ ++esc++** ångrar senaste filändringar

---

## Nästa steg

Lär dig mer om [filhantering](filhantering.md) i Claude Code.
