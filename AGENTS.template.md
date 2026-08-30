# AGENTS - {{project_name}}

> Stack: {{stack}} | Mode: {{mode: autonomous|normal}} | Source: agentic-build-guide v2
> ref: `REFERENCES.md` - web-fetch latest before any phase (L11/L24).

## 0. Karpathy 4 (core)

- Think Before Coding - plan before edit.
- Simplicity First - minimal change that passes gate.
- Surgical Changes - touch only owned files (File Ownership Map).
- Goal-Driven - exit criteria before code.

## 1. No blind task (L11)

Before any phase/task:

1. `web-fetch` reference for task domain.
2. `using-agent-skills` + `find-skills` search and load relevant skill.
3. Verify expected output/criteria understood. Only then BUILD.

## 2. Execution

- Use `PLAN.md` DAG `depends_on` + waves. Main spawns sub-agents per `phase/NN-name` (L7).
- Branch naming: `phase/NN-kebab-name` for P0-P15; day-2 `feat/* fix/* docs/* chore/* refactor/* test/*` (L21). Lint `^(phase/\d\d-|feat/|fix/|docs/|chore/|refactor/|test/)`.
- Mode: `AUTONOMOUS` non-stop parallel waves; `NORMAL` pause per phase. Switch via `mode: autonomous|normal` or `.agents/mode`. Interrupt `stop/pause` → checkpoint `PROGRESS.md`+`HANDOFF-NN.md` (L8/L22).
- Cleanup: task-level progress/hand off reset on complete; repo-level `ARCHITECTURE.md`/`PROGRESS` summary kept current (L23).

## 3. Quality gates

- Every code file <500 LOC strict; feature/domain split (L10). CI `loc <500` fails.
- All `.md`/docs token-saver style: tables/lists, 60-80 char lines, compact (L26).
- Comments only when important, human-readable; AI pattern BAN - build FAIL if detected (L27).
- Maker≠Checker: BUILD ≠ VERIFY; schema/validator before content; evidence gates `lint typecheck test coverage validate`.

## 4. Git & CI

- `branch-per-phase` + `squash-merge` 1 commit/phase. Fix in same branch, never after merge.
- Protection: `scripts/protect-branch.sh solo|team` (L13). Bot bypass via GitHub App per L15.
- Publish/deploy CI only: npm/docker/terraform/k8s never manual (L18).
- No ABG traces in product git: `.gitignore` `agentic-build-guide/` + CI `git ls-files | grep agentic` empty (L19).

## 5. Improvement

- On user "aise nahi aise karo" or new LLM knowledge, propose std format `docs/agent-feedback/NN.md` + next L block + diff (L20/L25).
- Prefer referencing external docs/skills over dumping (L24) - fetch latest at build time.
