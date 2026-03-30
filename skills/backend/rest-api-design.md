---
skill: rest-api-design
category: backend
source: SPOMARU
verified: true
---

# RESTful API Design

## Response Format

Every endpoint returns the same structure:

```json
{ "code": 200, "message": null, "data": { ... } }
{ "code": 1002, "message": "Required parameter missing", "data": "" }
```

- `code` 200 = success. Custom codes (1001-1013) for domain errors.
- `message` = null on success, descriptive string on error.
- `data` = payload on success, empty string on error.

## URL Conventions

- Base: `/api/{resource}/{action}`
- Examples: `/api/player/create`, `/api/content/info/all`, `/api/player/stats/add`
- Use POST for creates, GET for reads, PUT for updates, DELETE for deletes.

## Auth Headers

- User JWT: `codereach-x-token` (custom header)
- Admin JWT: `codereach-admin-x-token` (separate header, separate secret)

## Patterns

- Validate required params first → return error 1002 if missing
- Call service layer → never access DB from controller
- Wrap response with `Result.success(ctx, data)` or `Result.error(ctx, code, msg)`
- Every controller method in try-catch → log error via Winston → return formatted error
