# Best Practices för Webbappar

Tips för att bygga webbappar med Claude Code.

---

## Börja enkelt

```
# Första iterationen
Skapa en grundläggande version med HTML och minimal CSS.

# Sedan
Nu lägg till styling så det ser snyggt ut.

# Sedan
Lägg till funktionen att filtrera listan.
```

---

## Beskriv designen

```
Skapa en app med:
- Mörkt tema
- Rundade hörn på knappar
- Sans-serif-typsnitt
- Responsiv layout som fungerar på mobil
```

---

## Tänk på mobilen

```
Se till att appen fungerar bra på mobiltelefon.
Knappar ska vara tillräckligt stora för touch.
```

---

## Hantera data

=== "Nybörjare"

    **localStorage** - Sparar data i webbläsaren

    ```
    Spara användarens inställningar i localStorage
    ```

=== "Standard"

    För mer avancerad data, överväg:

    - **IndexedDB** - Större datamängder lokalt
    - **Firebase** - Molndatabas utan server
    - **Supabase** - PostgreSQL i molnet

---

## Säkerhet

!!! warning "Känslig data"

    Lagra aldrig lösenord eller API-nycklar i JavaScript-kod som skickas till webbläsaren.

---

## Struktur för större projekt

```
mitt-projekt/
├── index.html
├── styles/
│   └── main.css
├── scripts/
│   └── app.js
└── assets/
    └── images/
```

---

## Ramverk

För större appar, be Claude använda ett ramverk:

```
Skapa en React-app med Vite som...
```

```
Skapa en Vue 3-app med...
```
