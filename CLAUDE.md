# Vibe-Kodning Manual

> En praktisk guide för att använda Claude Code för Home Assistant, Power BI, Excel och PowerQuery.

## Projektöversikt

Detta är en manual som lär ut "vibe-kodning" - att programmera genom naturlig konversation med Claude Code. Målgruppen är personer utan traditionell programmeringsbakgrund som vill automatisera och bygga lösningar för:

- **Home Assistant**: Smarta hem-automationer, YAML-konfigurationer, integrationer
- **Power BI**: Dashboards, DAX-formler, datamodellering
- **Excel**: Formler, makron, VBA-skript
- **PowerQuery**: Datatransformationer, M-språket

## Målgrupp

- Nybörjare utan kodningserfarenhet
- Hemautomatiserare som vill ta nästa steg
- Affärsanalytiker som vill effektivisera sitt arbete
- Alla som vill lära sig "prata med AI för att koda"

## Projektstruktur

```
vibe-kodning-manual/
├── CLAUDE.md                 # Denna fil
├── .claude/agents/           # Specialiserade agenter för manualskrivande
├── content/                  # Manualens innehåll
│   ├── 01-introduktion/      # Vad är vibe-kodning?
│   ├── 02-komma-igang/       # Installation och setup
│   ├── 03-claude-code-grunder/ # Grundläggande användning
│   ├── 04-home-assistant/    # Home Assistant-specifikt
│   ├── 05-power-bi/          # Power BI och DAX
│   ├── 06-excel-powerquery/  # Excel och PowerQuery
│   └── 07-avancerat/         # Avancerade tekniker
├── assets/
│   ├── images/               # Skärmdumpar och foton
│   └── diagrams/             # Flödesscheman och diagram
└── examples/                 # Kompletta exempel att följa
```

## Arbetsflöde

### Skriva nytt innehåll
1. Använd relevant **expert-agent** för domänkunskap
2. Låt **lärare-agenten** granska pedagogiken
3. Be **exempelskaparen** ta fram praktiska övningar
4. Låt **nybörjaradvokaten** granska tillgängligheten
5. Slutgranska med **granskare-agenten**

### Skapa bilder och diagram
1. Beskriv flödet i text
2. Använd **grafiker-agenten** för att skapa visuellt material
3. Låt **granskaren** verifiera att bild och text matchar

### Kvalitetssäkring
1. **Praktisk testare**: Kör igenom alla instruktioner
2. **Felsökningsexpert**: Lägg till vanliga problem och lösningar
3. **Strukturerare**: Säkerställ röd tråd och logik

## Agenter

| Agent | Användning |
|-------|------------|
| `larare` | Pedagogisk granskning och struktur |
| `claude-code-expert` | Claude Code funktionalitet |
| `excel-expert` | Excel, PowerQuery, M-språket |
| `powerbi-expert` | Power BI, DAX, datamodellering |
| `homeassistant-expert` | Home Assistant, YAML, automationer |
| `kodningsexpert` | Git, terminal, generell kodning |
| `grafiker` | Diagram och visuellt material |
| `granskare` | Kvalitetskontroll och konsistens |
| `nyborjaradvokat` | Nybörjarperspektiv |
| `strukturerare` | Övergripande struktur |
| `testare` | Praktisk verifiering |
| `exempelskapare` | Relevanta exempel |
| `felsokningsexpert` | Troubleshooting och felhantering |

## Skrivriktlinjer

### Språk och ton
- Skriv på **svenska**
- Använd **du-tilltal**
- Var **konkret** - visa alltid med exempel
- Undvik jargong - förklara termer första gången de används

### Struktur för varje kapitel
1. **Mål**: Vad kommer läsaren kunna efter detta kapitel?
2. **Koncept**: Kort teori (max 20%)
3. **Praktik**: Steg-för-steg-instruktioner (60%)
4. **Övningar**: Prova själv-uppgifter (20%)
5. **Vanliga problem**: Felsökning

### Kodexempel
- Visa alltid **före och efter**
- Inkludera **prompten** som gav resultatet
- Kommentera viktiga delar

```markdown
## Exempel: Skapa en automation

**Din prompt till Claude Code:**
> "Skapa en Home Assistant automation som tänder hallampan när
> ytterdörren öppnas efter solnedgång"

**Claude Code svarar med:**
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
```

## Verifiering

Innan ett kapitel anses klart:
- [ ] Alla instruktioner är testade av `testare`
- [ ] Nybörjarperspektiv godkänt av `nyborjaradvokat`
- [ ] Bilder matchar text (verifierat av `granskare`)
- [ ] Felsökningssektion finns
- [ ] Minst 2 övningar per kapitel

## Kom igång

```bash
# Anropa en expert
@claude-code-expert "Förklara hur man använder Edit-verktyget"

# Be om pedagogisk granskning
@larare "Granska kapitlet om DAX-formler"

# Skapa ett diagram
@grafiker "Skapa ett flödesschema för hur man installerar Claude Code"
```
