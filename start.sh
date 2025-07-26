#!/bin/bash
set -e

# Function to display help message
show_help() {
    echo "Usage: ./start.sh [options] [prompt]"
    echo ""
    echo "Options:"
    echo "  -h, --help     Show this help message"
    echo "  -s, --specs    Use existing specs from ./specs directory"
    echo "  -f, --force    Force reinstall of MCPs"
    echo ""
    echo "Examples:"
    echo "  ./start.sh \"Build a REST API for a blog\""
    echo "  ./start.sh -s  # Use existing specs"
}

# Parse command line arguments
FORCE=false
USE_SPECS=false
PROMPT=""

while [[ $# -gt 0 ]]; do
    case $1 in
        -h|--help)
            show_help
            exit 0
            ;;
        -s|--specs)
            USE_SPECS=true
            shift
            ;;
        -f|--force)
            FORCE=true
            shift
            ;;
        *)
            PROMPT="$1"
            shift
            ;;
    esac
done

# Function to run Claude agent
run_agent() {
    local agent_name=$1
    echo "🤖 Running $agent_name..."
    claude run .claude/agents/$agent_name.cl
    if [ $? -ne 0 ]; then
        echo "❌ $agent_name failed"
        exit 1
    fi
}

# Main execution
main() {
    # Run pre-build hooks
    source .claude/hooks/pre-build.sh

    if [ "$FORCE" = true ]; then
        echo "🔄 Force reinstalling MCPs..."
        rm -f .claude/.flags/all_mcps.installed
        ./setup-mcp.sh
        touch .claude/.flags/all_mcps.installed
    fi

    if [ -n "$PROMPT" ]; then
        echo "🤔 Processing prompt: $PROMPT"
        echo "$PROMPT" > build/temp/current_prompt.txt
        
        # Run agents in sequence
        run_agent "planner"
        run_agent "architect"
        
    elif [ "$USE_SPECS" = true ] || [ -d "./specs" ]; then
        if [ ! -d "./specs" ] || [ ! "$(ls -A ./specs)" ]; then
            echo "❌ Error: No specs found in ./specs directory"
            exit 1
        fi
        echo "📋 Using existing specs from ./specs"
    else
        echo "❌ Error: No prompt provided and no specs found"
        show_help
        exit 1
    fi

    # Run builder and tester agents
    run_agent "builder"
    run_agent "tester"

    # Run post-build hooks
    source .claude/hooks/post-build.sh

    echo "✅ Build process completed successfully!"
}

main
