# Grundläggande kommandon i Claude Code

Här lär du dig de viktigaste kommandona för att arbeta effektivt med Claude Code.

!!! abstract "Vad du kommer lära dig"
    - Hur du startar och avslutar Claude Code
    - De inbyggda slash-kommandona (`/help`, `/clear`, etc.)
    - Hur du pratar med Claude för att få saker gjorda
    - Hur Claude hanterar och kommer ihåg kontext

---

## Starta och avsluta

```bash
# Starta Claude Code i nuvarande mapp
claude

# Avsluta sessionen
/exit
```

---

## Slash-kommandon

Claude Code har inbyggda kommandon som börjar med `/`:

| Kommando | Beskrivning |
|----------|-------------|
| `/help` | Visa hjälp och alla kommandon |
| `/exit` | Avsluta Claude Code |
| `/clear` | Rensa konversationshistoriken |
| `/compact` | Komprimera historiken för att spara kontext |
| `/status` | Visa aktuell status |
| `/config` | Visa eller ändra inställningar |

---

## Prata med Claude

=== "Nybörjare"

    Du skriver helt enkelt vad du vill göra på vanlig svenska:

    ```
    Skapa en enkel webbsida med en rubrik som säger Välkommen
    ```

    Claude förstår och skapar filen åt dig.

    **Tips för bättre resultat:**

    - Var specifik: "blå bakgrund" istället för "fin bakgrund"
    - Ge kontext: "för ett recept-projekt" hjälper Claude förstå
    - Fråga om du inte förstår något

=== "Standard"

    **Effektiva promptmönster:**

    ```
    # Skapa något nytt
    Skapa en [typ av fil] som [vad den ska göra]

    # Ändra befintlig fil
    I [filnamn], ändra [vad] till [vad]

    # Fråga om kod
    Förklara vad [filnamn/funktion] gör

    # Felsökning
    Jag får felet [felmeddelande] när jag [vad du gör]
    ```

=== "Djupdykning"

    Claude Code har tillgång till flera verktyg:

    - **Read** - Läsa filer
    - **Write** - Skriva nya filer
    - **Edit** - Redigera befintliga filer
    - **Bash** - Köra terminalkommandon
    - **Glob** - Söka efter filer
    - **Grep** - Söka i filinnehåll

    Du kan explicit be om specifika verktyg:

    ```
    Använd Grep för att hitta alla ställen där "config" nämns
    ```

---

## Arbeta med filer

### Läsa filer

```
Visa innehållet i config.yaml
```

### Skapa filer

```
Skapa en ny fil som heter helpers.js med funktioner för datumformatering
```

### Redigera filer

```
I app.js, lägg till felhantering i funktionen loadData
```

---

## Köra kommandon

=== "Nybörjare"

    Du kan be Claude köra terminalkommandon åt dig:

    ```
    Kör npm install för att installera dependencies
    ```

    Claude visar vad den kommer köra och frågar om tillåtelse först.

=== "Standard"

    ```
    # Be Claude köra kommandon
    Kör testerna med npm test

    # Eller var explicit
    Kör kommandot: git status
    ```

=== "Djupdykning"

    Claude Code har olika tillståndslägen för kommandon:

    - **Bekräftelse krävs** - Standard för potentiellt farliga kommandon
    - **Automatiskt tillåtna** - Säkra läskommandon
    - **Blockerade** - Destruktiva kommandon utan bekräftelse

---

## Kontexthantering

=== "Nybörjare"

    Claude kommer ihåg vad ni pratat om tidigare i sessionen. Men om historiken blir för lång kan den "glömma" äldre saker.

    Om Claude verkar glömma:

    ```
    /compact
    ```

    Detta sammanfattar historiken för att spara utrymme.

=== "Standard"

    Claude Code har en **kontextfönster** som begränsar hur mycket den kan komma ihåg.

    - Använd `/compact` för att komprimera historiken
    - Använd `/clear` för att börja om helt
    - Referera till filnamn explicit vid behov

=== "Djupdykning"

    Kontextfönstret är ~200k tokens. När det fylls används automatisk sammanfattning.

    För att optimera:

    - Undvik att läsa hela stora filer i onödan
    - Fokusera på relevanta delar av koden
    - Använd CLAUDE.md för persistent kontext

---

## Prova själv

!!! example "Övning: Testa kommandona"

    1. **Starta Claude Code** i valfri mapp:
       ```bash
       claude
       ```

    2. **Testa hjälpfunktionen:**
       ```
       /help
       ```

    3. **Skapa en fil genom att beskriva vad du vill:**
       ```
       Skapa en fil som heter anteckningar.txt med texten "Mina första steg med Claude Code"
       ```

    4. **Be Claude visa filen:**
       ```
       Visa innehållet i anteckningar.txt
       ```

    5. **Rensa och börja om:**
       ```
       /clear
       ```

    6. **Avsluta sessionen:**
       ```
       /exit
       ```

---

## Sammanfattning

!!! success "Det viktigaste att ta med sig"
    - Starta med `claude`, avsluta med `/exit`
    - Slash-kommandon (`/help`, `/clear`, `/compact`) styr Claude Code själv
    - Vanlig text är **instruktioner till Claude** om vad du vill göra
    - Var **specifik** - "blå bakgrund" är bättre än "fin bakgrund"
    - Claude **kommer ihåg** vad ni pratat om, men använd `/compact` om det blir långt

---

## Nästa steg

Lär dig mer om [filhantering](filhantering.md) i Claude Code.
