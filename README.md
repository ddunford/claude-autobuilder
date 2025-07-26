# Claude AutoBuilder 🧠🤖

This is a fully automated Claude Code workflow that:

1. Reads a natural language prompt from `prompt.txt`
2. Breaks the task into modular features (`planner-agent`)
3. Generates formal specs in `/specs` (`spec-agent`)
4. Writes unit tests first (`test-writer-agent`)
5. Writes implementation code to pass those tests (`impl-agent`)
6. Runs tests and loops until green (`test-runner-agent`)

It follows the **test pyramid** strategy: unit > integration > e2e.

---

## 🚀 Quickstart

### 1. Install Claude CLI

Make sure you’ve installed Claude CLI (`claude` command) via:

```bash
npm install -g claude-code
```

---

### 2. Run the AutoBuilder

1. Update your idea in:

```txt
prompt.txt
```

Example:
```
Build a simple TODO list app with add/delete/complete functionality.
```

2. Then run:

```bash
claude chat --tool StartPrompt
```

> This will kick off the full workflow using custom agents and hooks.

---

## 🧩 Directory Layout

```
.
├── prompt.txt               # Your one-line app idea
├── CLAUDE.md                # Shared context (test strategy, roles)
├── specs/                   # Claude writes feature specs here
├── tests/                   # Claude writes unit tests first
├── src/                     # Claude writes just enough code to pass tests
├── e2e/                     # Optional: future E2E tests
└── .claude/
    ├── settings.json        # Hook pipeline setup
    └── agents/              # All 5 custom agents
```

---

## 🧠 Custom Agents

- `planner-agent`: breaks down idea into features
- `spec-agent`: creates `/specs/*.md`
- `test-writer-agent`: generates `/tests/*.test.js`
- `impl-agent`: writes `/src/*.js` to pass tests
- `test-runner-agent`: runs tests and outputs results

---

## 🧪 Notes

- It runs tests repeatedly until they pass
- Only writes minimal code required to satisfy tests
- Avoids hallucinating full apps at once
- Easily extend with Playwright, CI, or Slack notifications

---

## 🐙 Ready for GitHub

You can now push this folder to GitHub and share your Claude-powered code pipeline.


---

## 🌐 Playwright Agent (MCP)

The `playwright-agent` uses Playwright via MCP protocol to run full browser-based tests stored in `/e2e`.

> To run:

```bash
claude chat --agent playwright-agent --files e2e
```

Make sure your MCP Playwright agent is installed and listening.

