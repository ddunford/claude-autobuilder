#!/bin/bash
set -e

echo "📦 Installing required MCP agents..."

# Ensure claude CLI is available
if ! command -v claude &> /dev/null; then
  echo "❌ Claude CLI is not installed. Run: npm install -g claude-code"
  exit 1
fi

# Add context7 MCP if not already present
echo "🔌 Adding context7 MCP..."
claude mcp add context7

# Add playwright MCP
echo "🎭 Adding Playwright MCP..."
claude mcp add playwright npx '@playwright/mcp@latest'

echo "✅ MCP setup complete."
