# Konversationsteknik

Hur du pratar med Claude avgör kvaliteten på resultatet. Här lär du dig kommunicera effektivt.

---

## Grundprinciper

=== "Nybörjare"

    **Tre enkla regler:**

    1. **Var specifik** - "Blå bakgrund" är bättre än "fin bakgrund"
    2. **Ge kontext** - Berätta vad projektet handlar om
    3. **Fråga om du inte förstår** - Claude förklarar gärna

=== "Standard"

    **Effektiv kommunikation:**

    - Beskriv önskat slutresultat
    - Inkludera relevanta begränsningar
    - Referera till befintliga filer vid behov
    - Iterera - det behöver inte bli rätt första gången

=== "Djupdykning"

    **Prompt engineering principer:**

    - **Explicit > Implicit** - Anta inte att Claude förstår underförstått
    - **Konkret > Abstrakt** - Ge exempel när möjligt
    - **Strukturerat > Ostrukturerat** - Punktlistor och numrering hjälper
    - **Iterativt > Allt på en gång** - Bygg upp komplexitet gradvis

---

## Bra vs dåliga prompts

### Exempel 1: Skapa en funktion

❌ **Dåligt:**
```
Fixa sorteringen
```

✅ **Bättre:**
```
I products.js finns en lista med produkter. Sortera dem
efter pris, billigast först.
```

✅ **Bäst:**
```
I products.js, skapa en funktion sortByPrice() som tar
en array av produktobjekt (med egenskapen price) och
returnerar dem sorterade från lägst till högst pris.
```

### Exempel 2: Felsökning

❌ **Dåligt:**
```
Det fungerar inte
```

✅ **Bättre:**
```
När jag klickar på knappen händer ingenting.
Jag får inga fel i konsolen.
```

✅ **Bäst:**
```
I Button.jsx, onClick-eventet triggas inte.
Jag har verifierat att:
- Knappen renderas korrekt
- Inga fel i konsolen
- handleClick-funktionen anropas aldrig
```

---

## Kontext är kung

=== "Nybörjare"

    Ju mer Claude förstår om ditt projekt, desto bättre hjälp får du.

    **Berätta:**
    - Vad projektet handlar om
    - Vad du försöker åstadkomma
    - Vilka problem du stött på

=== "Standard"

    **Kontexttyper:**

    | Typ | Exempel |
    |-----|---------|
    | Projektkontext | "Det här är en e-handelsapp" |
    | Teknisk kontext | "Vi använder React och TypeScript" |
    | Problemkontext | "Användare rapporterar långsam laddning" |
    | Begränsningar | "Måste fungera i IE11" |

=== "Djupdykning"

    Använd `CLAUDE.md` för att ge persistent kontext:

    ```markdown
    # Projekt: Receptappen

    ## Stack
    - Frontend: React 18 + TypeScript
    - Backend: Node.js + Express
    - Databas: PostgreSQL

    ## Konventioner
    - Använd funktionella komponenter
    - Namnge filer med kebab-case
    - Skriv tester för all affärslogik
    ```

---

## Iterativ utveckling

Det bästa med vibe-kodning är att du kan bygga upp komplexitet stegvis:

```
1. "Skapa en enkel räknare-komponent"
   → Claude skapar grundversionen

2. "Lägg till möjlighet att multiplicera och dividera"
   → Claude utökar funktionaliteten

3. "Lägg till historik som visar senaste beräkningarna"
   → Claude lägger till ny feature

4. "Styla den så den ser ut som en riktig miniräknare"
   → Claude lägger till CSS
```

---

## När Claude missförstår

=== "Nybörjare"

    Det händer att Claude gör något annat än vad du menade. Det är helt normalt!

    **Prova:**
    - Förklara på ett annat sätt
    - Var mer specifik
    - Ge ett exempel på vad du menar
    - Peka på exakt var i koden problemet är

=== "Standard"

    **Strategier för omformulering:**

    ```
    # Förtydliga
    "Nej, jag menade [förtydligande]"

    # Referera konkret
    "Titta på rad 45-50 i app.js, det är där problemet är"

    # Ge exempel
    "Jag vill att output ska se ut så här: [exempel]"

    # Begränsa scope
    "Ändra bara funktionen X, rör inte resten"
    ```

=== "Djupdykning"

    Om Claude konsekvent missförstår, överväg:

    - **Kontextförorening** - Använd `/clear` för att börja om
    - **Motstridiga instruktioner** - Granska tidigare prompts
    - **Otillräcklig kontext** - Referera explicit till relevanta filer

---

## Nästa steg

Nu är du redo att lära dig om [Git och versionshantering](../04-git/vad-ar-git.md)!
