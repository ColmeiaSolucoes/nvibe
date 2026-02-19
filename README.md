# nvibe

A Claude Code skill that orchestrates feature development through 4 sequential phases:

**BRAINSTORMER → PLANNER → TECH → TASK MANAGER**

Each phase produces artifacts that feed into the next, creating a structured workflow from idea to implementation.

## Install

**Via npx (recommended):**

```bash
npx @anthropic-ai/skills add https://github.com/ColmeiaSolucoes/nvibe --skill nvibe
npx @anthropic-ai/skills add https://github.com/obra/superpowers --skill brainstorming
```

**Via git clone:**

```bash
git clone https://github.com/ColmeiaSolucoes/nvibe.git ~/.claude/skills/nvibe && ~/.claude/skills/nvibe/setup.sh
```

> **Note:** The agents used in Phases 2-3 (codebase-analyzer, web-search-researcher) are built into Claude Code — no extra installation needed.

## How it works

Invoke with `/nvibe` in any project to start a new feature workflow.

### Phase 1: BRAINSTORMER
Runs a collaborative brainstorming session to explore the idea, ask clarifying questions one at a time, and define all requirements before any planning begins.

### Phase 2: PLANNER
Asks for a codename and whether to research competitors. Uses codebase analysis and optional web research to create a comprehensive plan at `.fabs-orch/plans/{CODENAME}_PLAN.md`.

### Phase 3: TECH
Transforms the plan into a detailed technical specification with architecture, data models, API contracts, file changes, and testing strategy at `.fabs-orch/specs/{CODENAME}_SPEC.md`.

### Phase 4: TASK MANAGER
Breaks the spec into executable tasks at `.fabs-orch/tasks/{CODENAME}_TASKS.md`. Asks whether to execute all at once or step by step. Tracks progress in real-time, updating the task file as each task completes.

## Artifacts

All artifacts are stored in `.fabs-orch/` at the project root:

```
.fabs-orch/
├── plans/       # {CODENAME}_PLAN.md
├── specs/       # {CODENAME}_SPEC.md
└── tasks/       # {CODENAME}_TASKS.md
```

## Key features

- User approval required before advancing to the next phase
- Codename-based file naming (uppercase with underscores)
- Real-time task progress tracking
- Optional competitor research via web search
- Codebase-aware planning and specs

## Dependencies

| Dependency | Source | Required by |
|------------|--------|-------------|
| [brainstorming](https://github.com/obra/superpowers) | obra/superpowers | Phase 1 |
| codebase-analyzer | Built-in Claude Code agent | Phases 2, 3 |
| web-search-researcher | Built-in Claude Code agent | Phase 2 (optional) |

## License

MIT
