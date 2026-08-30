# PROGRESS - {{project_name}}

> Task-level reset on complete; repo-level summary kept current (L23). New agent reads PLAN Status + this file + last HANDOFF ~800 tok (L8).

## Repo summary (keep current - never cleaned)

- Current phase: `phase/NN-name` - {{state}}
- Last commit: {{sha}} on `main`
- Resume from: {{phase or none}}
- Coverage: {{%}} | Build: {{pass/fail}}

## Phase states

| Phase | Branch | State | Last commit | Resume from | Gate |
|---|---|---|---|---|---|
| P0 | `phase/00-repo-foundation` | pending/active/verify/blocked/complete | - | - | files valid |
| P1 | `phase/01-scaffold` | pending | - | - | build green |
| ... | ... | ... | ... | ... | ... |
| P15 | `phase/15-agentic-build-guide` | pending | - | - | review |

## Merge queue (topological order)

- Next to merge: `phase/NN-name` - needs `lint typecheck test coverage validate` pass.
