#!/bin/bash
set -e
echo "🔌 Installing MCP agents..."

mkdir -p .claude/.flags

# context7
if [ ! -f .claude/.flags/context7.installed ]; then
  claude mcp add context7 npx @context7/mcp@latest && touch .claude/.flags/context7.installed
else
  echo "🔁 MCP context7 already configured (use --force to reinstall)"
fi

# playwright
if [ ! -f .claude/.flags/playwright.installed ]; then
  claude mcp add playwright npx @playwright/mcp@latest && touch .claude/.flags/playwright.installed
else
  echo "🎭 MCP playwright already configured (use --force to reinstall)"
fi

echo "✅ MCP setup complete."

# memory
if [ ! -f .claude/.flags/memory.installed ]; then
  claude mcp add memory npx @context7/memory-mcp@latest && touch .claude/.flags/memory.installed
else
  echo "🔁 MCP memory already configured (use --force to reinstall)"
fi

# fetch
if [ ! -f .claude/.flags/fetch.installed ]; then
  claude mcp add fetch npx @context7/http-mcp@latest && touch .claude/.flags/fetch.installed
else
  echo "🔁 MCP fetch already configured (use --force to reinstall)"
fi

# editor
if [ ! -f .claude/.flags/editor.installed ]; then
  claude mcp add editor npx @context7/editor-mcp@latest && touch .claude/.flags/editor.installed
else
  echo "🔁 MCP editor already configured (use --force to reinstall)"
fi

# sql
if [ ! -f .claude/.flags/sql.installed ]; then
  claude mcp add sql npx @context7/sql-mcp@latest && touch .claude/.flags/sql.installed
else
  echo "🔁 MCP sql already configured (use --force to reinstall)"
fi

# jest
if [ ! -f .claude/.flags/jest.installed ]; then
  claude mcp add jest npx @context7/jest-mcp@latest && touch .claude/.flags/jest.installed
else
  echo "🔁 MCP jest already configured (use --force to reinstall)"
fi

# task
if [ ! -f .claude/.flags/task.installed ]; then
  claude mcp add task npx @context7/task-mcp@latest && touch .claude/.flags/task.installed
else
  echo "🔁 MCP task already configured (use --force to reinstall)"
fi
