# Backup till NAS

Utöver GitHub kan du säkerhetskopiera dina Git-projekt till din lokala NAS.

---

## Varför backup till NAS?

=== "Nybörjare"

    **Fördelar:**

    - **Dubbel säkerhet** - Om GitHub går ner har du kvar kopian
    - **Privat** - Data stannar i ditt hem
    - **Snabbt** - Lokalt nätverk är snabbare än internet
    - **Gratis** - Ingen månadskostnad för lagring

    **Nackdelar:**

    - Kräver att NAS:en är igång
    - Ingen tillgång utanför hemmet (utan VPN)

=== "Standard"

    En **3-2-1 backup-strategi** rekommenderas:

    - **3** kopior av data
    - **2** olika lagringsmedier
    - **1** offsite (utanför hemmet)

    Med Git på NAS + GitHub uppfyller du detta.

---

## Förberedelser på NAS:en

=== "Synology"

    1. Installera **Git Server** från Package Center
    2. Skapa en delad mapp för Git-repos (t.ex. `git-repos`)
    3. Aktivera SSH under **Control Panel → Terminal & SNMP**
    4. Lägg till din användare i Git Server-gruppen

=== "QNAP"

    1. Installera **Git** från App Center
    2. Skapa en delad mapp
    3. Aktivera SSH under **Control Panel → Network Services → Telnet/SSH**

=== "Generell Linux/NAS"

    ```bash
    # På NAS:en
    sudo apt install git
    mkdir -p /srv/git
    ```

---

## Skapa ett "bare" repository på NAS:en

Ett **bare repository** är ett Git-repo utan working directory - perfekt för centraliserad lagring.

```bash
# SSH till din NAS
ssh användare@nas-ip

# Skapa repo
cd /volume1/git-repos  # eller var du lagt mappen
git init --bare mitt-projekt.git
```

---

## Lägg till NAS som remote

På din dator:

```bash
cd mitt-projekt

# Lägg till NAS som remote (vid sidan av origin/GitHub)
git remote add nas ssh://användare@nas-ip/volume1/git-repos/mitt-projekt.git

# Pusha till NAS
git push nas main
```

---

## Automatisera backup

=== "Nybörjare"

    Du kan pusha till båda ställen samtidigt genom att lägga till flera push-URL:er:

    ```bash
    # Steg 1: Behåll GitHub som push-destination (VIKTIGT!)
    git remote set-url --add --push origin https://github.com/user/repo.git

    # Steg 2: Lägg till NAS som extra push-destination
    git remote set-url --add --push origin ssh://användare@nas-ip/path/repo.git
    ```

    Nu pushar `git push origin main` till *både* GitHub och NAS!

    !!! warning "Viktigt"
        Du måste först lägga till den befintliga GitHub-URL:en som push-URL,
        annars ersätts den av NAS-URL:en.

=== "Standard"

    **Manuell push till alla remotes:**

    ```bash
    # Skapa ett alias
    git config --global alias.pushall '!git remote | xargs -L1 git push'

    # Använd
    git pushall
    ```

=== "Djupdykning"

    **Script för schemalagd backup:**

    ```bash
    #!/bin/bash
    # save as ~/scripts/git-backup.sh

    REPOS_DIR="$HOME/projects"

    for repo in "$REPOS_DIR"/*/; do
        if [ -d "$repo/.git" ]; then
            echo "Backing up: $repo"
            cd "$repo"
            git push nas --all 2>/dev/null || echo "  No NAS remote"
        fi
    done
    ```

    Schemalägg med cron eller Task Scheduler.

---

## Autentisering med SSH-nycklar

För att slippa skriva lösenord varje gång:

```bash
# På din dator - generera nyckel (om du inte har)
ssh-keygen -t ed25519

# Kopiera public key till NAS
ssh-copy-id användare@nas-ip

# Testa
ssh användare@nas-ip
# Bör logga in utan lösenord
```

---

## Med Claude Code

```
Lägg till min NAS som backup-remote för detta projekt.
NAS-adressen är 192.168.1.100 och användaren är peter.
```

```
Pusha till alla remotes (GitHub och NAS)
```

---

## Felsökning

??? question "Permission denied (publickey)"

    SSH-nyckeln är inte korrekt konfigurerad.

    1. Kontrollera att nyckeln finns: `ls ~/.ssh/`
    2. Lägg till nyckeln på NAS:en: `ssh-copy-id user@nas`

??? question "Connection refused"

    SSH-servern körs inte på NAS:en. Aktivera SSH i NAS:ens kontrollpanel.

??? question "Repository not found"

    Kontrollera sökvägen. Den måste matcha exakt, inklusive `.git` i slutet för bare repos.

---

## Sammanfattning

Du har nu tre kopior av ditt projekt:

1. **Lokalt** på din dator (working copy)
2. **GitHub** (moln, offsite)
3. **NAS** (lokal backup)

Med `git push origin && git push nas` (eller ett alias) håller du alla synkade.
