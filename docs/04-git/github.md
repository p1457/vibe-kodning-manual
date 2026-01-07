# GitHub

GitHub är en plattform för att lagra och dela Git-projekt i molnet.

---

## Skapa GitHub-konto

1. Gå till [github.com](https://github.com)
2. Klicka **Sign up**
3. Följ instruktionerna

!!! tip "Gratis för personligt bruk"
    GitHub är gratis för privata och publika repositories. Du behöver bara betala för avancerade team-funktioner.

---

## Skapa ett repository på GitHub

=== "Nybörjare"

    1. Logga in på GitHub
    2. Klicka på **+** uppe till höger → **New repository**
    3. Fyll i:
       - **Repository name**: `mitt-projekt` (samma som din mapp)
       - **Description**: Valfri beskrivning
       - **Public/Private**: Välj Private om du vill hålla det för dig själv
    4. Klicka **Create repository**

    GitHub visar nu instruktioner för att koppla ihop ditt lokala projekt.

=== "Standard"

    Via webben eller GitHub CLI (`gh`):

    ```bash
    # Installera GitHub CLI
    # Windows: winget install GitHub.cli
    # macOS: brew install gh

    # Logga in
    gh auth login

    # Skapa repo
    gh repo create mitt-projekt --private
    ```

---

## Koppla ihop lokalt och GitHub

### Om du har ett befintligt lokalt projekt:

```bash
# Lägg till GitHub som "remote"
git remote add origin https://github.com/ditt-användarnamn/mitt-projekt.git

# Pusha till GitHub
git push -u origin main
```

=== "Nybörjare"

    **Vad betyder detta?**

    - `origin` - Ett smeknamn för GitHub-adressen
    - `main` - Namnet på din huvudbranch
    - `-u` - Kopplar ihop lokal branch med remote (behövs bara första gången)

=== "Standard"

    Efter första push räcker det med:

    ```bash
    git push
    ```

---

## Autentisering

=== "Nybörjare"

    När du pushar första gången frågar Git efter inloggning. Det finns två sätt:

    **1. HTTPS med Personal Access Token (enklast):**

    1. Gå till GitHub → Settings → Developer settings → Personal access tokens
    2. Klicka **Generate new token (classic)**
    3. Ge den ett namn och välj scope "repo"
    4. Kopiera token (visas bara en gång!)
    5. Använd token som lösenord när Git frågar

    **2. SSH-nycklar (mer avancerat men smidigare i längden)**

=== "Standard"

    **HTTPS + Credential Manager (rekommenderas för Windows):**

    ```bash
    git config --global credential.helper manager
    ```

    **SSH:**

    ```bash
    # Generera nyckel
    ssh-keygen -t ed25519 -C "din@email.se"

    # Lägg till i ssh-agent
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_ed25519

    # Kopiera public key
    cat ~/.ssh/id_ed25519.pub
    # Klistra in på GitHub → Settings → SSH Keys
    ```

=== "Djupdykning"

    För organisationer, använd GitHub CLI eller deploy keys:

    ```bash
    # GitHub CLI hanterar auth automatiskt
    gh auth login

    # Klona med gh
    gh repo clone org/repo
    ```

---

## Hämta ändringar

```bash
# Hämta och slå ihop ändringar
git pull

# Eller separat
git fetch    # Hämta utan att ändra
git merge    # Slå ihop
```

---

## Synka med Claude Code

Du kan be Claude hantera GitHub-operationer:

```
Pusha alla mina ändringar till GitHub
```

```
Hämta senaste från GitHub
```

```
Skapa ett nytt repository på GitHub för detta projekt
```

---

## GitHub via webbgränssnittet

GitHub har ett kraftfullt webbgränssnitt:

- **Code** - Bläddra i filer
- **Commits** - Se historik
- **Branches** - Hantera grenar
- **Pull requests** - Kodgranskning (mer om detta senare)
- **Issues** - Bugtracking och uppgifter
- **Actions** - Automatisering (CI/CD)

---

## Nästa steg

Lär dig hur du säkerhetskopierar till din [NAS](backup-nas.md).
