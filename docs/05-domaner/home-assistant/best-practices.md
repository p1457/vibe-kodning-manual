# Best Practices för Home Assistant

Tips för att få ut mest av Claude Code när du arbetar med Home Assistant.

---

## Skydda känslig information

!!! danger "secrets.yaml ska ALDRIG delas"

    `secrets.yaml` innehåller känsliga uppgifter som:

    - API-nycklar för externa tjänster
    - Lösenord för integrationer
    - Koordinater (din hemadress!)
    - Push-notification tokens

    **VIKTIGT:**

    - Lägg **alltid** till `secrets.yaml` i din `.gitignore`
    - Dela **aldrig** filen med någon, inklusive Claude Code
    - Använd referensen `!secret` istället för att skriva nycklar direkt

=== "Nybörjare"

    Istället för att skriva känslig information direkt i dina YAML-filer:

    ```yaml
    # FEL - lösenord syns i koden
    api_key: "abc123hemligt"
    ```

    Använd secrets-referens:

    ```yaml
    # RÄTT - värdet ligger i secrets.yaml
    api_key: !secret min_api_key
    ```

    I `secrets.yaml`:
    ```yaml
    min_api_key: "abc123hemligt"
    ```

=== "Standard"

    **Sätt upp .gitignore korrekt:**

    ```gitignore
    # Hemliga filer - ALDRIG till Git!
    secrets.yaml
    .storage/
    *.db

    # Loggfiler
    *.log
    home-assistant.log*
    ```

    **Om du delar konfiguration:**

    Skapa en `secrets.yaml.example` som mall:
    ```yaml
    # Kopiera till secrets.yaml och fyll i värden
    latitude: "YOUR_LATITUDE"
    longitude: "YOUR_LONGITUDE"
    elevation: "YOUR_ELEVATION"
    api_key_weather: "YOUR_API_KEY"
    ```

=== "Djupdykning"

    **Vad händer om secrets.yaml läcker:**

    - Angripare kan komma åt dina externa tjänster
    - Dina koordinater avslöjar var du bor
    - Push-tokens kan användas för falska notifieringar
    - API-nycklar kan missbrukas och kosta pengar

    **Om du misstänker läcka:**

    1. Rotera alla API-nycklar omedelbart
    2. Ändra alla lösenord
    3. Kontrollera loggar för obehörig åtkomst
    4. Skapa nya tokens för push-tjänster

---

## Strukturera dina prompts

### Inkludera context

```
Jag har en Home Assistant-installation med:
- Philips Hue-lampor i vardagsrum och sovrum
- Aqara dörrsensorer på ytterdörr och altandörr
- En Tado termostat

Skapa en automation som...
```

### Namnge entities

```
Lamporna heter:
- light.vardagsrum_tak
- light.sovrum_tak
- light.hall

Dörrsensorerna heter:
- binary_sensor.ytterdorr
- binary_sensor.altandorr
```

---

## Organisera konfigurationen

=== "Nybörjare"

    Håll saker separata:

    ```yaml
    # configuration.yaml
    automation: !include automations.yaml
    script: !include scripts.yaml
    scene: !include scenes.yaml
    ```

=== "Standard"

    För större installationer, dela upp ytterligare:

    ```yaml
    automation: !include_dir_merge_list automations/
    ```

    ```
    automations/
    ├── lighting.yaml
    ├── climate.yaml
    ├── security.yaml
    └── notifications.yaml
    ```

---

## Vanliga misstag

!!! warning "YAML-indentation"

    YAML är känsligt för indentation. Använd alltid **mellanslag, inte tabbar**.

    ```yaml
    # FEL
    automation:
    	- alias: "Test"  # Tab!

    # RÄTT
    automation:
      - alias: "Test"   # Mellanslag
    ```

!!! warning "Entity-namn med specialtecken"

    ```yaml
    # FEL
    entity_id: light.köks-lampa

    # RÄTT
    entity_id: light.koks_lampa
    ```

---

## Testa säkert

Be Claude lägga till testläge:

```
Lägg till en input_boolean så jag kan aktivera/inaktivera
automationen från UI utan att ta bort koden.
```

```yaml
condition:
  - condition: state
    entity_id: input_boolean.automation_enabled
    state: "on"
```

---

## Använd templates för flexibilitet

```
Skapa en automation som anpassar ljusstyrkan baserat på tid på dygnet.
Fullt ljus på dagen, 50% på kvällen, 20% på natten.
```

---

## Felsökning

```
Jag får felet "[felmeddelande]" när jag laddar om konfigurationen.
Här är min automation: [klistra in YAML]
```

Claude kan:
- Identifiera syntax-fel
- Föreslå korrigeringar
- Förklara vad felet betyder
