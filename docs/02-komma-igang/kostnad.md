# Kostnad och priser

Innan du installerar Claude Code är det viktigt att förstå vad det kostar att använda.

!!! abstract "Vad du kommer lära dig"
    - Hur prismodellen fungerar
    - Vad typiska uppgifter kostar
    - Hur du sätter budgetgränser
    - Tips för att hålla nere kostnaderna

---

## Sammanfattning

| Vad | Kostnad |
|-----|---------|
| **Installera Claude Code** | Gratis |
| **Använda Claude Code** | Kostar per användning |
| **Gratis kredit vid start** | $5 (ca 50 kr) |
| **Typisk konversation** | $0.01 - $0.50 |
| **Kan sätta budgetgräns** | Ja |

---

## Hur fungerar betalningen?

=== "Nybörjare"

    Claude Code är **gratis att installera**, men **kostar pengar att använda**.

    Tänk på det som mobildata - appen är gratis, men du betalar för datatrafiken. Varje gång du ställer en fråga och får svar "förbrukar" du lite.

    **Den goda nyheten:**

    - Du får **$5 gratis kredit** när du skapar konto
    - Det räcker för **50-200 konversationer** beroende på komplexitet
    - Du kan **sätta en budgetgräns** så du aldrig blir överraskad
    - Enkla uppgifter kostar bara **några ören**

=== "Standard"

    Claude Code använder Anthropic's API som debiterar per **token**. En token är ungefär 3-4 tecken eller en del av ett ord.

    **Prisstruktur (ungefärlig):**

    | Modell | Input | Output |
    |--------|-------|--------|
    | Claude 3.5 Sonnet | $3/miljon tokens | $15/miljon tokens |
    | Claude 3 Opus | $15/miljon tokens | $75/miljon tokens |

    **I praktiken:**

    - En enkel fråga + svar ≈ 1000-3000 tokens ≈ $0.01-0.05
    - Läsa en fil + generera kod ≈ 5000-20000 tokens ≈ $0.05-0.30
    - Stort projekt med många filer ≈ $1-5

=== "Djupdykning"

    Kostnaden beror på:

    1. **Kontextfönster**: Hur mycket historik/filer Claude läser
    2. **Antal turns**: Hur många meddelanden fram och tillbaka
    3. **Output-längd**: Längre svar kostar mer
    4. **Modell**: Opus är dyrare än Sonnet

    Caching av kontext kan minska kostnaden för upprepade frågor om samma filer.

---

## Vad kostar typiska uppgifter?

Här är ungefärliga kostnader för vanliga uppgifter:

| Uppgift | Ungefärlig kostnad |
|---------|-------------------|
| Fråga om syntax eller koncept | $0.01 - $0.03 |
| Skapa en enkel HTML-sida | $0.02 - $0.05 |
| Generera en Excel-formel | $0.01 - $0.03 |
| Skapa en Home Assistant automation | $0.05 - $0.15 |
| Skriva en DAX-measure | $0.02 - $0.10 |
| Felsöka en bugg i befintlig kod | $0.05 - $0.20 |
| Bygga en komplett todo-app | $0.20 - $0.50 |
| Refaktorera ett stort projekt | $1 - $5 |

!!! info "Dessa är uppskattningar"
    Faktisk kostnad varierar beroende på hur du formulerar frågor, hur många filer som läses, och hur många iterationer som behövs.

---

## Skapa konto och se saldo

### 1. Skapa konto på Anthropic

1. Gå till [console.anthropic.com](https://console.anthropic.com)
2. Klicka **Sign Up**
3. Skapa konto med email eller Google

### 2. Se ditt saldo

1. Logga in på [console.anthropic.com](https://console.anthropic.com)
2. Klicka på **Billing** i sidomenyn
3. Här ser du:
   - Aktuellt saldo
   - Förbrukningshistorik
   - Budgetgränser

### 3. Lägg till betalmetod (när gratiskrediten tar slut)

1. Gå till **Billing** → **Payment Methods**
2. Lägg till kredit- eller betalkort
3. Välj hur mycket du vill ladda (minst $5)

---

## Sätt budgetgräns

!!! warning "Rekommenderas starkt"
    Sätt alltid en budgetgräns så du aldrig blir överraskad av en hög räkning!

### Så här gör du:

1. Gå till [console.anthropic.com](https://console.anthropic.com)
2. Klicka på **Settings** → **Limits**
3. Sätt **Monthly spending limit** (t.ex. $10 eller $20)
4. Klicka **Save**

När du når gränsen slutar Claude Code att fungera tills nästa månad börjar (eller tills du höjer gränsen).

---

## Tips för att hålla nere kostnaderna

### 1. Var specifik i dina frågor

```
# Dyrare (Claude läser hela filen och funderar länge)
"Kan du kolla min kod och föreslå förbättringar?"

# Billigare (specifik fråga = kortare svar)
"I rad 45-50 i app.js, varför får jag TypeError?"
```

### 2. Referera till specifika filer

```
# Dyrare (Claude söker igenom allt)
"Hitta alla ställen där jag använder denna funktion"

# Billigare (direkt filreferens)
"I @src/utils.js, vilka funktioner exporteras?"
```

### 3. Använd `/compact` vid långa sessioner

Om du pratat länge med Claude, kör `/compact` för att sammanfatta historiken. Detta minskar kontextstorleken och sparar pengar.

### 4. Starta ny session för nya uppgifter

Istället för att fortsätta en lång konversation, starta en ny med `/clear` eller öppna ny terminal.

### 5. Välj rätt modell

Claude Code använder automatiskt lämplig modell, men för enkla uppgifter kan du specificera:

```
Använd en snabbare modell för denna enkla fråga: Vad gör git status?
```

---

## Vanliga frågor

??? question "Vad händer när gratiskrediten tar slut?"

    Du får ett meddelande om att du nått din gräns. För att fortsätta:

    1. Gå till [console.anthropic.com](https://console.anthropic.com) → **Billing**
    2. Lägg till betalmetod
    3. Ladda saldo

??? question "Kan jag använda Claude Code helt gratis?"

    Du får $5 gratis kredit vid start. Efter det behöver du betala. Det finns inget "gratis tier" med begränsad användning.

    **Alternativ för helt gratis användning:**
    - Claude.ai (webbversionen) har en gratis tier
    - Men den saknar filåtkomst och terminalintegration

??? question "Hur vet jag hur mycket jag använt?"

    1. I Claude Code: Kör `claude usage` (om tillgängligt)
    2. På webben: [console.anthropic.com](https://console.anthropic.com) → **Billing** → **Usage**

??? question "Kan jag få faktura för företagsanvändning?"

    Ja, Anthropic erbjuder fakturering för företag. Kontakta dem via deras hemsida.

??? question "Vad händer om jag råkar köra något som kostar mycket?"

    Med en budgetgräns satt stoppas användningen automatiskt. Utan gräns debiteras ditt kort.

    **Tips:** Sätt alltid en rimlig månadsbudget (t.ex. $10-20 för hobby, $50-100 för professionellt bruk).

---

## Jämförelse med andra tjänster

| Tjänst | Kostnad | Filåtkomst | Terminalintegration |
|--------|---------|------------|---------------------|
| **Claude Code** | Pay-per-use | Ja | Ja |
| Claude.ai (webb) | Gratis tier + Pro ($20/mån) | Nej | Nej |
| ChatGPT Plus | $20/mån | Nej | Nej |
| GitHub Copilot | $10-19/mån | Ja (via IDE) | Delvis |

Claude Code är ofta billigare för sporadisk användning men kan bli dyrare vid intensiv användning.

---

## Sammanfattning

!!! success "Det viktigaste att ta med sig"
    - Claude Code är **gratis att installera** men kostar per användning
    - Du får **$5 gratis kredit** för att komma igång
    - Typiska uppgifter kostar **några ören till några kronor**
    - **Sätt alltid en budgetgräns** för att undvika överraskningar
    - Var **specifik i dina frågor** för att hålla nere kostnaderna

---

## Nästa steg

Nu när du förstår kostnadsmodellen, låt oss [installera Claude Code](installation.md)!
