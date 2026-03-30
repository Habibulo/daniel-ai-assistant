---
skill: redis-caching
category: database
source: SPOMARU
verified: true
---

# Redis Caching Strategies

## Client & Pooling

- **ioredis 5.3.2** — full Redis command set, auto-reconnection
- **generic-pool 3.9** — connection pooling (acquire → execute → release)
- Pooling prevents connection exhaustion under concurrent load

## TTL Patterns

| Use Case | TTL | Rationale |
|----------|-----|-----------|
| JWT tokens | 4-12 hours | Match session duration |
| QR auth codes | 60 seconds | Prevent replay attacks |
| Daily schedules | End-of-day (23:59:59) | Align with exercise cycle |
| Server state | No TTL (persistent) | Only changed by admin action |

## Data Structures Used

- **String:** JWT tokens, server status flag
- **Hash:** QR sessions (token, user_id, status), daily schedules (set_id, content_id, is_complete)

## Key Patterns

```
user:{user_id}:token → JWT string
qr:{code} → hash {token, user_id, status}
pl_schedule:{player_id}:id:{content_id} → hash {set_id, content_id, is_complete}
server_status → "ACTIVE" | "MAINTENANCE"
```

## Cleanup Strategy

- Redis TTL handles garbage collection — no manual cleanup needed
- Cron job at 23:50 persists incomplete schedules to MySQL before keys expire
