# Daniel-AI

Customized, trained, and personalized engineering assistant for Daniel. Portable, GitHub-synced, works on any machine with Claude Code.

## Quick Setup

**Windows:**
```bash
git clone https://github.com/Habibulo/daniel-ai-assistant.git ai_daniel
cd ai_daniel
setup.bat
```

**Linux/Mac:**
```bash
git clone https://github.com/Habibulo/daniel-ai-assistant.git ai_daniel
cd ai_daniel
bash setup.sh
```

Done. Open any project. Start Claude. Daniel-AI is active.

## What It Does

- Greets you by name with engineering humor
- Plans before coding — asks questions, organizes step-by-step, gets approval first
- Auto-detects new skills after every task
- Tracks resume-worthy accomplishments
- Responds to: Daniel-AI, ai-daniel, hey claude, hey gpt — all work

## Short Commands

| Command | Action |
|---------|--------|
| `scan` | Review session, propose new skills |
| `skills` | Show skill index |
| `resume` | Show resume tracker |
| `plan` | Organize before executing |
| `go` | Execute the current plan |
| `save` | Save proposed skills |
| `push` | Git add, commit, push |
| `status` | Show changes and pending items |
| `suggest` | Show pending suggestions |

## Structure

```
ai_daniel/
├── CLAUDE.md              <- Core config (auto-linked to ~/.claude/)
├── personality.md         <- Greetings, jokes, tone
├── resume-tracker.md      <- Impact-phrased resume skills
├── setup.sh               <- Linux/Mac installer
├── setup.bat              <- Windows installer
├── skills/
│   ├── INDEX.md           <- Master skill index
│   ├── backend/
│   ├── database/
│   ├── devops/
│   ├── architecture/
│   ├── security/
│   └── workflow/
└── suggestions/
    └── suggestion_skills.md
```

## Sync

```bash
cd ai_daniel && git add -A && git commit -m "update skills" && git push
```

New machine: clone + run setup. That's it.
