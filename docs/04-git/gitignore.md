# .gitignore - Ignorera filer

Lär dig vilka filer som inte ska versionshanteras och hur du konfigurerar Git att ignorera dem.

!!! abstract "Vad du kommer lära dig"
    - Varför vissa filer inte ska vara med i Git
    - Hur .gitignore fungerar
    - Vanliga mönster för olika projekttyper
    - Hur Claude Code kan hjälpa dig

---

## Varför ignorera filer?

=== "Nybörjare"

    Vissa filer ska **aldrig** läggas in i Git:

    | Typ | Exempel | Varför ignorera? |
    |-----|---------|------------------|
    | **Hemligheter** | `.env`, `secrets.yaml` | Lösenord och API-nycklar |
    | **Beroenden** | `node_modules/` | Kan återskapas med `npm install` |
    | **Byggfiler** | `dist/`, `build/` | Genereras automatiskt |
    | **Personligt** | `.vscode/`, `*.swp` | Dina editor-inställningar |
    | **OS-filer** | `.DS_Store`, `Thumbs.db` | Systemfiler |

    **Vad händer om du inte ignorerar?**

    - Hemligheter läcker till GitHub (farligt!)
    - Repot blir onödigt stort
    - Merge-konflikter i genererade filer
    - Andras editor-inställningar skriver över dina

=== "Standard"

    `.gitignore` är en textfil i projektets rot som talar om för Git vilka filer som ska ignoreras.

    ```gitignore
    # Kommentarer börjar med #

    # Ignorera specifik fil
    secrets.yaml

    # Ignorera alla filer med viss ändelse
    *.log

    # Ignorera mapp (och allt i den)
    node_modules/

    # Ignorera mönster rekursivt
    **/*.tmp

    # Undantag - inkludera trots tidigare regel
    !important.log
    ```

=== "Djupdykning"

    **Gitignore-regler:**

    | Mönster | Matchar |
    |---------|---------|
    | `file.txt` | `file.txt` i alla mappar |
    | `/file.txt` | Endast `file.txt` i roten |
    | `dir/` | Mappen `dir` och allt innehåll |
    | `*.log` | Alla `.log`-filer |
    | `**/*.log` | Alla `.log`-filer rekursivt |
    | `!keep.log` | Undantag - behåll denna |
    | `[abc].txt` | `a.txt`, `b.txt`, `c.txt` |

    **Prioritetsordning:**
    1. Lokala `.gitignore` i undermappar
    2. `.gitignore` i roten
    3. `.git/info/exclude` (personlig, inte delad)
    4. Global gitignore (`~/.gitignore_global`)

---

## Skapa .gitignore

### Med Claude Code

**Det enklaste sättet:**

```
Skapa en .gitignore för ett Node.js-projekt
```

```
Skapa en .gitignore för Python med Django
```

```
Lägg till .env och node_modules i .gitignore
```

### Manuellt

Skapa filen `.gitignore` i projektroten:

```bash
# Windows
echo node_modules/ > .gitignore

# macOS/Linux
touch .gitignore
```

---

## Vanliga .gitignore-mallar

### Node.js / JavaScript

```gitignore
# Beroenden
node_modules/

# Byggfiler
dist/
build/
.next/

# Loggfiler
*.log
npm-debug.log*

# Miljövariabler
.env
.env.local
.env.*.local

# Editor
.vscode/
.idea/
*.swp

# OS
.DS_Store
Thumbs.db
```

### Python

```gitignore
# Beroenden
venv/
__pycache__/
*.py[cod]

# Distribution
dist/
build/
*.egg-info/

# Miljö
.env
*.env

# IDE
.vscode/
.idea/
*.swp

# Jupyter
.ipynb_checkpoints/
```

### Home Assistant

```gitignore
# Hemligheter
secrets.yaml
.storage/

# Loggfiler
home-assistant.log
home-assistant.log.*

# Databas
home-assistant_v2.db
home-assistant_v2.db-*

# Tillfälliga
*.tmp
.HA_VERSION

# Backups
backups/
```

### Power BI / Excel

```gitignore
# Temporära filer
~$*.xlsx
~$*.pbix
*.tmp

# Backups
*.bak
*.xlk

# Lokala inställningar
.pbix.local/
```

---

## Vanliga misstag

### Lägga till .gitignore för sent

Om du redan committat en fil hjälper inte .gitignore:

```bash
# Ta bort från Git men behåll lokalt
git rm --cached secrets.yaml
git commit -m "Ta bort secrets från versionshantering"
```

**Med Claude Code:**
```
Jag har råkat committa .env till Git. Hjälp mig ta bort den från
historiken men behålla filen lokalt.
```

### Glömma trailing slash för mappar

```gitignore
# Fel - ignorerar filen "node_modules"
node_modules

# Rätt - ignorerar mappen "node_modules/"
node_modules/
```

### För breda mönster

```gitignore
# Farligt - ignorerar ALLA .json-filer
*.json

# Bättre - var specifik
package-lock.json
```

---

## Kontrollera vad som ignoreras

### Se ignorerade filer

```bash
git status --ignored
```

### Testa om fil ignoreras

```bash
git check-ignore -v filnamn.txt
```

### Med Claude Code

```
Vilka filer i detta projekt ignoreras av Git?
```

```
Kontrollera om .env är korrekt ignorerad
```

---

## Global .gitignore

För filer du alltid vill ignorera (OS-filer, editor-inställningar):

```bash
# Skapa global gitignore
git config --global core.excludesfile ~/.gitignore_global
```

**~/.gitignore_global:**
```gitignore
# macOS
.DS_Store
.AppleDouble
.LSOverride

# Windows
Thumbs.db
desktop.ini

# Editors
*.swp
*.swo
*~
.idea/
.vscode/
```

---

## Prova själv

!!! example "Övning: Konfigurera .gitignore"

    1. **Skapa ett testprojekt:**
       ```bash
       mkdir gitignore-test
       cd gitignore-test
       git init
       ```

    2. **Be Claude skapa .gitignore:**
       ```
       Skapa en .gitignore för ett Node.js-projekt med
       TypeScript och environment-variabler
       ```

    3. **Skapa testfiler:**
       ```bash
       mkdir node_modules
       echo "SECRET=abc123" > .env
       echo "console.log('hello')" > app.js
       ```

    4. **Kontrollera vad som ignoreras:**
       ```bash
       git status
       ```

       Du bör se `app.js` men INTE `.env` eller `node_modules/`

    5. **Verifiera:**
       ```
       Kontrollera att .env och node_modules ignoreras korrekt
       ```

---

## Sammanfattning

!!! success "Det viktigaste"
    - **Skapa alltid .gitignore** innan första commit
    - **Ignorera hemligheter** (`.env`, `secrets.yaml`) - alltid!
    - **Ignorera beroenden** (`node_modules/`, `venv/`)
    - **Ignorera byggfiler** (`dist/`, `build/`)
    - Be Claude: **"Skapa .gitignore för [projekttyp]"**
    - Använd **global gitignore** för OS/editor-filer

---

## Nästa steg

Lär dig mer om [GitHub](github.md) för att dela dina projekt online.
