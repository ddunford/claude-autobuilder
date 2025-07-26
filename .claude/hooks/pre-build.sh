#!/bin/bash
set -e

echo "🔄 Running pre-build hooks..."

# Ensure all required directories exist
mkdir -p src specs build/temp

# Clean up temporary files
rm -rf build/temp/*

# Ensure MCPs are installed
if [ ! -f .claude/.flags/all_mcps.installed ]; then
    echo "🔧 Installing required MCPs..."
    ./setup-mcp.sh
    touch .claude/.flags/all_mcps.installed
fi

# Validate environment
if [ ! -d "src" ]; then
    echo "❌ Error: src directory not found"
    exit 1
fi

echo "✅ Pre-build hooks completed" 