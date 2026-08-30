# Agentic Build Guide - Universal v2

> Small core + on-demand layers. Build any product like a company does with a real SWE.
> Core ~250 lines, ~800 tok always read. Rest via manifest + web-fetch (reference > dump).

## 1. How to use for new project

1. Import: copy `agentic-build-guide/` into new repo dir. It is gitignored (L19) - never committed. `git ls-files | grep agentic` empty.
2. Idea: give prompt OR drop `idea.txt`/`idea.md` in root then say `read idea`.
3. Discovery: agent asks follow-ups (scope, budget, users), runs `using-agent-skills` + `find-skills` + `web-fetch` per domain, proposes stack + tradeoffs (cost/perf/scale/maintain) with pros/cons + recommendation.
4. PLAN: after approval, agent generates custom `PLAN.md` P0-P15 with DAG `depends_on` + ownership + gates.
5. Build: say `build` → AUTONOMOUS non-stop P0-P15 (parallel waves L7) or NORMAL per-phase pause. Switch anytime `mode: autonomous|normal` or `.agents/mode`. Interrupt `stop/pause` → graceful checkpoint (PROGRESS+HANDOFF L8). Applies to every future plan (maintenance/upgrade/fix) same rule.

## 2. Two layers

| Layer | Role | Files |
|---|---|---|
| Skills | HOW to engineer | `Emmraan/agent-skills` (160+ skills) via `using-agent-skills` |
| Project OS | WHAT/WHEN to do | `PLAN.md`, `PROGRESS.md`, `ARCHITECTURE.md`, `DECISIONS.md`, gates, git checkpoints |

- Main Orchestrator > `loop-orchestrator` (DEFINE→PLAN→BUILD→VERIFY→REVIEW→SHIP). Product code ≠ framework code. Every project tests framework (L4/L5).

## 3. Phase Contract (next artifact to design)

Per phase defines:

- Inputs, outputs, states `pending|active|verify|blocked|complete`, gates, evidence, transition rules, iteration budget (2 fails → escalate).

## 4. Execution

### 4.1 Parallel 15 → 1 day

- File Ownership Map: 1 file = 1 owner, no overlap via DAG `depends_on`.
- Waves: `P0-P2` seq → `P3-P6` parallel → `P7-P11` parallel → `P12-P15` seq.
- Main spawns 15 sub-agents (Task tool), each isolated `phase/NN-name` branch with exit criteria. Main verifies `lint/typecheck/test/validate` then squash-merge in topological order.

### 4.2 Token-limit resume

- No conversation memory. Checkpoints: `PLAN.md Status` + `PROGRESS.md (state,last_commit,resume_from)` + `HANDOFF-NN.md partial` + `git log` per slice. New agent reads 3 files ~800 tok (L8).

### 4.3 Modes

- AUTONOMOUS: non-stop, parallel waves auto, stops only on user `stop`.
- NORMAL: pause per phase for verify.
- Task-level progress cleaned on completion; repo-level context (`ARCHITECTURE.md`, `AGENTS.md`) kept current (L23).

## 5. No blind task

- BAN blind start. Pre-start must: `web-fetch` ref + load skill via `using-agent-skills` + `find-skills` search + verify output/criteria. Only then BUILD. Reduces hallucination (L11+L12): research-first + null until verified + schema before content + Maker≠Checker + evidence gates.

## 6. Git standard

### 6.1 Branch naming (L21)

- P0-P15: `phase/NN-kebab-name` (NN 00-15, numeric order, cut from latest `main` after prior merge, squash-merge 1 commit/phase).
- Day-2: `feat/*`, `fix/*`, `docs/*`, `chore/*`, `refactor/*`, `test/*` (GitHub Flow + Conventional Commits). AI + human same. CI lint `^(phase/\d\d-|feat/|fix/|docs/|chore/|refactor/|test/)`.

### 6.2 Protection (L13)

- Two systems: Classic `PUT /repos/{o}/{r}/branches/main/protection` + `bypass_pull_request_allowances` vs Rulesets `PUT /repos/{o}/{r}/rulesets` + `bypass_actors`.
- Solo pre-ship: PR=false, post-ship PR=true. Team: PR=true (1 review, dismiss_stale, code_owner, last_push). Both strict=true, contexts `[validate,lint,typecheck,test,coverage]`, enforce_admins=true, block force/delete, conversation_resolution. `scripts/protect-branch.sh solo|team` via curl PAT.

### 6.3 Post-ship flow (L14)

- After first push, `main` frozen. `Issue → branch fix/* feat/* → PR → CI pass → review → squash-merge`. Owner also blocked. Solo PR count 0 (self-PR ok) but PR required.

### 6.4 Bot bypass GH006 (L15)

- `GITHUB_TOKEN` never bypasses. Ranking: (1) GitHub App (best, org-owned, `tibdex/github-app-token` in bypass) (2) Deploy Key SSH `git@...` (3) PAT temp. Pattern: generate app token BEFORE `actions/checkout` with `token: ${{steps.app.outputs.token}}, fetch-depth:0, persist:true` + `GITHUB_TOKEN: app` for `semantic-release`. Alt: disable `@semantic-release/git`. Secret in `environment: semantic-release`.

## 7. File standards

- **Modularity:** every code file <500 LOC strict, feature/domain split, CI `loc <500` fails build (L10).
- **Clean + token-saver (L26/L27):** all `.md`/docs + code extremely clean, industry style. Comments only when important, human-readable. No AI pattern (build FAIL if detected). Tables/lists over prose, 60-80 char lines, sentence case, gerund titles, one action/step. `technical-writer` style.
- **Markdown:** `CODE_OF_CONDUCT` Covenant v2.1, `CONTRIBUTING` GitHub template, `SECURITY` policy, `LICENSE` MIT (L16).
- **Repo files (P0/P1 owned):** Dockerfile multi-stage alpine/distroless non-root HEALTHCHECK, compose `env_file`+`depends_on`+`restart`, `.env.example` YOUR_ placeholders tracked `.env.local` ignored, `.gitignore`, `.dockerignore`, `.editorconfig`, `.nvmrc` pinned (L17).
- **Bots:** Solo 2 (Release App + Renovate pref) Team 5 (+CODEOWNERS+Stale+Labeler+CodeQL) via `scripts/setup-bots.sh` (L17).
- **No ABG traces (L19):** ABG gitignored; CI fails if `git ls-files | grep agentic` found.

## 8. Publish & deploy - CI only (L18)

- No manual `npm publish`/`docker push`/`terraform apply`/`kubectl`.
- npm `release.yml` `NPM_TOKEN` provenance, docker `docker-publish.yml` buildx → ECR/ACR/GCR/GHCR (semver+sha), cloud AWS/Azure/GCP terraform `plan/apply` S3/GCS `terraform.yml`, k8s ArgoCD/Flux or helm/kubectl `k8s-deploy.yml`, Jenkins if self-host else GH Actions, VPS `deploy.yml`. All `environment:production` + OIDC.

## 9. Improvement loop - real SWE

- Framework: `v1 → Project → Failure → Root-cause → Classify (SKILL|WORKFLOW|TEST|SPEC|ARCH|TOOLING|AGENT) → fix right layer → v2` (L5).
- User says "aise nahi aise karo" → agent returns std format `docs/agent-feedback/NN.md` (Observation|Impact|RootCause|Classification|PreventiveChange|FrameworkChange file+lines|RegressionCheck) + next L block + diff (L20).
- New LLM: when built with newer model, agent also proposes ABG improvement from its knowledge in same format (L25).
- Store incremental exp; prefer referencing (links to docs/skills/repos) over dumping so ABG stays latest via live web-fetch at build time (L24).

## 10. Karpathy core (L9) - in AGENTS.md

- Think Before Coding - Simplicity First - Surgical Changes - Goal-Driven Execution.

## 11. Resources - on-demand only

| Resource | When |
|---|---|
| `resources/token-optimization` (token-saver) | optional hook, 60-99% CLI cut |
| `resources/code-graph` (graphify) | multi-service / AI-native only |
| `resources/memory` (claude-mem) | very long projects only |

Evaluate future repos against 4 filters: modular plug, small core, token-efficient, deterministic gates.

## 12. References

- Source: `Emmraan/agent-skills` + this guide.
- Archetypes: `archetypes/{static-site,crud-saas,multi-service,ai-native}.yml`.
- Maintenance: `maintenance/{day2,upgrade,deprecation,resume}.md`.
- All external versions/links: `REFERENCES.md` - web-fetch live before build (reference > dump, L24).

---
Compact core - meaning preserved. Keep this file ~250 lines; details in templates/resources via manifest.
