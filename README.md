# nvibe

A Claude Code skill that orchestrates feature development through 4 sequential phases:

**BRAINSTORMER → PLANNER → TECH → TASK MANAGER**

Each phase produces artifacts that feed into the next, creating a structured workflow from idea to implementation.

## Install

```bash
git clone https://github.com/fabianoramos/nvibe.git ~/.claude/skills/nvibe
```

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
- Interaction in Portuguese (BR), artifacts in English
- Codename-based file naming (uppercase with underscores)
- Real-time task progress tracking
- Optional competitor research via web search
- Codebase-aware planning and specs

## License

MIT
