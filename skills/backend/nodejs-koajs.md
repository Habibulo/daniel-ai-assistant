---
skill: nodejs-koajs
category: backend
source: SPOMARU
verified: true
---

# Node.js + Koa.js Server Development

## Stack

- **Runtime:** Node.js 20.x LTS
- **Framework:** Koa.js 2.14 (async/await middleware, ctx-based)
- **Router:** @koa/router 12.x
- **Body parsing:** koa-body (JSON, form, multipart, 100MB limit)
- **Compression:** koa-compress (gzip/deflate)
- **Static files:** koa-static

## Server Init Pattern

```
MySQL init (3 DBs) → Redis pool init → Seed defaults → Register cron jobs → Create Koa app → Apply middleware → Listen
```

## Middleware Order

CORS → Compression → Body Parser → Custom State Check → Router → Static Files

## Key Decisions

- Koa over Express: lighter footprint, native async/await, better error propagation via ctx
- Single centralized route file (routes/index.js) for 150+ endpoints
- koa-body with 100MB limit for content metadata uploads
