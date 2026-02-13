# Filreferenser med @

Lär dig använda @-symbolen för att referera till filer och andra resurser.

!!! abstract "Vad du kommer lära dig"
    - Hur @-kommandon fungerar
    - Referera till filer, mappar och mönster
    - Analysera bilder
    - Använda MCP-resurser

---

## @-kommandon: Referera till filer

=== "Nybörjare"

    Med **@-symbolen** kan du peka på filer direkt i din fråga. Detta är snabbare än att be Claude leta efter filer själv.

    ```
    Förklara vad @src/app.js gör
    ```

    ```
    Jämför @index.html och @about.html
    ```

    ```
    Vad finns i mappen @src/components?
    ```

    **Varför använda @?**

    - Claude läser filen direkt istället för att söka
    - Sparar tid och kontext
    - Du vet exakt vilken fil Claude tittar på

=== "Standard"

    **@-syntax:**

    | Exempel | Vad det gör |
    |---------|-------------|
    | `@filnamn.js` | Läser in filen |
    | `@src/components/` | Visar mappstruktur |
    | `@*.yaml` | Alla yaml-filer |
    | `@package.json` | Specifik fil i roten |

    **Praktiska exempel:**

    ```
    Lägg till felhantering i @src/api.js baserat på mönstret i @src/utils/errors.js
    ```

    ```
    Skapa tester för @src/components/Button.jsx
    ```

=== "Djupdykning"

    @-referensen inkluderar hela filens innehåll i konversationen. För mappar visas en fillista.

    **Wildcards:**
    ```
    @src/**/*.test.js    # Alla testfiler rekursivt
    @*.{js,ts}           # Alla JS och TS-filer i roten
    @config/*.yaml       # Alla YAML i config-mappen
    ```

---

## Bildanalys

=== "Nybörjare"

    Claude kan analysera bilder! Du kan:

    1. **Dra och släpp** en bild i terminalfönstret
    2. **Klistra** från urklipp: ++ctrl+v++ (macOS/Linux) eller ++alt+v++ (Windows)
    3. **Ange sökväg**: "Analysera bilden @screenshot.png"

    **Exempel:**
    ```
    [dra in en skärmdump]
    Vad visar denna skärmdump? Finns det några fel?
    ```

=== "Standard"

    **Vanliga användningsfall:**

    ```
    Analysera @mockup.png och generera HTML/CSS som matchar designen
    ```

    ```
    Vad visar felmeddelandet i @error-screenshot.png?
    ```

    ```
    Jämför @design-v1.png med @design-v2.png - vad har ändrats?
    ```

=== "Djupdykning"

    Bildformat som stöds:
    - PNG, JPEG, GIF, WebP
    - Max ~20MB per bild
    - Bilder inkluderas i kontexten som base64

    **Tips för bästa resultat:**
    - Använd skärmdumpar med hög upplösning
    - Markera relevanta delar om möjligt
    - Beskriv vad du vill att Claude ska fokusera på

---

## MCP-resurser

Om du har konfigurerat [MCP-servrar](../06-avancerat/mcp-servrar.md) kan du referera till externa resurser:

```
@github:repos/owner/repo/issues
```

```
@postgres:query "SELECT * FROM users LIMIT 10"
```

```
@obsidian:notes/meeting-notes.md
```

**Format:** `@servernamn:resursväg`

---

## Tips för effektiv användning

### Kombinera flera filer

```
Jämför implementationen i @src/old/handler.js med @src/new/handler.js
och lista skillnaderna
```

### Referera till specifika delar

```
I @app.js, fokusera på funktionen handleSubmit (rad 45-60)
```

### Undvik onödiga filer

```
# Bra - specifik referens
Fixa buggen i @src/utils/date.js

# Dåligt - för brett
Fixa buggen i @src/
```

---

## Vanliga problem

??? question "Claude hittar inte filen"

    - Kontrollera att sökvägen är korrekt
    - Använd relativa sökvägar från projektmappen
    - Prova med Tab för autokomplettering

??? question "Filen är för stor"

    - Referera till specifika delar istället
    - Be Claude fokusera på relevanta funktioner
    - Dela upp i mindre filer om möjligt

---

## Sammanfattning

!!! success "Det viktigaste"
    - **@filnamn** läser in filer direkt
    - **@mapp/** visar innehållet i en mapp
    - **Bilder** kan dras in eller klistras
    - **MCP-resurser** nås med `@server:resurs`

---

## Nästa steg

Lär dig om [sessioner och kontext](sessioner-och-kontext.md) för att hantera längre arbetssessioner.
