# Automationer i Home Assistant

Automationer är hjärtat av Home Assistant - regler som får ditt hem att agera automatiskt.

---

## Automationens byggstenar

Varje automation har tre delar:

```yaml
automation:
  - alias: "Namn på automationen"
    trigger:      # NÄR ska det hända?
      - ...
    condition:    # VILLKOR som måste uppfyllas
      - ...
    action:       # VAD ska hända?
      - ...
```

---

## Triggers (Utlösare)

=== "Nybörjare"

    En **trigger** är det som startar automationen. "När X händer..."

    **Vanliga triggers:**

    - En sensor ändrar värde (dörr öppnas)
    - Klockan slår ett visst klockslag
    - Solen går upp eller ner
    - Du kommer hem eller lämnar

=== "Standard"

    | Trigger | Användning |
    |---------|------------|
    | `state` | När entity ändrar state |
    | `time` | Vid specifik tid |
    | `sun` | Vid soluppgång/nedgång |
    | `zone` | När någon kommer/lämnar område |
    | `device` | Enhetsspecifika events |
    | `mqtt` | MQTT-meddelanden |

---

## Conditions (Villkor)

=== "Nybörjare"

    **Conditions** är extra krav som måste uppfyllas. "Men bara om..."

    **Exempel:**
    - Bara om det är mörkt ute
    - Bara om ingen är hemma
    - Bara på vardagar

=== "Standard"

    ```yaml
    condition:
      - condition: state
        entity_id: binary_sensor.hemma
        state: "on"
      - condition: time
        after: "18:00:00"
        before: "23:00:00"
    ```

---

## Actions (Handlingar)

=== "Nybörjare"

    **Actions** är vad som faktiskt händer. "Gör detta..."

    - Tänd/släck lampor
    - Skicka notifikation
    - Kör ett script
    - Ändra temperatur

=== "Standard"

    ```yaml
    action:
      - service: light.turn_on
        target:
          entity_id: light.hall
        data:
          brightness_pct: 100
      - service: notify.mobile_app
        data:
          message: "Välkommen hem!"
    ```

---

## Vanliga automation-mönster

### Ljus vid rörelse

```
När rörelse detekteras i hallen, tänd hallampan.
Släck efter 5 minuter utan rörelse.
```

### Välkommen hem

```
När min telefon ansluter till hemma-WiFi, tänd
vardagsrumslamporna och sätt termostaten till 21 grader.
```

### God natt-läge

```
Klockan 23:00 på vardagar, släck alla lampor utom
sovrummet och sänk termostaten till 18 grader.
```

---

## Tips för Claude Code-prompter

**Var specifik om entity-namn:**
```
Lampan heter "light.vardagsrum_tak"
Dörrsensorn heter "binary_sensor.ytterdorr"
```

**Beskriv beteendet tydligt:**
```
Tänd till 50% ljusstyrka, inte full styrka
Vänta 30 sekunder innan nästa steg
```

---

## Nästa steg

Se [best practices](best-practices.md) för tips om hur du strukturerar dina automationer.
