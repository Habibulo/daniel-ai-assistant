---
expertise: error-handling
category: workflow
source: SPOMARU
verified: true
---

# Error Handling with Custom Error Codes

## Pattern

- Every controller method wrapped in try-catch
- Catch block: log via Winston → return `Result.error(ctx, code, message)`
- Custom error codes (1001-1013) for domain-specific errors
- HTTP 200 for all responses — error state conveyed via `code` field in JSON body

## Error Code Registry

| Code | Name | Meaning |
|------|------|---------|
| 1001 | ALREADY_EXISTS | Duplicate resource |
| 1002 | PARAMS_EMPTY | Missing required parameter |
| 1003 | NO_DATA | Resource not found |
| 1004 | INVALID_EMAIL | Email format failed |
| 1005 | AUTH_FAILED | Token invalid/expired |
| 1006 | ADMIN_NOT_FOUND | Admin ID not found |
| 1007 | ADMIN_AUTH_FAILED | Wrong password |
| 1008 | REFRESH_EXPIRED | Refresh token expired |
| 1009 | SCHEDULE_EXISTS | Duplicate daily schedule |
| 1010 | SERVER_IN_MAINTENANCE | Maintenance mode |
| 1011 | INVALID_MAC | Bad MAC address |
| 1012 | NO_SCHEDULE | No active schedule |
| 1013 | INVALID_PLAYER | Player ID not found |

## Logging

- Winston logger: console + `combined.log` file
- All errors logged with timestamp and context before client response
