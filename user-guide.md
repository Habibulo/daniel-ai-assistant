# User Guide — Daniel-AI Setup on Any Machine

## Prerequisites

- Git installed
- One or more AI tools: Claude Code, RooCode, Cursor, GPT, Codex, etc.

## Step 1: Clone the Repo

```bash
git clone https://github.com/Habibulo/daniel-ai-assistant.git ai_daniel
```

## Step 2: Run Setup

**Windows:**
```bash
cd ai_daniel
setup.bat
```

**macOS/Linux:**
```bash
cd ai_daniel
bash setup.sh
```

The setup script symlinks `CLAUDE.md` to `~/.claude/CLAUDE.md` so Claude Code loads Daniel-AI automatically.

## Step 3: For Other AI Tools

Daniel-AI's `CLAUDE.md` works as a system prompt for any AI tool. Point your tool's config to it:

| AI Tool | Where to put it |
|---------|----------------|
| **Claude Code** | `~/.claude/CLAUDE.md` (auto-linked by setup) |
| **RooCode** | Copy relevant sections to `.roo/` config |
| **Cursor** | Add to `.cursorrules` in your project |
| **GPT (ChatGPT)** | Paste into Custom Instructions or system prompt |
| **Codex** | Add to system prompt configuration |
| **Ollama** | Include as system prompt in your Modelfile |
| **Gemini** | Paste into system instructions |
| **DeepSeek** | Add to system prompt |

The core instructions in `CLAUDE.md` are tool-agnostic. Any AI that reads markdown can use them.

## Step 4: Install AI Skills (Optional)

AI skills (reusable commands like safe-push, code-review) live in a separate repo and work on multiple AI tools via `set-prompt`:

```bash
npm install -g set-prompt
set-prompt install https://github.com/Habibulo/prompt.git
set-prompt link
```

This gives you executable AI skills on whichever tools `set-prompt` supports.

## Keeping It Updated

**Pull latest changes:**
```bash
cd ai_daniel
git pull
```

**After adding new expertise:**
```bash
cd ai_daniel
git add -A && git commit -m "update expertise" && git push
```

Or just type `push` in a Daniel-AI session — it handles the git workflow for you.

## What Each File Does

| File | Purpose |
|------|---------|
| `CLAUDE.md` | Core identity: rules, workflow, commands, expertise system |
| `personality.md` | Greeting style, engineering jokes, tone |
| `resume-tracker.md` | Impact-phrased accomplishments for resume |
| `expertise/INDEX.md` | Master index of all verified expertise |
| `expertise/<category>/` | Individual expertise files per domain |
| `suggestions/pending.md` | Proposed expertise awaiting review |

## Troubleshooting

**Daniel-AI not loading in Claude Code:**
- Check `~/.claude/CLAUDE.md` exists and points to this repo's `CLAUDE.md`
- Re-run `setup.bat` or `setup.sh`

**Expertise not showing:**
- Type `expertise` in a session to see the index
- Check `expertise/INDEX.md` is up to date

**New machine, quick start:**
```bash
git clone https://github.com/Habibulo/daniel-ai-assistant.git ai_daniel
cd ai_daniel && setup.bat   # or bash setup.sh
# Done. Start any AI session.
```
