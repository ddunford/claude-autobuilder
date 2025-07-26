# Claude Agent Swarm

A suite of Claude sub-agents that automate the software development lifecycle, from requirements analysis to testing.

## Features

- 🤖 Multiple specialized agents working together
- 📋 Processes prompts or reads existing specs
- 🏗 Generates complete applications in the `src` directory
- 🧪 Comprehensive testing strategy (unit, integration, E2E)
- 🐳 Docker/container support built-in
- 🔄 Automated MCP installation and management

## Prerequisites

- Node.js 18 or newer
- Claude Code CLI (`npm install -g @anthropic-ai/claude-code`)

## Directory Structure

```
.
├── .claude/              # Claude Code configuration
│   ├── agents/          # Sub-agents
│   ├── hooks/           # Build hooks
│   └── .flags/          # MCP installation flags
├── src/                 # Generated application code
├── specs/               # Project specifications
└── build/              # Build artifacts
    └── temp/           # Temporary files
```

## Usage

1. Start with a prompt:
   ```bash
   ./start.sh "Build a REST API for a blog"
   ```

2. Use existing specs:
   ```bash
   ./start.sh --specs
   ```

3. Force MCP reinstallation:
   ```bash
   ./start.sh --force "Build a TODO app"
   ```

## Agents

- **Planner**: Analyzes requirements and creates specifications
- **Architect**: Designs system architecture and technical specifications
- **Builder**: Implements the application based on technical specs
- **Tester**: Implements and runs tests following pyramid strategy

## Development Process

1. **Planning Phase**
   - Analyzes prompt or reads specs
   - Generates architectural requirements
   - Creates initial specifications

2. **Architecture Phase**
   - Designs system architecture
   - Selects technology stack
   - Defines component structure

3. **Implementation Phase**
   - Sets up project structure
   - Implements components
   - Configures deployment

4. **Testing Phase**
   - Implements unit tests
   - Creates integration tests
   - Develops E2E tests
   - Generates coverage reports

## Contributing

1. Fork the repository
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Create a new Pull Request

## License

MIT
