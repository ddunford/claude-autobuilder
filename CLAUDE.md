# CLAUDE.md

## 🧠 Claude Code Expectations

This Claude Code project is configured for **autonomous agentic development**. The goal is to build production-grade software that starts with tests, validates specs, and delivers clean, high-quality code.

---

## ✅ Project Requirements

- **Test-First Development**: Begin with unit tests derived from the `/specs` directory.
- **Pyramid Test Strategy**: Emphasise unit tests (base), then integration and E2E (tip).
- **80%+ Code Coverage**: Ensure all critical paths are tested before delivery.
- **Modern Tech Stack**:
  - Use latest stable languages and libraries
  - Leverage **Claude MCP agents**: `context7`, `playwright`, `jest`, `sql`, `memory`, etc.
- **Runtime Containerisation**:
  - Final output must run cleanly in **Podman**
  - Include healthchecks, logging, and lean Dockerfile (OCI compliant)

---

## 🚧 Agent Workflow Overview

1. **Planner Agent**: Parses prompt/spec and generates roadmap
2. **Test Agent**: Writes unit tests from specs (priority #1)
3. **Build Agent**: Implements code to satisfy tests
4. **Reviewer Agent**: Conducts static analysis + best practices
5. **Playwright Agent**: Runs browser E2E tests if required
6. **Memory + Context Agents**: Keep long-term state awareness during session

---

## 📁 Directory Structure Expectations

```bash
/specs         # Markdown-based specs and requirements
/src           # Production code
/tests         # Unit and integration tests
/start.sh      # Entry point for Claude-based automation
/.claude       # Claude config and hooks
```

---

## 🛑 Quality Gates

Claude must:
- ✅ Pass all unit tests
- ✅ Exceed 80% coverage (`jest --coverage`, etc.)
- ✅ Lint/format code (Prettier, ESLint, etc.)
- ✅ Run successfully in Podman:
  ```bash
  podman build -t app .
  podman run --rm app
  ```

If any of the above fails, Claude must **refactor and retry automatically**.

---

## 📌 Notes

- Specs can be generated from `prompt.txt` if none exist.
- `--dangerously-skip-permissions` is enabled to automate workflows.
- Add new agents via `setup-mcp.sh`.

---

Happy hacking. Let the agents build for you.