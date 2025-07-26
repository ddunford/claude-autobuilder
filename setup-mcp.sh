#!/bin/bash
set -e
echo "🔌 Installing MCP agents..."
claude mcp add context7 npx @context7/mcp@latest
claude mcp add playwright npx @playwright/mcp@latest
echo "✅ MCP setup complete."
