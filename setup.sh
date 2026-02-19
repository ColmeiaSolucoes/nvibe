#!/bin/bash
# nvibe - Setup Script
# Installs nvibe and its dependencies

set -e

echo "Installing nvibe..."

# 1. Install nvibe skill (if not already in ~/.claude/skills/nvibe)
SKILL_DIR="$HOME/.claude/skills/nvibe"
if [ ! -f "$SKILL_DIR/SKILL.md" ]; then
  echo "  Cloning nvibe..."
  git clone https://github.com/ColmeiaSolucoes/nvibe.git "$SKILL_DIR"
else
  echo "  nvibe already installed, updating..."
  cd "$SKILL_DIR" && git pull
fi

# 2. Install brainstorming dependency (from obra/superpowers)
echo "  Installing brainstorming skill dependency..."
npx @anthropic-ai/skills add https://github.com/obra/superpowers --skill brainstorming

echo ""
echo "Done! nvibe is ready."
echo "Use /nvibe in Claude Code to start a new feature workflow."
echo ""
echo "Note: codebase-analyzer and web-search-researcher agents are"
echo "built into Claude Code — no extra installation needed."
