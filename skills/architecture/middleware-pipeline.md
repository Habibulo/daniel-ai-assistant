---
skill: middleware-pipeline
category: architecture
source: SPOMARU
verified: true
---

# Koa.js Middleware Pipeline Design

## Execution Order

```
CORS → Compression → Body Parser → Server State Check → Router → Static Files
```

## Each Stage

1. **CORS** — Allow cross-origin from multiple launcher platforms
2. **Compression** — gzip/deflate negotiation, reduces payload size for content-heavy responses
3. **Body Parser** — JSON/form/multipart parsing, 100MB limit
4. **Server State** — Redis lookup for maintenance mode, blocks non-admin if MAINTENANCE (error 1010)
5. **Router** — URL pattern match to controller handler (150+ routes)
6. **Static** — Serve /images directory

## Engineering Decision

Server state middleware reads Redis on every request. This enables instant maintenance mode toggle via admin API — no server restart required. Cost: one Redis GET per request (sub-millisecond).
