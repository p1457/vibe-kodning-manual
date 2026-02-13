# Hooks: Automatisera arbetsflöden

Hooks låter dig köra anpassade skript automatiskt vid specifika händelser i Claude Code.

!!! abstract "Vad du kommer lära dig"
    - Vad hooks är och hur de fungerar
    - Olika typer av hooks
    - Praktiska exempel för vanliga användningsfall
    - Hur du konfigurerar hooks i ditt projekt

---

## Vad är hooks?

=== "Nybörjare"

    **Hooks** är automatiska åtgärder som körs när något specifikt händer.

    **Exempel:**
    - Varje gång Claude ändrar en fil → kör automatiskt linting
    - När du skickar ett meddelande → lägg till projektspecifik kontext
    - Efter att Claude kört tester → visa bara misslyckade tester

    Det är som att sätta upp regler: "När X händer, gör Y automatiskt."

=== "Standard"

    Hooks är shell-kommandon som exekveras vid specifika events:

    | Event | När det triggas |
    |-------|-----------------|
    | `PreToolUse` | Innan ett verktyg körs |
    | `PostToolUse` | Efter att ett verktyg körts |
    | `Notification` | När Claude skickar notifikation |
    | `Stop` | När Claude slutar (per turn) |

    Hooks definieras i `.claude/settings.json` och kan:
    - Blockera operationer (exit code 2)
    - Modifiera output
    - Logga aktivitet
    - Trigga externa system

=== "Djupdykning"

    Hooks körs som shell-processer och tar emot:
    - **stdin**: JSON med event-data
    - **environment**: Session-information

    Output:
    - **stdout**: Feedback till Claude (visas i konversationen)
    - **stderr**: Debug-information
    - **exit code**: 0 = ok, 2 = blockera operation

    ```json
    // Hook-input (stdin)
    {
      "hook_type": "PostToolUse",
      "tool_name": "Edit",
      "tool_input": { "file_path": "...", "old_string": "...", "new_string": "..." },
      "tool_output": "...",
      "session_id": "abc123"
    }
    ```

---

## Konfigurera hooks

### Plats för konfiguration

Hooks definieras i `.claude/settings.json` i projektroten:

```json
{
  "hooks": {
    "PostToolUse": [
      {
        "matcher": "Edit",
        "command": "npm run lint --fix ${file_path}"
      }
    ]
  }
}
```

### Struktur

```json
{
  "hooks": {
    "EVENT_TYPE": [
      {
        "matcher": "TOOL_NAME eller REGEX",
        "command": "SHELL-KOMMANDO"
      }
    ]
  }
}
```

---

## Praktiska exempel

### Auto-lint efter filändringar

```json
{
  "hooks": {
    "PostToolUse": [
      {
        "matcher": "Edit|Write",
        "command": "npx eslint --fix $(echo $TOOL_INPUT | jq -r '.file_path')"
      }
    ]
  }
}
```

### Förhindra ändringar i känsliga filer

```json
{
  "hooks": {
    "PreToolUse": [
      {
        "matcher": "Edit|Write",
        "command": "bash -c 'FILE=$(echo $TOOL_INPUT | jq -r .file_path); [[ $FILE == *.env* ]] && exit 2 || exit 0'"
      }
    ]
  }
}
```

Exit code 2 blockerar operationen och visar ett meddelande.

### Logga alla bash-kommandon

```json
{
  "hooks": {
    "PostToolUse": [
      {
        "matcher": "Bash",
        "command": "echo \"$(date): $TOOL_INPUT\" >> ~/.claude-bash-log.txt"
      }
    ]
  }
}
```

### Kör tester efter kodändringar

```json
{
  "hooks": {
    "PostToolUse": [
      {
        "matcher": "Edit",
        "command": "npm test --watchAll=false 2>&1 | head -20"
      }
    ]
  }
}
```

---

## Domänspecifika hooks

### Home Assistant

**Validera YAML efter ändringar:**

```json
{
  "hooks": {
    "PostToolUse": [
      {
        "matcher": "Edit|Write",
        "command": "bash -c '[[ \"$TOOL_INPUT\" == *\".yaml\"* ]] && python -c \"import yaml; yaml.safe_load(open($(echo $TOOL_INPUT | jq -r .file_path)))\" 2>&1 || true'"
      }
    ]
  }
}
```

### Power BI / DAX

**Formatera DAX-kod:**

```json
{
  "hooks": {
    "PostToolUse": [
      {
        "matcher": "Edit",
        "command": "bash -c '[[ \"$TOOL_INPUT\" == *\".dax\"* ]] && dax-formatter $(echo $TOOL_INPUT | jq -r .file_path) || true'"
      }
    ]
  }
}
```

### Git-projekt

**Visa git diff efter ändringar:**

```json
{
  "hooks": {
    "PostToolUse": [
      {
        "matcher": "Edit|Write",
        "command": "git diff --stat HEAD 2>/dev/null || true"
      }
    ]
  }
}
```

---

## Hook-typer i detalj

### PreToolUse

Körs **innan** verktyget exekveras.

**Användningsfall:**
- Validera input
- Blockera farliga operationer
- Logga vad som ska hända

```json
{
  "PreToolUse": [
    {
      "matcher": "Bash",
      "command": "bash -c '[[ \"$TOOL_INPUT\" == *\"rm -rf\"* ]] && exit 2 || exit 0'"
    }
  ]
}
```

### PostToolUse

Körs **efter** verktyget exekverats.

**Användningsfall:**
- Formatera kod
- Köra tester
- Uppdatera dokumentation
- Logga resultat

### Notification

Körs när Claude skickar en notifikation.

**Användningsfall:**
- Desktop-notifikationer
- Slack-meddelanden
- Logga milstolpar

```json
{
  "Notification": [
    {
      "matcher": ".*",
      "command": "notify-send 'Claude Code' \"$NOTIFICATION_MESSAGE\""
    }
  ]
}
```

### Stop

Körs när Claude avslutar en turn.

**Användningsfall:**
- Sammanfatta vad som gjordes
- Uppdatera status
- Trigga CI/CD

---

## Avancerade mönster

### Kedja flera hooks

```json
{
  "PostToolUse": [
    {
      "matcher": "Edit",
      "command": "npx eslint --fix $FILE_PATH"
    },
    {
      "matcher": "Edit",
      "command": "npx prettier --write $FILE_PATH"
    },
    {
      "matcher": "Edit",
      "command": "npm test -- --findRelatedTests $FILE_PATH"
    }
  ]
}
```

### Villkorlig exekvering

```bash
# Kör endast för JavaScript-filer
bash -c '[[ "$FILE_PATH" == *.js ]] && npm run lint || true'
```

### Skicka feedback till Claude

Hook-output på stdout visas för Claude och kan påverka nästa steg:

```json
{
  "PostToolUse": [
    {
      "matcher": "Bash",
      "command": "echo 'Kom ihåg att köra testerna innan commit!'"
    }
  ]
}
```

---

## Felsökning

??? question "Hook körs inte"

    1. Kontrollera att `.claude/settings.json` är giltig JSON
    2. Verifiera att `matcher` matchar verktygsnamnet
    3. Testa kommandot manuellt i terminalen
    4. Kolla att filen har rätt behörigheter

??? question "Hook blockerar oavsiktligt"

    - Se över exit codes - endast 2 blockerar
    - Lägg till `|| true` i slutet av kommandon som kan misslyckas
    - Använd `bash -c` för komplex logik

??? question "Hook ger inget output"

    - Kontrollera att kommandot skriver till stdout
    - Verifiera att kommandot körs (lägg till loggning)
    - Testa med ett enkelt echo-kommando först

---

## Tips för effektiva hooks

### Håll dem snabba

Hooks körs synkront. Långsamma hooks saktar ner hela sessionen.

```json
// Bra - snabbt
{ "command": "echo $FILE_PATH >> changes.log" }

// Dåligt - långsamt
{ "command": "npm run full-test-suite" }
```

### Hantera fel graciöst

```bash
kommando || true  # Ignorera fel
kommando 2>/dev/null  # Tysta felmeddelanden
```

### Testa isolerat först

```bash
# Testa hook-kommandot direkt
echo '{"file_path":"test.js"}' | TOOL_INPUT='{"file_path":"test.js"}' bash -c 'echo $TOOL_INPUT'
```

---

## Sammanfattning

!!! success "Det viktigaste att ta med sig"
    - **Hooks** automatiserar åtgärder vid specifika händelser
    - **PreToolUse** kan blockera operationer (exit code 2)
    - **PostToolUse** är bäst för linting, formatering, tester
    - Konfigurera i `.claude/settings.json`
    - Håll hooks **snabba** för bästa upplevelse
    - Använd **`|| true`** för att undvika oavsiktliga blockeringar

---

## Nästa steg

Lär dig om [MCP-servrar](mcp-servrar.md) för att utöka Claude Codes kapabiliteter.
