# Sessioner och kontext

Lär dig hantera längre arbetssessioner och förstå hur Claude's minne fungerar.

!!! abstract "Vad du kommer lära dig"
    - Spara och återuppta sessioner
    - Hur kontextfönstret fungerar
    - Komprimera historik för att spara utrymme
    - Extended thinking för komplexa problem

---

## Sessionshantering

=== "Nybörjare"

    Du kan **spara ditt arbete** och fortsätta senare:

    **Namnge sessionen:**
    ```
    /rename mitt-projekt-auth
    ```

    **Nästa gång - fortsätt där du slutade:**
    ```bash
    claude --resume mitt-projekt-auth
    ```

    **Eller visa alla sparade sessioner:**
    ```bash
    claude --resume
    ```

    !!! tip "Varför är detta bra?"
        Claude kommer ihåg hela konversationen - vad ni pratat om, vilka filer ni ändrat, och vad som återstår att göra.

=== "Standard"

    **Sessionskommandon:**

    ```bash
    # Fortsätt senaste sessionen
    claude --continue

    # Fortsätt namngiven session
    claude --resume mitt-feature

    # Lista sessioner och välj
    claude --resume
    ```

    **Under sessionen:**
    ```
    /rename feature-auth
    /resume  # byt till annan session
    ```

=== "Djupdykning"

    Sessioner sparas lokalt och innehåller:

    - Hela konversationshistoriken
    - Kontext från lästa filer
    - Permission-inställningar för sessionen

    **Kombinera med Git worktrees för parallellt arbete:**
    ```bash
    git worktree add ../project-feature-a -b feature-a
    cd ../project-feature-a
    claude  # Helt isolerad session
    ```

---

## Kontextfönstret

=== "Nybörjare"

    Claude kommer ihåg vad ni pratat om tidigare i sessionen. Men om historiken blir för lång kan den "glömma" äldre saker.

    **Tänk på kontexten som ett fönster** - Claude ser bara det som ryms i fönstret. Äldre saker försvinner ut.

    **Om Claude verkar glömma:**
    ```
    /compact
    ```

    Detta sammanfattar historiken för att spara utrymme.

=== "Standard"

    Claude Code har ett **kontextfönster** som begränsar hur mycket den kan komma ihåg (~200k tokens).

    **Strategier för att hantera kontext:**

    | Kommando | Effekt |
    |----------|--------|
    | `/compact` | Sammanfattar historiken |
    | `/clear` | Rensar allt och börjar om |
    | `@fil` | Effektivare än att be Claude söka |

    **Varningssignaler att kontexten är full:**
    - Claude "glömmer" tidigare beslut
    - Upprepade frågor om samma sak
    - Långsammare svar

=== "Djupdykning"

    Kontextfönstret är ~200k tokens. När det fylls:

    1. Automatisk sammanfattning triggas
    2. Äldsta delar av konversationen komprimeras
    3. Filinnehåll kan behöva läsas om

    **Tokens vs tecken:**
    - 1 token ≈ 3-4 tecken på engelska
    - Svenska text kan vara ~20% fler tokens
    - Kod är ofta mer token-effektiv än prosa

---

## Komprimera historiken

### När ska du komprimera?

- Efter långa debugging-sessioner
- När du byter fokus till ny uppgift
- Om Claude börjar "glömma"

### Hur du komprimerar

```
/compact
```

Claude sammanfattar konversationen och frigör utrymme.

**Manuell komprimering med instruktioner:**
```
/compact Fokusera på att behålla:
- Beslut om databasstrukturen
- Kvarvarande TODO:s
- Viktiga kodändringar
```

---

## Extended thinking

=== "Nybörjare"

    För riktigt svåra problem kan du be Claude tänka extra noga:

    ```
    Tänk igenom detta ordentligt: Hur bör jag strukturera min app?
    ```

=== "Standard"

    **Thinking-prefix för djupare analys:**

    | Prefix | Tanketid |
    |--------|----------|
    | `think:` | Standard |
    | `think hard:` | Mer |
    | `think harder:` | Ännu mer |
    | `ultrathink:` | Maximum |

    **Exempel:**
    ```
    ultrathink: Designa en skalbar arkitektur för vår mikrotjänst
    ```

=== "Djupdykning"

    Extended thinking allokerar fler tokens för intern resonering innan svar genereras.

    **Se tankegången:**

    Tryck ++ctrl+o++ för verbose mode - visar Claude's resonemang i grå text.

    **Bäst för:**
    - Arkitekturbeslut
    - Komplex felsökning
    - Kodrefaktorering
    - Säkerhetsanalys

---

## Starta om vs fortsätta

| Situation | Rekommendation |
|-----------|----------------|
| Samma projekt, samma dag | `claude --continue` |
| Samma projekt, ny dag | `claude --resume projektnamn` |
| Nytt projekt | `claude` (ny session) |
| Utforska idé utan att påverka huvudsession | Ny terminal + `claude` |

---

## Praktiska tips

### Namnge sessioner beskrivande

```
/rename projekt-auth-oauth2
/rename bugfix-checkout-crash
/rename feature-dark-mode
```

### Använd flera sessioner parallellt

**Terminal 1:**
```bash
claude --resume feature-frontend
```

**Terminal 2:**
```bash
claude --resume feature-backend
```

### Städa gamla sessioner

```bash
# Lista alla sessioner
claude --resume

# Ta bort specifik session (om kommando finns)
# Annars: rensa ~/.claude/sessions/ manuellt
```

---

## Prova själv

!!! example "Övning: Sessionshantering"

    1. **Starta Claude Code:**
       ```bash
       claude
       ```

    2. **Gör något arbete:**
       ```
       Skapa en enkel todo-lista i HTML
       ```

    3. **Namnge sessionen:**
       ```
       /rename ovning-todo
       ```

    4. **Avsluta:**
       ```
       /exit
       ```

    5. **Återuppta:**
       ```bash
       claude --resume ovning-todo
       ```

    6. **Verifiera att Claude kommer ihåg:**
       ```
       Vad gjorde vi senast?
       ```

---

## Sammanfattning

!!! success "Det viktigaste"
    - **/rename** och **--resume** sparar och återupptar arbete
    - **/compact** sammanfattar historiken när kontexten blir full
    - **++ctrl+o++** visar Claude's tankegång
    - **ultrathink:** ger djupare analys för komplexa problem
    - Använd **flera sessioner** för parallellt arbete

---

## Nästa steg

Lär dig om [permissions och säkerhet](permissions.md) för att kontrollera vad Claude får göra.
