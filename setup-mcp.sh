#!/bin/bash
set -e

echo "📦 Installing required MCP agents..."

# Ensure Claude CLI is available
if ! command -v claude &> /dev/null; then
  echo "❌ Claude CLI is not installed. Run: npm install -g claude-code"
  exit 1
fi

# Add context7 MCP with explicit command
if ! claude mcp list | grep -q "context7"; then
  echo "🔌 Adding context7 MCP..."
  claude mcp add context7 npx '@context7/mcp@latest'
fi

# Add Playwright MCP with explicit command
if ! claude mcp list | grep -q "playwright"; then
  echo "🎭 Adding Playwright MCP..."
  claude mcp add playwright npx '@playwright/mcp@latest'
fi

echo "✅ MCP setup complete."
