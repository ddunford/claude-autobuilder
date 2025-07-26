#!/bin/bash
set -e

echo "🔄 Running post-build hooks..."

# Clean up temporary files
if [ -d "build/temp" ]; then
    echo "🧹 Cleaning up temporary files..."
    rm -rf build/temp/*
fi

# Run final validation
echo "🔍 Running final validation..."

# Check if src directory contains files
if [ ! "$(ls -A src)" ]; then
    echo "❌ Error: No files generated in src directory"
    exit 1
fi

# Check if tests were generated
if [ ! -d "src/tests" ] || [ ! "$(ls -A src/tests)" ]; then
    echo "⚠️ Warning: No tests were generated"
fi

# Check for Docker/container files
if [ ! -f "src/Dockerfile" ] && [ ! -f "src/docker-compose.yml" ]; then
    echo "⚠️ Warning: No container configuration files found"
fi

echo "✅ Post-build hooks completed" 