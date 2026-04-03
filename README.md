# Daniel-AI

Personalized engineering assistant for Daniel (Khabibullo Khalimjonov). Tracks expertise, builds resume entries, and customizes AI behavior across all projects.

This is the **personal identity layer** — who Daniel is, what he knows, how the AI should work for him. For reusable AI skills (git push, code review, etc.), see [Habibulo/prompt](https://github.com/Habibulo/prompt).

## Quick Setup

**Windows:**
```bash
git clone https://github.com/Habibulo/daniel-ai-assistant.git ai_daniel
cd ai_daniel
setup.bat
```

**macOS/Linux:**
```bash
git clone https://github.com/Habibulo/daniel-ai-assistant.git ai_daniel
cd ai_daniel
bash setup.sh
```

See [user-guide.md](user-guide.md) for detailed installation on any machine.

## What It Does

- Greets Daniel by name with engineering humor
- Plans before coding — asks questions, organizes step-by-step, gets approval first
- Tracks verified expertise after every task
- Builds resume-worthy accomplishments automatically
- Responds to: Daniel-AI, ai-daniel, hey claude, hey gpt — all work

## Short Commands

| Command | Action |
|---------|--------|
| `scan` | Review session, propose new expertise |
| `expertise` | Show expertise index |
| `resume` | Show resume tracker |
| `plan` | Organize before executing |
| `go` | Execute the current plan |
| `save` | Save proposed expertise entries |
| `push` | Git add, commit, push |
| `status` | Show changes and pending items |
| `suggest` | Show pending suggestions |

## Structure

```
ai_daniel/
├── CLAUDE.md              <- Core config (identity, rules, workflow)
├── personality.md         <- Greetings, jokes, tone
├── resume-tracker.md      <- Impact-phrased accomplishments
├── setup.sh / setup.bat   <- Installers
├── expertise/             <- Daniel's verified knowledge
│   ├── INDEX.md           <- Master expertise index (32 entries)
│   ├── backend/           <- Node.js, Koa.js, API design
│   ├── database/          <- MySQL, TypeORM, Redis
│   ├── devops/            <- PM2, Docker, CI/CD
│   ├── architecture/      <- System design, auth, middleware
│   ├── security/          <- JWT, hashing, CORS
│   ├── workflow/          <- Git, testing, code review
│   ├── cloud/             <- AWS services
│   └── frontend/          <- React, CSS
└── suggestions/
    └── pending.md         <- Proposed expertise awaiting review
```

## How It Fits Together

```
ai-daniel (this repo)          → WHO Daniel is (personal, private)
Habibulo/prompt                → WHAT AI can do (skills, shareable, cross-platform)
Habibulo/claude-prompt         → Claude Code marketplace (plugins)
```

- **Expertise** = what Daniel knows (tracked here, resume-ready)
- **AI Skills** = what AI executes (in prompt repo, works on any AI tool)
- These are intentionally separate — different purpose, different audience

## Sync

```bash
cd ai_daniel
git add -A && git commit -m "update expertise" && git push
```

New machine: clone + run setup. Done.
