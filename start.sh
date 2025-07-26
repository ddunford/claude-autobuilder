#!/bin/bash
set -e

echo "🧠 Starting Claude AutoBuilder workflow..."

# Ensure MCPs are installed
./setup-mcp.sh

echo "🔍 Checking for existing specs..."
if [ -d "specs" ] && [ "$(ls -A specs/*.md 2>/dev/null)" ]; then
  echo "📚 Found existing specs. Skipping spec generation."
  echo "⚙️  Starting with test-writer-agent..."
  claude chat --agent test-writer-agent --files specs
else
  echo "📝 No specs found. Using prompt.txt to generate plan and specs..."
  claude chat --agent planner-agent --files prompt.txt
fi
