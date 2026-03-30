# Suggested Skills for Review

Review each suggestion. To approve: create the skill file in the appropriate `skills/` subdirectory and update `skills/INDEX.md`. Then delete the entry here.

---

## Pending Suggestions

### 1. WebSocket Real-Time Communication
- **Category:** architecture
- **Reason:** ws + koa-websocket are dependencies in SPOMARU. Skill for building real-time features (live score updates, multiplayer sync).
- **Status:** REVIEW — verify if WebSocket is actively used or only a dependency.

### 2. Docker Containerization
- **Category:** devops
- **Reason:** Natural next step for SPOMARU deployment. Containerize Node.js app + MySQL + Redis with docker-compose.
- **Status:** REVIEW — not yet implemented in SPOMARU, but high-value portable skill.

### 3. API Rate Limiting
- **Category:** security
- **Reason:** SPOMARU currently has no rate limiting. Adding koa-ratelimit would protect against brute-force on auth endpoints.
- **Status:** REVIEW — recommended security improvement.

### 4. Database Migration Strategy
- **Category:** database
- **Reason:** SPOMARU uses TypeORM synchronize:true (auto-creates tables). Production should use migration files for controlled schema changes.
- **Status:** REVIEW — best practice not yet adopted.

### 5. Input Validation Library
- **Category:** backend
- **Reason:** SPOMARU does manual param checking. A validation library (joi, zod) would standardize input validation across 150+ endpoints.
- **Status:** REVIEW — recommended code quality improvement.

### 6. API Versioning
- **Category:** architecture
- **Reason:** Current routes use `/api/` prefix with no version. Adding `/api/v1/` enables backward-compatible API evolution.
- **Status:** REVIEW — recommended for long-term API stability.

### 7. Structured Logging with Correlation IDs
- **Category:** workflow
- **Reason:** Winston logs exist but lack request correlation. Adding request ID per log entry enables tracing a single request through all layers.
- **Status:** REVIEW — recommended observability improvement.

### 8. Unit Testing Patterns
- **Category:** workflow
- **Reason:** Jest is configured in SPOMARU. Document patterns for testing services independently of controllers and databases.
- **Status:** REVIEW — verify existing test coverage first.

---

## How to Approve

1. Create `skills/{category}/{skill-name}.md` with proper frontmatter
2. Add entry to `skills/INDEX.md`
3. Delete the suggestion from this file
