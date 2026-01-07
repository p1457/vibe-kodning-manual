# Grundläggande terminal

Terminalen kan kännas skrämmande om du aldrig använt den, men de kommandon du behöver för att arbeta med Claude Code är få och enkla.

!!! abstract "Vad du kommer lära dig"
    - Vad terminalen är och varför vi använder den
    - De 5-6 kommandon du verkligen behöver
    - Hur sökvägar fungerar
    - Vanliga misstag och hur du undviker dem

---

## Vad är terminalen?

=== "Nybörjare"

    **Terminalen** (eller "kommandotolken") är ett sätt att prata med din dator genom att skriva kommandon istället för att klicka.

    Tänk på det som att skicka SMS till datorn istället för att peka och klicka.

    **Varför använda den?**

    - Den är snabb när man vant sig
    - Vissa saker går bara att göra i terminalen
    - Claude Code körs i terminalen

=== "Standard"

    Terminalen är ett textbaserat gränssnitt till operativsystemet. Den kallas ibland CLI (Command Line Interface) i kontrast till GUI (Graphical User Interface).

    Du skriver kommandon och får textbaserad output tillbaka.

=== "Djupdykning"

    På Windows finns flera terminaler:

    - **PowerShell** - Modernt, objektbaserat skal
    - **Command Prompt (cmd)** - Legacy, kör .bat-filer
    - **Windows Terminal** - Wrapper som kan köra båda + WSL
    - **Git Bash** - Unix-liknande miljö på Windows

    På macOS/Linux är standardskalet vanligen **bash** eller **zsh**.

---

## Öppna terminalen

=== "Windows"

    **Windows Terminal (rekommenderas):**

    1. Tryck ++win++ och skriv "terminal"
    2. Klicka på **Windows Terminal**

    **PowerShell:**

    1. Tryck ++win++ och skriv "powershell"
    2. Klicka på **Windows PowerShell**

=== "macOS"

    1. Tryck ++cmd+space++ för att öppna Spotlight
    2. Skriv "terminal"
    3. Tryck ++enter++

=== "Linux"

    - Vanligtvis ++ctrl+alt+t++
    - Eller leta i programmenyn efter "Terminal"

---

## De kommandon du behöver

### Navigering

| Vad du vill | Windows | macOS/Linux |
|-------------|---------|-------------|
| Se var du är | `pwd` | `pwd` |
| Lista filer | `dir` | `ls` |
| Gå in i mapp | `cd mappnamn` | `cd mappnamn` |
| Gå upp en nivå | `cd ..` | `cd ..` |
| Gå till hemmet | `cd ~` | `cd ~` |

### Skapa och ta bort

| Vad du vill | Windows | macOS/Linux |
|-------------|---------|-------------|
| Skapa mapp | `mkdir namn` | `mkdir namn` |
| Ta bort mapp | `rmdir namn` | `rmdir namn` |
| Ta bort fil | `del filnamn` | `rm filnamn` |

### Visa innehåll

| Vad du vill | Windows | macOS/Linux |
|-------------|---------|-------------|
| Visa fil | `type filnamn` | `cat filnamn` |
| Rensa skärmen | `cls` | `clear` |

---

## Praktiska exempel

=== "Nybörjare"

    ### Scenario: Skapa ett nytt projekt

    ```powershell
    # Se var du är nu
    pwd

    # Gå till Dokument
    cd Documents

    # Skapa en ny mapp
    mkdir mitt-projekt

    # Gå in i mappen
    cd mitt-projekt

    # Kontrollera att du är på rätt ställe
    pwd
    ```

    !!! tip "Tips: Tab-komplettering"
        Skriv första bokstäverna av ett mapp- eller filnamn och tryck ++tab++. Terminalen fyller i resten automatiskt!

=== "Standard"

    ### Vanligt arbetsflöde

    ```bash
    # Navigera till projektmappen
    cd ~/Documents/mitt-projekt

    # Se vad som finns
    ls -la  # eller 'dir' på Windows

    # Starta Claude Code
    claude
    ```

=== "Djupdykning"

    ### Kraftfulla tillägg

    ```bash
    # Skapa mappar rekursivt
    mkdir -p projekt/src/components

    # Lista med detaljer
    ls -lah  # storlek, datum, dolda filer

    # Sök efter fil
    find . -name "*.js"  # macOS/Linux
    Get-ChildItem -Recurse -Filter "*.js"  # PowerShell
    ```

---

## Sökvägar förklarade

=== "Nybörjare"

    En **sökväg** är adressen till en fil eller mapp på din dator.

    **Absolut sökväg** - hela adressen från roten:
    ```
    C:\Users\Peter\Documents\projekt\app.js    (Windows)
    /Users/peter/Documents/projekt/app.js      (macOS)
    ```

    **Relativ sökväg** - från där du står:
    ```
    projekt/app.js
    ../annan-mapp/fil.txt
    ```

    `..` betyder "mappen ovanför"
    `.` betyder "denna mapp"

=== "Standard"

    | Symbol | Betydelse |
    |--------|-----------|
    | `/` eller `\` | Mappavdelare |
    | `~` | Hemmappen |
    | `.` | Nuvarande mapp |
    | `..` | Föräldrarmapp |

=== "Djupdykning"

    Windows accepterar både `/` och `\` i moderna versioner. PowerShell normaliserar ofta sökvägar automatiskt.

    Tilde-expansion (`~`) fungerar i PowerShell och bash/zsh, men inte i klassisk cmd.

---

## Vanliga misstag

!!! warning "Mellanslag i sökvägar"

    Om din mapp heter "Mitt Projekt" (med mellanslag), måste du använda citattecken:

    ```bash
    cd "Mitt Projekt"
    ```

!!! warning "Fel mapp"

    Glöm inte att du måste vara i rätt mapp för att Claude Code ska se dina projektfiler. Använd `pwd` för att kontrollera.

---

## Prova själv

!!! example "Övning: Navigera runt"

    Öppna terminalen och prova dessa steg:

    1. **Se var du är:**
       ```bash
       pwd
       ```

    2. **Lista vad som finns:**
       ```bash
       dir     # Windows
       ls      # macOS/Linux
       ```

    3. **Gå till Dokument-mappen:**
       ```bash
       cd Documents
       ```

    4. **Skapa en övningsmapp:**
       ```bash
       mkdir terminal-ovning
       ```

    5. **Gå in i mappen och tillbaka:**
       ```bash
       cd terminal-ovning
       pwd
       cd ..
       pwd
       ```

    6. **Ta bort övningsmappen:**
       ```bash
       rmdir terminal-ovning
       ```

    Om allt fungerade har du lärt dig de viktigaste kommandona!

---

## Sammanfattning

!!! success "Det viktigaste att ta med sig"
    - **Terminalen** är ett textbaserat sätt att ge kommandon till datorn
    - Du behöver bara **5-6 kommandon** för det mesta: `cd`, `pwd`, `ls`/`dir`, `mkdir`, `rmdir`
    - Använd ++tab++ för att **autokomplettera** - du slipper skriva hela namnet
    - **Kontrollera alltid var du är** med `pwd` innan du startar Claude Code
    - Sökvägar med **mellanslag** måste ha citattecken runt sig

---

## Nästa steg

Nu har du grunderna! Fortsätt till [Claude Codes grundläggande kommandon](../03-claude-code-grunder/grundlaggande-kommandon.md).
