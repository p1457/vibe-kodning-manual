# Home Assistant med Claude Code

Använd Claude Code för att bygga och underhålla din Home Assistant-installation.

!!! abstract "Vad du kommer lära dig"
    - Vad Home Assistant är och vad det kan göra
    - Varför Claude Code är perfekt för YAML-konfiguration
    - Hur du strukturerar din Home Assistant-mapp
    - Hur du skapar din första automation med Claude

---

## Vad är Home Assistant?

=== "Nybörjare"

    **Home Assistant** är en gratis plattform för att styra ditt smarta hem. Den kopplar ihop olika enheter (lampor, termostater, sensorer) och låter dig skapa **automationer** - regler som gör saker automatiskt.

    **Exempel:**
    - Släck alla lampor när ingen är hemma
    - Tänd hallampan när dörren öppnas
    - Sänk värmen på natten

=== "Standard"

    Home Assistant är en open-source hemautomationsplattform som:

    - Stödjer 2000+ integrationer
    - Konfigureras med YAML (och UI)
    - Körs lokalt (ingen molnberoende)
    - Har kraftfull automationsmotor

=== "Djupdykning"

    Home Assistant kärnan är Python-baserad och använder:

    - **Event bus** för kommunikation
    - **State machine** för entity-states
    - **YAML** eller **UI-baserad** konfiguration
    - **Lovelace** för dashboards

---

## Varför Claude Code för Home Assistant?

=== "Nybörjare"

    YAML (filformatet Home Assistant använder) har strikt formatering. Ett enda felaktigt mellanslag kan göra att allt slutar fungera.

    **Claude Code hjälper genom att:**

    - Skriva korrekt YAML åt dig
    - Förklara vad olika delar gör
    - Felsöka fel i konfigurationen

=== "Standard"

    **Fördelar:**

    - Snabb generering av komplexa automationer
    - Validering av YAML-syntax
    - Förslag på entity_ids baserat på namn
    - Konvertering mellan YAML och UI-format

---

## Kom igång

### Förutsättningar

- Home Assistant installerat och körande
- Tillgång till konfigurationsfilerna (via SSH, Samba eller File Editor)

### Projektstruktur

```
homeassistant/
├── configuration.yaml      # Huvudkonfiguration
├── automations.yaml        # Automationer
├── scripts.yaml            # Scripts
├── scenes.yaml             # Scener
├── secrets.yaml            # Känslig data (lösenord etc)
└── custom_components/      # Anpassade integrationer
```

---

## Exempel: Skapa en automation

**Din prompt:**
```
Skapa en Home Assistant automation som tänder vardagsrumsbelysningen
till 50% ljusstyrka när TV:n slås på, men bara efter kl 18.
```

**Claude Code genererar:**
```yaml
automation:
  - alias: "Dimma vardagsrum vid TV-tittande"
    description: "Tänder vardagsrumslamporna när TV:n slås på kvällstid"
    trigger:
      - platform: state
        entity_id: media_player.vardagsrums_tv
        to: "on"
    condition:
      - condition: time
        after: "18:00:00"
    action:
      - service: light.turn_on
        target:
          entity_id: light.vardagsrum
        data:
          brightness_pct: 50
```

---

## Prova själv

!!! example "Övning: Din första automation"

    Tänk på en enkel automation du vill ha hemma och beskriv den för Claude:

    1. **Vilken enhet triggar?** (dörrsensor, rörelsesensor, tid, etc.)
    2. **Vad ska hända?** (tänd lampa, skicka notis, etc.)
    3. **Finns det villkor?** (bara på kvällen, bara om ingen är hemma, etc.)

    **Exempelprompt:**
    ```
    Jag har en rörelsesensor i hallen (binary_sensor.hall_motion)
    och en taklampa (light.hall_tak). Skapa en automation som
    tänder lampan när rörelse detekteras, men bara mellan 06:00 och 23:00.
    Lampan ska släckas efter 3 minuter utan rörelse.
    ```

---

## Sammanfattning

!!! success "Det viktigaste att ta med sig"
    - **Home Assistant** kopplar ihop dina smarta enheter och automatiserar dem
    - All konfiguration är **YAML-filer** som Claude Code kan läsa och skriva
    - Claude hjälper dig skriva **korrekt YAML** - du behöver inte kunna syntaxen
    - Beskriv **vad du vill uppnå** med vilka enheter, så genererar Claude koden

---

## Nästa steg

Lär dig mer om [arbetsflödet](arbetsflode.md) för att synka filer mellan din dator och Home Assistant.
