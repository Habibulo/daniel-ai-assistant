#!/bin/bash
# Daniel-AI — One-command setup (Linux/Mac)
# Usage: git clone <repo> && cd ai_daniel && bash setup.sh

set -e

CLAUDE_DIR="$HOME/.claude"
CLAUDE_MD="$CLAUDE_DIR/CLAUDE.md"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

mkdir -p "$CLAUDE_DIR"

# Symlink CLAUDE.md to global Claude config
if [ -f "$CLAUDE_MD" ]; then
    echo "Backing up existing CLAUDE.md to CLAUDE.md.bak"
    cp "$CLAUDE_MD" "$CLAUDE_MD.bak"
fi

ln -sf "$SCRIPT_DIR/CLAUDE.md" "$CLAUDE_MD"

echo "Daniel-AI installed."
echo "CLAUDE.md linked: $CLAUDE_MD -> $SCRIPT_DIR/CLAUDE.md"
echo ""
echo "Open any project. Start Claude. Daniel-AI is active."
