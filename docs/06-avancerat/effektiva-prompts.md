# Effektiva prompts

Lär dig skriva prompts som ger bättre resultat.

---

## Prompt engineering-principer

=== "Nybörjare"

    Hur du skriver din fråga påverkar svaret. Några grundregler:

    1. **Var specifik** - "Blå knapp" istället för "fin knapp"
    2. **Ge kontext** - Berätta vad projektet handlar om
    3. **Ett steg i taget** - Bygg upp komplexitet gradvis

=== "Standard"

    **Effektiva promptmönster:**

    - **Rollbaserad**: "Du är en expert på..."
    - **Exempel-driven**: "Som i detta exempel: ..."
    - **Stegvis**: "Först X, sedan Y, till slut Z"
    - **Begränsande**: "Använd endast... / Utan att..."

=== "Djupdykning"

    **Avancerade tekniker:**

    - **Chain-of-thought**: Be Claude resonera stegvis
    - **Few-shot learning**: Ge exempel på önskat format
    - **Self-consistency**: Be om flera alternativ och jämför
    - **Tree of thoughts**: Utforska olika lösningsvägar

---

## Promptmallar

### Skapa kod

```
Jag behöver [typ av kod] som gör [funktionalitet].

Kontext:
- Projekt: [beskrivning]
- Teknologi: [språk/ramverk]
- Befintlig kod: [relevant information]

Krav:
- [krav 1]
- [krav 2]
```

### Felsöka

```
Jag får följande fel: [felmeddelande]

Det händer när: [beskrivning av situation]

Relevant kod:
[klistra in kod]

Vad jag har försökt:
- [försök 1]
- [försök 2]
```

### Förklara

```
Förklara denna kod rad för rad:
[kod]

Målgrupp: [nybörjare/erfaren]
```

---

## Iterera

Första försöket behöver inte vara perfekt:

```
1. "Skapa en funktion för att validera email"
   → Claude skapar grundversion

2. "Lägg till stöd för internationella domäner"
   → Claude utökar

3. "Lägg till tydliga felmeddelanden på svenska"
   → Claude förbättrar
```

---

## Vanliga misstag

!!! warning "För vagt"

    ❌ "Fixa det"

    ✅ "I funktionen calculateTotal på rad 45, korrigera beräkningen så att moms (25%) läggs till"

!!! warning "För mycket på en gång"

    ❌ "Skapa en komplett e-handelsplattform"

    ✅ "Skapa en produktlista-komponent som visar namn, bild och pris"

---

## Speciella instruktioner

Du kan ge Claude specifika instruktioner:

```
Visa mig ändringarna innan du gör dem.
```

```
Förklara varje steg du tar.
```

```
Skriv inte kod ännu - låt oss först diskutera approachen.
```
