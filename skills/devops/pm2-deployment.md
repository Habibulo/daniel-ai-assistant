---
skill: pm2-deployment
category: devops
source: SPOMARU
verified: true
---

# PM2 Process Management

## Configuration

- **File:** ecosystem.config.js
- **Environments:** local, development, production (separate app definitions)
- **Entry point:** src/app.js
- **Instances:** 1 per environment

## Features Used

- Auto-restart on crash
- Watch mode in development (restart on file change)
- Environment variable injection via env_* blocks
- Process naming for monitoring (launcher-local, launcher-dev, launcher-prod)

## Commands

```bash
pm2 start ecosystem.config.js --env local
pm2 start ecosystem.config.js --env development
pm2 start ecosystem.config.js --env production
pm2 logs launcher-prod
pm2 restart launcher-prod
```
