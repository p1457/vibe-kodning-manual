# Vad är vibe-kodning?

!!! abstract "Vad du kommer lära dig"
    - Vad vibe-kodning innebär och hur det fungerar
    - Varför du kan skapa program utan att kunna programmera
    - Vad som krävs av dig för att lyckas

=== "Nybörjare"

    ## Programmering utan att kunna programmera

    Tänk dig att du har en extremt kompetent programmerare som sitter bredvid dig. Du kan beskriva vad du vill åstadkomma på vanlig svenska, och hen skriver koden åt dig. Du behöver inte kunna något programmeringsspråk - du behöver bara kunna förklara vad du vill ha.

    **Det är vibe-kodning.**

    ### Ett exempel

    Istället för att skriva detta själv:

    ```yaml
    automation:
      - alias: "Tänd hall vid dörröppning"
        trigger:
          - platform: state
            entity_id: binary_sensor.ytterdorr
            to: "on"
        condition:
          - condition: sun
            after: sunset
        action:
          - service: light.turn_on
            target:
              entity_id: light.hall
    ```

    ...beskriver du bara vad du vill:

    > "Jag vill att hallampan tänds automatiskt när ytterdörren öppnas, men bara efter solnedgång."

    Claude Code förstår din intention och skapar koden åt dig.

=== "Standard"

    ## AI som kodpartner

    **Vibe-kodning** är en ny approach till programmering där du beskriver din intention i naturligt språk och låter AI generera koden. Termen myntades 2025 och refererar till att du kodar baserat på "känslan" av vad du vill uppnå, snarare än teknisk syntax.

    ### Hur det fungerar

    ```mermaid
    flowchart LR
        A["🧑 Du beskriver"] --> B["🤖 Claude förstår"]
        B --> C["💻 Claude genererar kod"]
        C --> D["✅ Du validerar"]
        D -->|"Inte rätt?"| A
        D -->|"Perfekt!"| E["🎉 Klart!"]
    ```

    1. **Du beskriver** vad du vill åstadkomma
    2. **AI:n förstår** din intention och kontext
    3. **AI:n genererar** kod som löser problemet
    4. **Du validerar** att resultatet är korrekt
    5. **Iterera** tills det är rätt

    ### Exempel: Home Assistant automation

    **Din prompt:**
    ```
    Skapa en automation som tänder hallampan när ytterdörren
    öppnas efter solnedgång
    ```

    **Claude Code genererar:**
    ```yaml
    automation:
      - alias: "Tänd hall vid dörröppning"
        trigger:
          - platform: state
            entity_id: binary_sensor.ytterdorr
            to: "on"
        condition:
          - condition: sun
            after: sunset
        action:
          - service: light.turn_on
            target:
              entity_id: light.hall
    ```

    Du behöver inte kunna YAML-syntax eller Home Assistants API - du beskriver bara önskat beteende.

=== "Djupdykning"

    ## Paradigmskifte i mjukvaruutveckling

    **Vibe-kodning** representerar ett fundamentalt skifte från imperativ till deklarativ utveckling på en ny nivå. Istället för att specificera *hur* något ska göras (syntax, algoritmer, datastrukturer), specificerar du *vad* som ska uppnås.

    ### Historisk kontext

    Programmering har alltid rört sig mot högre abstraktionsnivåer:

    | Era | Abstraktionsnivå | Exempel |
    |-----|------------------|---------|
    | 1950-tal | Maskinkod | `10110000 01100001` |
    | 1960-tal | Assembly | `MOV AL, 61h` |
    | 1970-tal | Högnivåspråk | `print("hello")` |
    | 2020-tal | Naturligt språk | "Skriv ut hello" |

    Vibe-kodning är nästa steg i denna evolution.

    ### Kognitiv arbetsfördelning

    I traditionell utveckling måste programmeraren:

    1. Förstå problemet (domänkunskap)
    2. Designa lösningen (arkitektur)
    3. Implementera lösningen (syntax)
    4. Testa och debugga (verifiering)

    Med vibe-kodning hanterar AI:n steg 3 (och delvis 4), vilket frigör mental kapacitet för steg 1 och 2 - de kreativa och strategiska delarna.

    ### Begränsningar och överväganden

    - **Verifiering är kritisk** - AI kan generera felaktig kod
    - **Domänkunskap förblir värdefull** - Du måste förstå vad som är möjligt
    - **Prompt engineering** - Kvaliteten på input påverkar output
    - **Kontextbegränsningar** - AI har begränsat minne av tidigare konversation

---

## Varför fungerar det?

!!! info "Stora språkmodeller"
    Claude och liknande AI-modeller har tränats på enorma mängder kod och dokumentation. De har sett miljontals exempel på hur problem löses i olika programmeringsspråk.

### Nyckelinsikter

- **Du behöver inte kunna syntax** - AI:n kan alla programmeringsspråk
- **Du behöver förstå problemdomänen** - Vad vill du uppnå?
- **Du behöver kunna verifiera** - Är resultatet korrekt?

---

## Vad krävs av dig?

=== "Nybörjare"

    - Kunna beskriva vad du vill uppnå
    - Tålamod att iterera och förtydliga
    - Grundläggande datorvana

=== "Standard"

    - Förmåga att bryta ner problem i mindre delar
    - Förståelse för vad som är rimligt att be om
    - Vilja att lära dig grunderna i de verktyg du använder

=== "Djupdykning"

    - Domänkunskap i området du arbetar med
    - Kritiskt tänkande för att validera output
    - Förståelse för AI:ns begränsningar och styrkor
    - Iterativ arbetsmetodik

---

## Sammanfattning

!!! success "Det viktigaste att ta med sig"
    - **Vibe-kodning** = du beskriver vad du vill, AI:n skriver koden
    - Du behöver **inte** kunna programmera - men du behöver kunna förklara vad du vill uppnå
    - Det handlar om **iteration** - du och AI:n arbetar tillsammans tills resultatet är rätt
    - AI:n kan syntax, du kan problemdomänen

---

## Nästa steg

Nu när du förstår konceptet, låt oss titta på [varför just Claude Code](varfor-claude-code.md) är ett bra val för vibe-kodning.
