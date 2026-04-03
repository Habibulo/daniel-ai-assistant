---
expertise: project-organization
category: workflow
source: daniel-ai
verified: true
date: 2026-04-03
---

Structuring personal AI assistant systems with clear separation between knowledge tracking (expertise) and executable plugin skills. Namespace management to avoid confusion between what the engineer knows vs what the AI tooling can do.

## Key Decisions
- `expertise/` = Daniel's verified knowledge (resume-ready, tracked per project)
- Plugin `skills/` = AI executable commands (slash-invoked, shared via marketplaces)
- Never merge the two — different lifecycle, different audience, different purpose
