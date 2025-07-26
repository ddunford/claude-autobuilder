# Claude AutoBuilder Project

This project uses Claude Code automation to:

- Parse initial natural language prompt
- Generate specs and unit tests first
- Write code to pass the tests
- Repeat until tests are passing
- Follow testing pyramid strategy (unit > integration > e2e)

## Agent Roles

- planner-agent: reads prompt and breaks down the task
- spec-agent: generates markdown specs from plan
- test-writer-agent: writes unit tests from specs
- impl-agent: writes code to pass the tests
- test-runner-agent: runs and logs test output
