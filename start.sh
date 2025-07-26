#!/bin/bash
set -e

echo "🧠 Starting Claude AutoBuilder workflow..."

# Ensure setup-mcp.sh is run
./setup-mcp.sh

echo "🚀 Running Claude with initial prompt..."
claude chat --tool StartPrompt
