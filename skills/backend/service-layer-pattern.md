---
skill: service-layer-pattern
category: backend
source: SPOMARU
verified: true
---

# Controller → Service → Repository Pattern

## Layer Rules

| Layer | Responsibility | Does NOT do |
|-------|---------------|-------------|
| Controller | HTTP req/res, input validation, response formatting | Database queries, business logic |
| Service | Business logic, data transformation, transactions | Set HTTP status, access ctx directly |
| Entity/Repo | Schema definitions, TypeORM repository operations | Business rules, validation |

## Flow

```
Router → Controller.method(ctx)
  → validate ctx.request.body
  → service.doThing(params)
    → dataSource.getRepository(Entity)
    → repository.find/save/update
    → return raw data
  → Result.success(ctx, data)
```

## Convention

- 1 controller per domain (14 total: auth, player, content, admin, etc.)
- 1 service per controller (15 total: extra redis.js and spomaru.js)
- Services can call other services for cross-domain logic
- Controllers never call other controllers
