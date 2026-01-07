# CLAUDE.md-filer

Konfigurera Claude Code för ditt projekt med en CLAUDE.md-fil.

---

## Vad är CLAUDE.md?

=== "Nybörjare"

    **CLAUDE.md** är en fil du kan skapa i ditt projekt som ger Claude permanent information om projektet. Det är som att ge Claude ett "minnesblad" som den alltid läser.

    **Fördelar:**
    - Du slipper upprepa samma information varje session
    - Claude förstår projektet bättre
    - Konsekvent beteende

=== "Standard"

    CLAUDE.md är en markdown-fil i projektroten som Claude Code läser automatiskt vid start. Den kan innehålla:

    - Projektbeskrivning
    - Teknisk stack
    - Kodkonventioner
    - Viktiga filer och mappar
    - Instruktioner för hur Claude ska arbeta

---

## Grundläggande struktur

```markdown
# Projektnamn

Kort beskrivning av vad projektet gör.

## Stack

- Frontend: React + TypeScript
- Backend: Node.js + Express
- Databas: PostgreSQL

## Mappstruktur

```
src/
├── components/    # React-komponenter
├── hooks/         # Custom hooks
├── services/      # API-anrop
└── utils/         # Hjälpfunktioner
```

## Konventioner

- Använd funktionella komponenter
- Namnge filer med kebab-case
- Skriv kommentarer på svenska

## Viktigt

- Rör inte filer i `legacy/`-mappen
- Alla API-anrop går genom `services/api.js`
```

---

## Avancerade instruktioner

### Begränsningar

```markdown
## Restriktioner

- Skapa ALDRIG nya beroenden utan att fråga först
- Modifiera INTE filer i `config/`
- Använd ALLTID TypeScript, aldrig vanlig JavaScript
```

### Arbetsflöde

```markdown
## Arbetsflöde

1. Innan du ändrar en fil, visa vad du planerar göra
2. Kör alltid `npm test` efter ändringar
3. Committa inte automatiskt - vänta på godkännande
```

### Domänspecifik information

```markdown
## Home Assistant-specifikt

Entity-namnkonvention:
- Lampor: light.rum_typ (t.ex. light.vardagsrum_tak)
- Sensorer: sensor.vad_var (t.ex. sensor.temperatur_ute)
- Binära: binary_sensor.vad (t.ex. binary_sensor.ytterdorr)
```

---

## Placering

```
mitt-projekt/
├── CLAUDE.md          ← Här
├── package.json
├── src/
└── ...
```

Claude Code hittar filen automatiskt när du startar i projektmappen.

---

## Tips

=== "Nybörjare"

    Börja enkelt:

    ```markdown
    # Mitt projekt

    En webbapp för att hantera recept.

    ## Teknologi

    HTML, CSS, JavaScript

    ## Viktigt

    Skriv kommentarer på svenska.
    ```

=== "Standard"

    Var specifik om saker som ofta behöver upprepas:

    ```markdown
    ## API

    Base URL: https://api.example.com/v2
    Auth: Bearer token i header
    Alla endpoints är dokumenterade i `docs/api.md`
    ```

=== "Djupdykning"

    Inkludera arkitekturbeslut och motiveringar:

    ```markdown
    ## Arkitekturbeslut

    ### Varför Redux istället för Context?
    Projektet har komplex state med många cross-cutting concerns.
    Redux DevTools underlättar debugging.

    ### Varför inte TypeScript strict mode?
    Legacy-kod från 2019 som gradvis migreras.
    Strict mode är målet men inte prioriterat just nu.
    ```

---

## Exempel för olika projekttyper

### Home Assistant

```markdown
# Home Assistant Config

## Installation

Home Assistant körs på Raspberry Pi 4.
SSH: ssh pi@192.168.1.100

## Struktur

- configuration.yaml - Huvudconfig
- automations/ - Separerade automationsfiler
- scripts/ - Scripts

## Konventioner

Alla automationer ska ha:
- Beskrivande alias
- description-fält
- Minst en condition (även om det bara är att vara enabled)
```

### Power BI-projekt

```markdown
# Säljrapport Q4

## Datamodell

- Faktatabell: Sales (500k rader)
- Dimensioner: Date, Product, Customer, Region
- Relationer: Alla star schema mot Sales

## DAX-konventioner

- Measures börjar med verb
- Använd VAR/RETURN
- Kommentera time intelligence-logik
```
