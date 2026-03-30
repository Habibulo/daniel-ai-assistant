---
skill: multi-database
category: database
source: SPOMARU
verified: true
---

# Multi-Database Separation by Domain

## Strategy

Separate databases by access pattern and domain:

| Database | Pattern | Content | Rationale |
|----------|---------|---------|-----------|
| crlauncher_data | READ-HEAVY | Content catalog, items, config | Queried frequently, rarely written |
| crlauncher_log | WRITE-HEAVY | Audit trails, payments, activity | Append-only, grows indefinitely, archivable independently |
| crlauncher_user | READ-WRITE | Accounts, players, stats | Most critical, highest backup priority |

## Benefits

- Independent scaling per access pattern
- Independent backup/archive policies (log DB can be archived without affecting user data)
- Security isolation (compromise of log DB doesn't expose user credentials)
- Read replicas can be added to data DB without affecting write-heavy log DB
