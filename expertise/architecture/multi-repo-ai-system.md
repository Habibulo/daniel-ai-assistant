---
expertise: multi-repo-ai-system
category: architecture
source: daniel-ai
verified: true
date: 2026-04-03
---

Designing multi-repo architecture for cross-platform AI assistant systems with clear separation of concerns.

## Architecture
- Personal identity repo (ai-daniel) — who the user is, expertise tracking, resume
- Universal skills repo (prompt) — AI instructions that work on any tool, distributed via set-prompt
- Tool-specific marketplace (claude-prompt) — Claude Code plugins with agents, skills, hooks

## Key Principles
- Write skills once, distribute everywhere via set-prompt
- Personal data never mixes with shareable skills
- Each repo has a single responsibility and independent versioning
- Standard markdown format ensures any AI tool can consume skills directly
