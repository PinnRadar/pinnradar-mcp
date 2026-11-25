# PinnRadar MCP server

[![PinnRadar MCP connector](https://glama.ai/mcp/connectors/com.pinnradar.mcp/pinn-radar-odds/badges/score.svg)](https://glama.ai/mcp/connectors/com.pinnradar.mcp/pinn-radar-odds)

Pinnacle odds for AI assistants. Connect Claude, Cursor, VS Code or Codex to one URL and ask in plain words: what's live, where a total sits, which prices just dropped.

- **Endpoint:** `https://mcp.pinnradar.com/mcp` (remote, Streamable HTTP)
- **Auth:** OAuth 2.1 (claude.ai and other OAuth clients), or `Authorization: Bearer <your PinnRadar API key>`
- **Free key:** sign up with an email at [pinnradar.com/panel](https://pinnradar.com/panel)
- **Docs:** [pinnradar.com/mcp](https://pinnradar.com/mcp) · [API reference](https://pinnradar.com/docs)

This repository holds the client setup and the MCP Registry entry (`com.pinnradar/odds`). The server itself is hosted by PinnRadar; there is nothing to install or run.

## Tools

| Tool | What it does | Cost |
|---|---|---|
| `board_sports` | Sports and their ids | free |
| `find_matches` | In-play or upcoming matches in one sport, filterable by team or league words | 1 request |
| `match_prices` | Moneylines, handicaps, over/unders and team totals for one match | 1 request |
| `upcoming_lines` | Every alternate line of one prematch market | 1 request |
| `price_moves` | Recent sharp price drops, live or prematch, filtered by sport, market, period, size or age (up to 3 hours back) | 1 request |
| `feed_health` | Feed status and how current the data is | 1 request |
| `my_usage` | Your plan, limits, expiry and today's request count | 1 request |
| `search_pinnradar_docs` | Answers about the API from its own reference | free |

All tools are read-only. Calls count against your key's plan like any REST call.

## Example questions

- "Which Pinnacle odds are dropping right now?"
- "Biggest prematch line moves in soccer in the last hour"
- "What are Pinnacle's odds for Arsenal v Chelsea?"
- "Totals for tonight's NBA games"
- "Which tennis matches are live right now?"

## Setup

Replace `PASTE_KEY_HERE` with your own key, or keep the key in an environment variable as shown. Ready-made files are in [`examples/`](examples).

### Claude Code

```bash
claude mcp add -t http \
  -H "Authorization: Bearer $PINNRADAR_KEY" \
  pinnradar https://mcp.pinnradar.com/mcp
```

### claude.ai and Claude Desktop

Settings → Connectors → Add custom connector → `https://mcp.pinnradar.com/mcp`. You'll be sent to PinnRadar's sign-in page to paste your key once.

### Cursor (`.cursor/mcp.json`)

```json
{
  "mcpServers": {
    "pinnradar": {
      "url": "https://mcp.pinnradar.com/mcp",
      "headers": { "Authorization": "Bearer PASTE_KEY_HERE" }
    }
  }
}
```

### VS Code (`.vscode/mcp.json`)

```json
{
  "inputs": [
    { "id": "radar-key", "type": "promptString", "description": "Your PinnRadar key", "password": true }
  ],
  "servers": {
    "pinnradar": {
      "type": "http",
      "url": "https://mcp.pinnradar.com/mcp",
      "headers": { "Authorization": "Bearer ${input:radar-key}" }
    }
  }
}
```

### Codex CLI (`~/.codex/config.toml`)

```toml
[mcp_servers.pinnradar]
url = "https://mcp.pinnradar.com/mcp"
bearer_token_env_var = "PINNRADAR_KEY"
```

## About

PinnRadar sells odds data. It takes no bets, gives no picks and is not affiliated with Pinnacle.

Support: [@PinnRadarSupport](https://t.me/PinnRadarSupport) on Telegram or info@pinnradar.com.

## License

MIT for the files in this repository.
