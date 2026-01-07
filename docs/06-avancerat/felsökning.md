# Felsökning

Hur du löser problem när något inte fungerar.

---

## Allmän felsökningsmetodik

=== "Nybörjare"

    När något inte fungerar:

    1. **Läs felmeddelandet** - Det berättar ofta vad som är fel
    2. **Kopiera det till Claude** - "Jag får detta fel: [meddelande]"
    3. **Beskriv vad du försökte göra**
    4. **Följ Claudes förslag**

=== "Standard"

    **Systematisk approach:**

    1. Reproducera felet konsekvent
    2. Identifiera senaste fungerande tillstånd
    3. Isolera den kod/config som orsakar problemet
    4. Googla felmeddelandet eller fråga Claude
    5. Testa lösningen
    6. Dokumentera för framtiden

---

## Claude Code-specifika problem

### "Command not found: claude"

=== "Windows"

    ```powershell
    # Kontrollera npm global path
    npm config get prefix

    # Lägg till i PATH om det behövs
    # Eller installera om
    npm install -g @anthropic-ai/claude-code
    ```

=== "macOS/Linux"

    ```bash
    # Kontrollera installation
    which claude

    # Om saknas, installera om
    npm install -g @anthropic-ai/claude-code
    ```

### Autentiseringsfel

```bash
# Sätt API-nyckel på nytt
claude config set apiKey
```

### Timeout/långsam respons

```
/compact
```

Rensar kontexthistoriken för snabbare svar.

---

## Git-problem

### "Not a git repository"

```bash
# Initiera git i mappen
git init
```

### Merge-konflikter

```
Jag har en merge-konflikt i [filnamn]. Visa mig hur jag löser den.
```

### Ångra senaste commit

```bash
# Behåll ändringarna
git reset --soft HEAD~1

# Ta bort ändringarna
git reset --hard HEAD~1
```

---

## Home Assistant-problem

### YAML-syntaxfel

```
Jag får "Invalid config" i Home Assistant.
Här är min configuration.yaml:
[klistra in]
```

### Automation triggas inte

```
Min automation triggas aldrig. Här är YAML:en:
[klistra in]

Entity-states just nu:
[relevant info]
```

---

## Power BI/DAX-problem

### Measure ger blank

```
Mitt measure returnerar blank. Här är formeln:
[DAX]

Förväntad output: [beskriv]
Faktisk output: Blank
```

### Cirkulärt beroende

```
Jag får "circular dependency detected".
Här är mina measures:
[DAX]
```

---

## Excel-problem

### #REF! / #VALUE! / #NAME?

```
Formeln ger [feltyp]. Här är formeln:
[formel]

Data ser ut så här:
A1: [värde]
B1: [värde]
```

---

## Webbutvecklings-problem

### JavaScript fungerar inte

```
Knappen gör ingenting när jag klickar.

HTML:
[kod]

JavaScript:
[kod]

Inga fel i konsolen.
```

### CSS fungerar inte

```
Min styling appliceras inte.

HTML:
[kod]

CSS:
[kod]
```

---

## Effektiv felsökning med Claude

**Bra felrapport:**

```
Problem: [kort beskrivning]

Vad jag försökte göra: [steg]

Felmeddelande: [exakt text]

Relevant kod/config:
[klistra in]

Vad jag redan försökt:
- [försök 1]
- [försök 2]
```
