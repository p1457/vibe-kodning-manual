# Kommandoöversikt

Snabbreferens för vanliga kommandon.

---

## Claude Code-kommandon

### Starta och avsluta

| Kommando | Beskrivning |
|----------|-------------|
| `claude` | Starta Claude Code i nuvarande mapp |
| `/exit` | Avsluta sessionen |
| `/help` | Visa hjälp |

### Under session

| Kommando | Beskrivning |
|----------|-------------|
| `/clear` | Rensa konversationshistoriken |
| `/compact` | Komprimera historiken |
| `/status` | Visa aktuell status |
| `/config` | Visa/ändra inställningar |

---

## Terminal-kommandon

### Navigation

=== "Windows (PowerShell)"

    | Kommando | Beskrivning |
    |----------|-------------|
    | `pwd` | Visa nuvarande mapp |
    | `cd mappnamn` | Gå till mapp |
    | `cd ..` | Gå upp en nivå |
    | `cd ~` | Gå till hemmappen |
    | `dir` | Lista filer |
    | `dir -la` | Lista med detaljer |

=== "macOS/Linux"

    | Kommando | Beskrivning |
    |----------|-------------|
    | `pwd` | Visa nuvarande mapp |
    | `cd mappnamn` | Gå till mapp |
    | `cd ..` | Gå upp en nivå |
    | `cd ~` | Gå till hemmappen |
    | `ls` | Lista filer |
    | `ls -la` | Lista med detaljer |

### Fil- och mapphantering

=== "Windows (PowerShell)"

    | Kommando | Beskrivning |
    |----------|-------------|
    | `mkdir namn` | Skapa mapp |
    | `rmdir namn` | Ta bort tom mapp |
    | `del fil` | Ta bort fil |
    | `copy fil1 fil2` | Kopiera fil |
    | `move fil1 fil2` | Flytta/byt namn |
    | `type fil` | Visa filinnehåll |
    | `cls` | Rensa skärmen |

=== "macOS/Linux"

    | Kommando | Beskrivning |
    |----------|-------------|
    | `mkdir namn` | Skapa mapp |
    | `rmdir namn` | Ta bort tom mapp |
    | `rm fil` | Ta bort fil |
    | `cp fil1 fil2` | Kopiera fil |
    | `mv fil1 fil2` | Flytta/byt namn |
    | `cat fil` | Visa filinnehåll |
    | `clear` | Rensa skärmen |

---

## Git-kommandon

### Grundläggande

| Kommando | Beskrivning |
|----------|-------------|
| `git init` | Skapa nytt repository |
| `git status` | Visa status |
| `git add .` | Lägg till alla ändringar |
| `git add fil` | Lägg till specifik fil |
| `git commit -m "meddelande"` | Skapa commit |
| `git log` | Visa historik |
| `git log --oneline` | Kompakt historik |

### Remote (GitHub)

| Kommando | Beskrivning |
|----------|-------------|
| `git remote add origin URL` | Lägg till remote |
| `git push -u origin main` | Första push |
| `git push` | Pusha ändringar |
| `git pull` | Hämta ändringar |
| `git clone URL` | Klona repository |

### Branches

| Kommando | Beskrivning |
|----------|-------------|
| `git branch` | Lista branches |
| `git branch namn` | Skapa branch |
| `git switch namn` | Byt branch |
| `git switch -c namn` | Skapa och byt |
| `git merge namn` | Slå ihop branch |

### Ångra

| Kommando | Beskrivning |
|----------|-------------|
| `git restore fil` | Ångra ändringar i fil |
| `git restore --staged fil` | Ta bort från staging |
| `git reset --soft HEAD~1` | Ångra commit (behåll ändringar) |
| `git reset --hard HEAD~1` | Ångra commit (ta bort ändringar) |

---

## npm-kommandon

| Kommando | Beskrivning |
|----------|-------------|
| `npm init` | Skapa package.json |
| `npm install` | Installera dependencies |
| `npm install paket` | Installera specifikt paket |
| `npm install -g paket` | Installera globalt |
| `npm run script` | Kör script från package.json |
| `npm test` | Kör tester |
| `npm start` | Starta app |

---

## Tangentbordsgenvägar

### Terminal

| Genväg | Beskrivning |
|--------|-------------|
| ++tab++ | Autokomplettera |
| ++ctrl+c++ | Avbryt körande kommando |
| ++ctrl+l++ | Rensa skärmen |
| ++arrow-up++ | Föregående kommando |
| ++ctrl+r++ | Sök i historik |

### Claude Code

| Genväg | Beskrivning |
|--------|-------------|
| ++enter++ | Skicka meddelande |
| ++ctrl+c++ | Avbryt pågående operation |
