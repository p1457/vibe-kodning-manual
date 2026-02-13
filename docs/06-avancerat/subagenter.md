# Subagenter och Task-verktyget

Lär dig använda Claude Codes kraftfulla subagent-system för att hantera komplexa uppgifter.

!!! abstract "Vad du kommer lära dig"
    - Vad subagenter är och när du använder dem
    - Hur du startar och övervakar agenter
    - Parallella agenter för snabbare arbete
    - Praktiska exempel för varje domän

---

## Vad är subagenter?

=== "Nybörjare"

    Tänk dig att Claude är en projektledare som kan anställa assistenter för specifika uppgifter.

    **Exempel:**
    - Du ber Claude "hitta var error-hantering sker i projektet"
    - Istället för att själv söka kan Claude starta en **sökagent**
    - Agenten arbetar i bakgrunden och rapporterar tillbaka

    **Fördelar:**
    - Komplexa sökningar utförs grundligare
    - Claude kan fortsätta hjälpa dig medan agenten arbetar
    - Flera agenter kan arbeta parallellt

=== "Standard"

    **Subagenter** är separata Claude-instanser som kan:

    - Utforska kodbasen (`Explore`-agent)
    - Planera implementation (`Plan`-agent)
    - Köra bash-kommandon (`Bash`-agent)
    - Utföra generella uppgifter (`general-purpose`-agent)

    Varje agent har tillgång till specifika verktyg och arbetar autonomt tills uppgiften är klar.

=== "Djupdykning"

    Task-verktyget (`Task`) startar nya agent-processer med isolerad kontext. Agenter:

    - Körs som separata API-anrop
    - Har definierade verktygsuppsättningar per typ
    - Kan köras i bakgrunden (`run_in_background: true`)
    - Returnerar resultat till huvudsessionen
    - Kan återupptas med `resume`-parametern

    ```
    Tillgängliga agenttyper:
    - Explore: Snabb kodbassökning
    - Plan: Arkitektur och implementation
    - Bash: Terminaloperationer
    - general-purpose: Flexibla uppgifter
    ```

---

## Grundläggande användning

### Utforska kodbasen

```
Utforska projektet och hitta var autentisering hanteras.
```

Claude startar automatiskt en **Explore-agent** för öppna sökningar.

### Planera implementation

```
Planera hur vi ska implementera en caching-lösning för API:et.
```

Claude använder **Plan-agenten** för att designa lösningen innan kodning.

### Se aktiva agenter

```
/agents
```

Visar alla körande och avslutade agenter med deras status.

---

## Parallella agenter

=== "Nybörjare"

    Du kan be Claude köra flera saker samtidigt:

    ```
    Kör dessa parallellt:
    1. Sök efter alla TODO-kommentarer
    2. Hitta oanvända imports
    3. Kontrollera att alla tester passerar
    ```

    Claude startar tre agenter som arbetar samtidigt.

=== "Standard"

    **Trigger parallella agenter:**

    ```
    Gör följande parallellt:
    - En agent som utforskar hur error-hantering fungerar
    - En agent som undersöker logging-strukturen
    - En agent som kollar test-coverage
    ```

    **Resultat:**
    - Alla agenter startar samtidigt
    - Du får notifikationer när varje agent är klar
    - Claude sammanfattar resultaten åt dig

=== "Djupdykning"

    För att garantera parallell exekvering, be explicit:

    ```
    Starta följande agenter i parallellt i samma meddelande:
    1. Explore-agent: Hitta alla API-endpoints
    2. Bash-agent: Kör testerna
    3. General-purpose-agent: Analysera dependencies
    ```

    Agenter som startas i samma API-anrop körs parallellt. Sekventiella meddelanden ger sekventiella agenter.

---

## Bakgrundsagenter

Du kan låta agenter arbeta i bakgrunden:

```
Starta en bakgrundsagent som går igenom alla filer och hittar
förbättringsmöjligheter. Jag vill kunna fortsätta arbeta under tiden.
```

**Kontrollera status:**
```
/agents
```

**Hämta resultat:**
```
Visa resultatet från bakgrundsagenten
```

---

## Domänspecifika exempel

### Home Assistant

```
Använd en agent för att analysera alla mina automationer i
@configuration.yaml och hitta:
- Automationer som aldrig triggar
- Duplicerad logik
- Möjliga optimeringar
```

### Power BI

```
Starta en agent som går igenom alla DAX-measures i projektet och:
- Identifierar prestandaproblem
- Hittar oanvända measures
- Föreslår förenklingar
```

### Excel/VBA

```
Låt en agent analysera alla VBA-moduler och dokumentera:
- Vad varje makro gör
- Vilka som är oanvända
- Säkerhetsproblem
```

### Git-projekt

```
Kör parallellt:
- Agent 1: Analysera commit-historiken för stora filer
- Agent 2: Hitta merge-konflikter som lösts dåligt
- Agent 3: Identifiera stale branches
```

---

## Agenttyper i detalj

| Agent | Verktyg | Bäst för |
|-------|---------|----------|
| **Explore** | Glob, Grep, Read | Hitta filer och kod |
| **Plan** | Alla läsverktyg | Designa lösningar |
| **Bash** | Endast Bash | Köra kommandon |
| **general-purpose** | Alla verktyg | Flexibla uppgifter |

### Explore-agenten

Snabb och fokuserad på sökning:

```
Använd explore-agenten för att hitta var i kodbasen
vi gör HTTP-anrop till externa API:er.
```

### Plan-agenten

Tänker igenom implementation:

```
Använd plan-agenten för att designa en migrations-strategi
för att byta från REST till GraphQL.
```

### Bash-agenten

Kör terminalkommandon:

```
Använd en bash-agent för att:
- Köra alla tester
- Bygga projektet
- Kontrollera lint-fel
```

---

## Tips och best practices

### När ska du använda agenter?

| Situation | Använd agent? |
|-----------|--------------|
| Enkel fråga om en fil | Nej, fråga direkt |
| Söka i hela kodbasen | Ja, Explore |
| Planera stor förändring | Ja, Plan |
| Köra flera kommandon | Ja, Bash |
| Komplex analys | Ja, general-purpose |

### Formulera tydliga uppgifter

```
# Bra - tydligt avgränsad uppgift
"Hitta alla ställen där vi använder deprecated API-metoder"

# Dåligt - för vagt
"Analysera koden"
```

### Kombinera agenter

```
Först: Använd en explore-agent för att hitta alla konfigurationsfiler.
Sedan: Använd en plan-agent för att föreslå en konsoliderad konfiguration.
Slutligen: Implementera ändringarna baserat på planen.
```

---

## Felsökning

??? question "Agenten verkar ha fastnat"

    1. Kolla status med `/agents`
    2. Om agenten inte svarar, starta en ny
    3. Bryt ner uppgiften i mindre delar

??? question "Agenten hittade inte det jag letade efter"

    - Var mer specifik i sökningen
    - Ange filtyper eller mappar att fokusera på
    - Prova andra söktermer

??? question "Flera agenter ger motstridiga svar"

    - Be Claude sammanfatta och jämföra
    - Prioritera baserat på vilken agent som hade mest relevant kontext

---

## Sammanfattning

!!! success "Det viktigaste att ta med sig"
    - **Subagenter** låter Claude delegera komplexa uppgifter
    - **Explore-agenten** är bäst för att söka i kodbasen
    - **Plan-agenten** hjälper dig designa lösningar
    - **Parallella agenter** sparar tid på oberoende uppgifter
    - **Bakgrundsagenter** låter dig fortsätta arbeta
    - Formulera **tydliga, avgränsade uppgifter** för bäst resultat

---

## Nästa steg

Lär dig om [Hooks](hooks.md) för att automatisera arbetsflöden.
