# Grundläggande kommandon i Claude Code

En översikt över de viktigaste kommandona och genvägarna i Claude Code.

!!! abstract "Vad du kommer lära dig"
    - Hur du startar och avslutar Claude Code
    - De viktigaste slash-kommandona
    - Tangentbordsgenvägar för effektivt arbete

!!! tip "Fördjupning"
    Detta kapitel ger en snabb översikt. Se dessa sidor för detaljer:

    - [Filreferenser med @](filreferenser.md) - Referera till filer och bilder
    - [Sessioner och kontext](sessioner-och-kontext.md) - Spara arbete och hantera minne
    - [Permissions](permissions.md) - Kontrollera vad Claude får göra

---

## Starta och avsluta

```bash
# Starta Claude Code i nuvarande mapp
claude

# Fortsätt senaste sessionen
claude --continue

# Återuppta namngiven session
claude --resume mitt-projekt
```

**Avsluta:**
```
/exit
```
Eller tryck ++ctrl+d++

---

## Slash-kommandon

Claude Code har inbyggda kommandon som börjar med `/`:

### De viktigaste

| Kommando | Beskrivning |
|----------|-------------|
| `/help` | Visa hjälp och alla kommandon |
| `/exit` | Avsluta Claude Code |
| `/clear` | Rensa konversationshistoriken |
| `/compact` | Komprimera historiken för att spara kontext |

### Sessioner och minne

| Kommando | Beskrivning |
|----------|-------------|
| `/memory` | Visa och redigera projektminnet (CLAUDE.md) |
| `/rename` | Ge sessionen ett namn |
| `/resume` | Växla till en tidigare session |

### Inställningar

| Kommando | Beskrivning |
|----------|-------------|
| `/permissions` | Se och ändra tillåtelse-regler |
| `/config` | Visa eller ändra inställningar |
| `/model` | Byt AI-modell (sonnet, opus, haiku) |
| `/cost` | Se hur mycket du har använt (tokens/kostnad) |

### Avancerat

| Kommando | Beskrivning |
|----------|-------------|
| `/vim` | Aktivera Vim-redigeringsläge |
| `/agents` | Se aktiva underagenter |
| `/add-dir` | Lägg till extra mappar som Claude kan komma åt |

---

## Tangentbordsgenvägar

=== "Grundläggande"

    | Genväg | Vad det gör |
    |--------|-------------|
    | ++enter++ | Skicka meddelande |
    | ++ctrl+c++ | Avbryt nuvarande operation |
    | ++ctrl+d++ | Avsluta Claude Code |
    | ++shift+tab++ | Byt tillåtelse-läge |
    | ++up++ / ++down++ | Bläddra i tidigare meddelanden |
    | ++tab++ | Autokomplettera filnamn |

=== "Avancerade"

    | Genväg | Vad det gör |
    |--------|-------------|
    | ++esc++ ++esc++ | Ångra senaste filändringar |
    | ++ctrl+l++ | Rensa skärmen (behåller historik) |
    | ++ctrl+o++ | Visa/dölj Claude's tankegång |
    | ++ctrl+r++ | Sök i kommandohistorik |

=== "Plattformsspecifika"

    | Funktion | macOS | Windows/Linux |
    |----------|-------|---------------|
    | Byt modell | ++option+p++ | ++alt+p++ |
    | Klistra bild | ++ctrl+v++ | ++alt+v++ |

---

## Snabbstart-övning

!!! example "Prova grunderna"

    1. **Starta Claude Code:**
       ```bash
       claude
       ```

    2. **Be om hjälp:**
       ```
       /help
       ```

    3. **Testa @-referens:**
       ```
       Vad finns i mappen @.?
       ```

    4. **Byt permission-läge:**
       Tryck ++shift+tab++ och se hur läget ändras

    5. **Se verbose mode:**
       Tryck ++ctrl+o++ och ställ en fråga

    6. **Avsluta:**
       ```
       /exit
       ```

---

## Sammanfattning

!!! success "Det viktigaste att ta med sig"
    - **`claude`** startar, **`/exit`** avslutar
    - **++shift+tab++** byter permission-läge (viktigt!)
    - **++ctrl+o++** visar hur Claude tänker
    - **++esc++ ++esc++** ångrar senaste ändringar
    - **`/compact`** sammanfattar historiken när det blir fullt

---

## Nästa steg

- [Filreferenser med @](filreferenser.md) - Så pekar du på filer
- [Sessioner och kontext](sessioner-och-kontext.md) - Spara och återuppta arbete
- [Permissions](permissions.md) - Låt Claude arbeta självständigt
- [Filhantering](filhantering.md) - Hur Claude läser och skriver filer
