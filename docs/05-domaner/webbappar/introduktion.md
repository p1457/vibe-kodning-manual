# Webbappar med Claude Code

Bygg enkla webbapplikationer utan tidigare programmeringserfarenhet.

---

## Vad är en webbapp?

=== "Nybörjare"

    En **webbapp** är ett program som körs i webbläsaren. Till skillnad från vanliga hemsidor kan webbappar:

    - Reagera på dina handlingar utan att ladda om sidan
    - Spara data
    - Fungera offline (ibland)

    **Exempel på webbappar:**
    - Att-göra-listor
    - Kalkylatorer
    - Enkla spel
    - Dashboards

=== "Standard"

    Moderna webbappar byggs med:

    - **HTML** - Struktur
    - **CSS** - Design
    - **JavaScript** - Funktionalitet

    Ramverk som React, Vue eller Svelte förenklar utvecklingen.

---

## Varför Claude Code för webbappar?

- Du beskriver vad appen ska göra
- Claude skriver HTML, CSS och JavaScript
- Du kan iterera och förbättra stegvis
- Ingen IDE eller komplex setup krävs för enkla appar

---

## Din första webbapp

```
Skapa en enkel att-göra-lista där jag kan:
- Lägga till uppgifter
- Markera uppgifter som klara
- Ta bort uppgifter

Spara listan i localStorage så den finns kvar efter sidladdning.
```

Claude skapar en komplett app med HTML, CSS och JavaScript.

---

## Publicera din app

=== "Nybörjare"

    **Enklaste sättet: GitHub Pages**

    1. Lägg koden i ett GitHub-repo
    2. Gå till Settings → Pages
    3. Välj "Deploy from a branch"
    4. Din app finns på `username.github.io/repo-name`

=== "Standard"

    **Alternativ:**

    | Tjänst | Pris | Användning |
    |--------|------|------------|
    | GitHub Pages | Gratis | Statiska sidor |
    | Netlify | Gratis tier | Statiskt + serverless |
    | Vercel | Gratis tier | Next.js, React |
    | Cloudflare Pages | Gratis | Snabb CDN |

---

## Nästa steg

Se [best practices](best-practices.md) för webbutveckling.
