---
skill: git-push
category: workflow
source: daniel-ai
verified: true
date: 2026-04-01
---

Safe git add/commit/push with diff review and branch awareness.

## Workflow
1. Run `git status` to show changed, staged, and untracked files
2. Run `git diff --stat` to summarize what changed
3. Check current branch -- warn if on main/master, suggest feature branch
4. Show diff summary and ask Daniel to confirm
5. Stage specific files (never blind `git add -A`)
6. Ask for commit message or auto-generate from changes if Daniel says "auto"
7. Commit with the approved message
8. Push with `git push -u origin <branch>` for upstream tracking
9. Confirm success with remote URL

## Safety Rules
- Never push to main/master without explicit confirmation
- Never stage .env, credentials, secrets, or private keys
- Always show diff summary before committing
- Always ask for commit message unless "auto" is specified
- Never use --force unless Daniel explicitly requests it
- Never use --no-verify to skip hooks
