#!/bin/bash
set -e

echo "🧠 Starting Claude AutoBuilder workflow..."

# Check and install MCPs
if ! claude mcp list | grep -q "context7"; then
  echo "🔌 Adding context7 MCP..."
  claude mcp add context7
fi

if ! claude mcp list | grep -q "playwright"; then
  echo "🎭 Adding Playwright MCP..."
  claude mcp add playwright npx '@playwright/mcp@latest'
fi

echo "🚀 Running Claude with initial prompt..."
claude chat --tool StartPrompt
