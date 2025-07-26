#!/bin/bash
set -e
echo "🧠 Starting AutoBuilder Workflow"
./setup-mcp.sh
if ls specs/*.md &>/dev/null; then
  echo "📚 Specs found. Starting from specs..."
  claude -p "Please use the existing specs in the /specs folder to begin writing unit tests."
else
  echo "📝 No specs found. Starting from prompt.txt..."
  claude -p "$(cat prompt.txt)"
fi
