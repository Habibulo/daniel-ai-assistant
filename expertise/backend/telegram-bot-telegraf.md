---
expertise: telegram-bot-telegraf
category: backend
source: ielts-bot
verified: true
date: 2026-04-30
---

# Telegram Bot Development with Telegraf (Node.js)

Built a production Telegram bot using Telegraf 4.x in ESM Node.js.

## Concrete capabilities

- Bot creation flow via @BotFather: token, command list, description
- Telegraf instance setup with command handlers (`/start`, `/help`, `/part1`, etc.)
- Voice message handling: `bot.on('voice', ...)` → fileId → `ctx.telegram.getFileLink()` → fetch + save
- Telegram delivers voice notes as OGG/Opus with `.oga` extension; some downstream APIs (Groq) reject `.oga` and require `.ogg` — fix by saving with `.ogg` extension regardless of source
- Markdown formatting with `ctx.replyWithMarkdown()` for structured responses
- Per-user session state via in-memory `Map<userId, sessionData>` for question context
- Graceful shutdown with `process.once('SIGINT'/'SIGTERM', () => bot.stop(...))`
- Error containment: `bot.catch(err => ...)` for top-level handler

## Two run modes

- **Polling** (`bot.launch()`): bot connects out to Telegram. Best for local dev. No HTTP server.
- **Webhook** (`bot.launch({ webhook: { domain, hookPath, port } })`): bot serves HTTP, Telegram pushes updates. Best for cloud deploy. Required when behind serverless / auto-stop platforms.
- Critical: only ONE consumer per bot allowed. Running polling locally and webhook in cloud at the same time → races, dropped messages.

## Pitfalls

- File extension rejection by APIs: rename `.oga` → `.ogg` before forwarding
- Webhook secret in URL path, not header — keep it secret like an API key
- Auto-stop platforms (Fly.io) kill polling bots since they have no HTTP traffic
