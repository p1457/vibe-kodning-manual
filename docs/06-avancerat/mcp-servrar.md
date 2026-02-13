# MCP-servrar: Utöka Claude Codes kapabiliteter

MCP (Model Context Protocol) låter dig ansluta Claude Code till externa system och datakällor.

!!! abstract "Vad du kommer lära dig"
    - Vad MCP är och varför det är användbart
    - Hur du installerar och konfigurerar MCP-servrar
    - Populära MCP-servrar för olika användningsfall
    - Säkerhetsaspekter att tänka på

---

## Vad är MCP?

=== "Nybörjare"

    **MCP** (Model Context Protocol) är ett sätt att ge Claude tillgång till fler saker än bara filer på din dator.

    **Exempel på vad MCP kan ge:**

    - **GitHub** - Läsa issues, PRs och repositories
    - **Databaser** - Köra queries mot PostgreSQL, SQLite
    - **Slack** - Skicka meddelanden och läsa kanaler
    - **Home Assistant** - Direkt kontroll över ditt smarta hem

    Det är som att ge Claude "plugins" för att prata med andra system.

=== "Standard"

    MCP är ett öppet protokoll som definierar hur AI-modeller kommunicerar med externa verktyg och datakällor.

    **Komponenter:**

    | Del | Funktion |
    |-----|----------|
    | **MCP-server** | Program som exponerar verktyg/data |
    | **MCP-klient** | Claude Code (konsumerar servrar) |
    | **Protokoll** | JSON-RPC över stdio/SSE |

    **Fördelar:**
    - Standardiserat gränssnitt
    - Många färdiga servrar finns
    - Säker sandboxning

=== "Djupdykning"

    MCP-specifikationen definierar:

    - **Tools**: Funktioner som modellen kan anropa
    - **Resources**: Data som modellen kan läsa
    - **Prompts**: Fördefinierade instruktioner

    Protokollet använder JSON-RPC 2.0 och kan transporteras via:
    - stdio (lokala processer)
    - SSE (Server-Sent Events för remote)

    ```
    Claude Code <-> MCP Client Library <-> MCP Server <-> External System
    ```

---

## Installera MCP-servrar

### Konfigurationsfil

MCP-servrar konfigureras i `~/.claude/settings.json` (global) eller `.claude/settings.json` (projekt):

```json
{
  "mcpServers": {
    "server-name": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-name"],
      "env": {
        "API_KEY": "your-key-here"
      }
    }
  }
}
```

### Exempel: GitHub-server

```json
{
  "mcpServers": {
    "github": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-github"],
      "env": {
        "GITHUB_PERSONAL_ACCESS_TOKEN": "ghp_xxxx"
      }
    }
  }
}
```

Efter konfiguration, starta om Claude Code.

---

## Populära MCP-servrar

### GitHub

Ger Claude tillgång till repositories, issues och pull requests.

```json
{
  "mcpServers": {
    "github": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-github"],
      "env": {
        "GITHUB_PERSONAL_ACCESS_TOKEN": "ghp_xxxx"
      }
    }
  }
}
```

**Användning:**
```
Visa alla öppna issues i mitt repo
```

```
Skapa en PR med de senaste ändringarna
```

### Filesystem (extra mappar)

Ger Claude tillgång till mappar utanför projektmappen.

```json
{
  "mcpServers": {
    "filesystem": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-filesystem", "/path/to/allowed/folder"]
    }
  }
}
```

### PostgreSQL

Kör queries mot en PostgreSQL-databas.

```json
{
  "mcpServers": {
    "postgres": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-postgres"],
      "env": {
        "DATABASE_URL": "postgresql://user:pass@localhost/db"
      }
    }
  }
}
```

**Användning:**
```
Visa strukturen på tabellen "users"
```

```
Hitta alla orders från senaste veckan
```

### SQLite

Lokal databasåtkomst.

```json
{
  "mcpServers": {
    "sqlite": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-sqlite", "--db-path", "./data.db"]
    }
  }
}
```

### Slack

Läsa och skicka meddelanden.

```json
{
  "mcpServers": {
    "slack": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-slack"],
      "env": {
        "SLACK_BOT_TOKEN": "xoxb-xxxx"
      }
    }
  }
}
```

---

## Domänspecifika servrar

### Home Assistant

Direkt integration med ditt smarta hem:

```json
{
  "mcpServers": {
    "homeassistant": {
      "command": "npx",
      "args": ["-y", "mcp-server-home-assistant"],
      "env": {
        "HA_URL": "http://homeassistant.local:8123",
        "HA_TOKEN": "your-long-lived-access-token"
      }
    }
  }
}
```

**Användning:**
```
Vilka lampor är tända just nu?
```

```
Skapa en automation som tänder köket kl 07:00
```

### Obsidian / Notes

Tillgång till dina anteckningar:

```json
{
  "mcpServers": {
    "obsidian": {
      "command": "npx",
      "args": ["-y", "mcp-server-obsidian"],
      "env": {
        "OBSIDIAN_VAULT_PATH": "/path/to/vault"
      }
    }
  }
}
```

---

## Använda MCP-resurser med @

När MCP-servrar är konfigurerade kan du referera till deras resurser med @-syntax:

```
Analysera @github:repos/owner/repo/issues

Kör @postgres:query "SELECT * FROM users LIMIT 10"

Läs @obsidian:notes/meeting-notes.md
```

Format: `@servernamn:resursväg`

---

## Skapa egna MCP-servrar

=== "Nybörjare"

    Det finns hundratals färdiga MCP-servrar. Sök på:
    - [MCP Server Directory](https://github.com/modelcontextprotocol/servers)
    - npm: `@modelcontextprotocol/server-*`

=== "Standard"

    Vill du skapa en egen? Grundstruktur:

    ```javascript
    import { Server } from "@modelcontextprotocol/sdk/server/index.js";
    import { StdioServerTransport } from "@modelcontextprotocol/sdk/server/stdio.js";

    const server = new Server({
      name: "my-server",
      version: "1.0.0"
    });

    server.setRequestHandler("tools/list", async () => ({
      tools: [{
        name: "my_tool",
        description: "Does something useful",
        inputSchema: { type: "object", properties: {} }
      }]
    }));

    server.setRequestHandler("tools/call", async (request) => {
      // Handle tool calls
    });

    const transport = new StdioServerTransport();
    await server.connect(transport);
    ```

=== "Djupdykning"

    MCP SDK finns för:
    - **TypeScript/JavaScript**: `@modelcontextprotocol/sdk`
    - **Python**: `mcp`
    - **Rust**: `mcp-rust-sdk`

    Servertyper:
    - **Tools**: Funktioner Claude kan anropa
    - **Resources**: Data Claude kan läsa
    - **Prompts**: Fördefinierade instruktioner

    Se [officiell dokumentation](https://modelcontextprotocol.io) för fullständig spec.

---

## Säkerhet

!!! warning "Viktiga säkerhetsaspekter"

    MCP-servrar kan ha stor behörighet. Tänk på:

    1. **Granska servrar** innan installation
    2. **Begränsa behörigheter** - ge bara nödvändig access
    3. **Skydda tokens** - lägg inte API-nycklar i versionshantering
    4. **Använd projektlokal config** för känsliga projekt

### Hantera hemligheter

**Bra:**
```json
{
  "env": {
    "API_KEY": "${MY_API_KEY}"  // Från miljövariabel
  }
}
```

**Dåligt:**
```json
{
  "env": {
    "API_KEY": "sk-abc123..."  // Hårdkodad hemlighet!
  }
}
```

### Begränsa filsystemåtkomst

```json
{
  "mcpServers": {
    "filesystem": {
      "args": ["-y", "@modelcontextprotocol/server-filesystem",
               "/specific/safe/folder"]  // Bara denna mapp
    }
  }
}
```

---

## Felsökning

??? question "MCP-server startar inte"

    1. Kontrollera att kommandot fungerar i terminal:
       ```bash
       npx -y @modelcontextprotocol/server-github
       ```
    2. Verifiera JSON-syntax i settings.json
    3. Kontrollera miljövariabler

??? question "Claude känner inte igen MCP-resurser"

    1. Starta om Claude Code efter konfigurationsändring
    2. Kontrollera serverns namn matchar i @-referensen
    3. Verifiera att servern exponerar resurser (inte bara tools)

??? question "Autentiseringsfel"

    1. Kontrollera att token/nyckel är giltig
    2. Verifiera att miljövariabeln läses korrekt
    3. Testa autentisering manuellt mot tjänsten

---

## Sammanfattning

!!! success "Det viktigaste att ta med sig"
    - **MCP** utökar Claude Codes kapabiliteter till externa system
    - Konfigureras i `settings.json` under `mcpServers`
    - **Populära servrar**: GitHub, PostgreSQL, Filesystem, Slack
    - Använd **@-syntax** för att referera till MCP-resurser
    - **Säkerhet**: Granska servrar, skydda tokens, begränsa behörigheter
    - Många färdiga servrar finns - skapa egna vid behov

---

## Nästa steg

Utforska [effektiva prompts](effektiva-prompts.md) för att få ut mest av Claude Code.
