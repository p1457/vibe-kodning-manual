# Permissions och säkerhet

Kontrollera vad Claude får göra - från säkert utforskande till autonomt arbete.

!!! abstract "Vad du kommer lära dig"
    - De olika permission-lägena
    - Hur du byter läge under arbetet
    - Köra terminalkommandon
    - Konfigurera trust-regler

---

## Permission modes

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

---

## Byta läge under sessionen

### Med tangentbord

++shift+tab++ cyklar mellan lägena. Du ser nuvarande läge i prompten.

### Med kommando

```
/permissions
```

Öppnar en meny där du kan:
- Se nuvarande läge
- Byta läge
- Lägga till trust-regler

---

## Köra terminalkommandon

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

    **Be Claude köra och analysera:**
    ```
    Kör testerna och förklara eventuella fel
    ```

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

## Trust-regler

Trust-regler låter dig tillåta specifika kommandon utan att bli tillfrågad.

### Lägga till trust-regler

```
/permissions
```

Välj "Add trusted command" och ange kommandomönster:

```
npm test
npm run *
git status
git diff
```

### I konfigurationsfil

```json
// .claude/settings.json
{
  "permissions": {
    "trustedCommands": [
      "npm test",
      "npm run *",
      "git status",
      "git diff"
    ]
  }
}
```

---

## Säkerhetsnivåer

| Nivå | Lämplig för |
|------|-------------|
| **Plan mode** | Utforska okänd kod, säkerhetsanalys |
| **Normal** | Dagligt arbete, lära sig |
| **Auto-accept** | Fokuserat arbete du litar på |
| **Bypass** | CI/CD, automatisering (försiktigt!) |

### Plan mode för säker utforskning

```bash
claude --permission-mode plan
```

I plan mode kan Claude:
- Läsa filer
- Söka i kodbasen
- Föreslå ändringar (men inte göra dem)

Perfekt för:
- Granska andras kod
- Förstå ett nytt projekt
- Säkerhetsanalys

---

## Ångra ändringar

Om Claude gjorde något du inte ville:

**++esc++ ++esc++** - Ångrar senaste filändringar

Claude visar vad som ångrades och du kan välja att behålla eller förkasta.

---

## Best practices

### För nybörjare

1. Börja i **Normal mode**
2. Lär dig vad Claude frågar om
3. Byt till **Auto-accept** för repetitiva uppgifter

### För erfarna

1. Använd **Auto-accept** som standard
2. Lägg till trust-regler för vanliga kommandon
3. Byt till **Plan** för okänd kod

### Aldrig göra

!!! danger "Varning"
    - Kör **inte** `bypassPermissions` på viktiga system
    - Tillåt **inte** `rm -rf` som trusted command
    - Granska alltid ändringar i känsliga filer

---

## Felsökning

??? question "Claude frågar trots Auto-accept"

    Auto-accept gäller endast filändringar. Bash-kommandon frågar fortfarande (om inte trusted).

??? question "Jag vill ha mer kontroll"

    Använd [Hooks](../06-avancerat/hooks.md) för att automatiskt validera eller blockera specifika operationer.

??? question "Hur återställer jag till standard?"

    ```bash
    claude --permission-mode default
    ```

    Eller ta bort `permissions` från `.claude/settings.json`.

---

## Sammanfattning

!!! success "Det viktigaste"
    - **++shift+tab++** byter mellan permission-lägen
    - **Auto-accept** låter Claude ändra filer utan att fråga
    - **Plan mode** är säkert för att utforska okänd kod
    - **`!`** kör kommandon direkt utan Claude's analys
    - **++esc++ ++esc++** ångrar senaste ändringar
    - **Trust-regler** tillåter specifika kommandon

---

## Nästa steg

Gå vidare till [filhantering](filhantering.md) för att lära dig hur Claude arbetar med filer.
