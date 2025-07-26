# Claude AutoBuilder

This Claude Code project supports:
- Starting from `prompt.txt` to generate specs and code
- Or using existing `/specs/*.md` to skip planning

## 🔧 Setup

```bash
./start.sh
```

This will:
1. Install `context7` and `playwright` MCPs
2. Use either:
   - `prompt.txt` → planner-agent → spec-agent → tests → impl
   - `specs/*.md` → test-writer-agent → impl
3. Launch Claude CLI and hook into the pipeline
