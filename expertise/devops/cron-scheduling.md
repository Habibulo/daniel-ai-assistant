---
expertise: cron-scheduling
category: devops
source: SPOMARU
verified: true
---

# Cron Job Scheduling with node-schedule

## Implementation

- **Library:** node-schedule 2.1.1
- **Location:** src/schedule/schedule.js
- **Registered:** During server initialization (before Koa app starts)

## Daily Schedule Logger (23:50)

1. Trigger at 23:50 daily
2. Scan Redis for all `pl_schedule:*` keys (incomplete schedules)
3. Group by player_id
4. Calculate completion percentage
5. Insert `schedule_log` to MySQL with status: COMPLETE (100%) or TIME_OVER (<100%)
6. Redis keys auto-expire at 23:59:59 — clean slate for next day

## Design Decision

Run at 23:50 (not midnight) to persist data before Redis TTL expires at 23:59:59. 10-minute buffer ensures all data is captured.
