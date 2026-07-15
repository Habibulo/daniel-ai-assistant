---
expertise: fly-io-webhook-deploy
category: cloud
source: ielts-bot
verified: true
date: 2026-04-30
---

# Fly.io Deployment for Webhook Services

Deployed a Node.js Telegram bot on Fly.io free tier with webhook mode + persistent SQLite volume.

## Why webhook (not polling) on Fly

Fly's `auto_stop_machines='stop'` + `min_machines_running=0` is the free-tier sweet spot — but it requires an HTTP service. A polling bot has no incoming HTTP traffic, so the machine gets stopped and the bot dies. Switching to webhook makes the URL meaningful: Telegram pushes updates → Fly auto-starts the machine on each request → bot wakes up and replies.

## Working `fly.toml` shape

```toml
[env]
  WEBHOOK_DOMAIN = 'app-name.fly.dev'
  DB_PATH = '/data/ielts-bot.db'
  PORT = '3000'

[[mounts]]
  source = 'data'
  destination = '/data'

[http_service]
  internal_port = 3000
  auto_stop_machines = 'stop'
  auto_start_machines = true
  min_machines_running = 0
```

## Secrets management

- `fly secrets set NAME=value` — encrypted, injected as env var
- `fly secrets list` — verify before deploy
- Never commit secrets. `.env` excluded via `.dockerignore`.

## SQLite persistence on Fly

- App working dir (`/app`) is ephemeral — lost on restart
- Mount a volume at `/data` and configure DB_PATH=/data/<file>.db
- `better-sqlite3` writes here cleanly with WAL mode (`pragma journal_mode = WAL`)

## Auto-generated Dockerfile gotchas (from `fly launch`)

- Sets `DATABASE_URL` env var that some apps don't use — harmless
- Native deps (better-sqlite3) need `build-essential node-gyp pkg-config python-is-python3` at build stage — auto-Dockerfile handles this
- Dockerfile uses `npm ci` from package-lock — keep lockfile committed

## Diagnostic patterns

- Deploy fails / machine restarts in loop: `fly logs` shows reason. Common causes:
  1. Missing required env var (app exits with code 1)
  2. Port mismatch — app must bind `0.0.0.0:3000`, not `127.0.0.1`
  3. Native module load fail (rebuild needed)
- Machine reaches "max restart count of 10" → root cause is in the FIRST few log lines
- "Proxy not finding machines to route requests" / "Suspended" → machine auto-stopped; either fix HTTP service or ensure traffic source can wake it
