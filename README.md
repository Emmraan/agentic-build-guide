# Agentic Build Guide — Universal v2

Small core + on-demand layers to build any product like a company does with a real SWE. Always up-to-date via references, not dumps.

> Core `AGENTIC_BUILD_GUIDE.md` ~113 lines, ~800 tokens. Templates, archetypes, and resources load on-demand.

## Features

- **Universal:** one guide for any project (static site, CRUD SaaS, multi-service, AI-native) via `archetypes/*.yml`.
- **Phase Contract:** P0-P15 with DAG `depends_on`, File Ownership Map, deterministic gates.
- **Parallel:** 15 phases → 1 day via waves (P0-2 seq → P3-6 // P7-11 // P12-15 seq), 15 sub-agents.
- **Modes:** AUTONOMOUS (non-stop parallel) or NORMAL (per-phase pause), switchable `mode: autonomous|normal`.
- **Resume:** file checkpoints `PLAN Status` + `PROGRESS.md` + `HANDOFF-NN.md` — new session reads 3 files ~800 tokens.
- **Clean:** <500 LOC per file, token-saver docs, AI-pattern BAN (CI fails if detected).
- **CI only:** npm/docker/terraform/k8s never manual; GitHub App bypass for protected branches.

## Quick use for new project

1. Copy this guide into new repo: `npx degit Emmraan/agentic-build-guide` or `Use this template` (this repo is a template). It is gitignored in product repos (L19).
2. Add your idea: prompt in chat OR drop `idea.txt`/`idea.md` in root then say `read idea`.
3. Agent asks follow-ups, runs `using-agent-skills` + `find-skills` + `web-fetch` (see `REFERENCES.md`), proposes stack with cost/perf/scale tradeoffs.
4. Approve → agent generates custom `PLAN.md` P0-P15.
5. Say `build` → AUTONOMOUS builds non-stop (parallel waves) until you `stop`; switch mode anytime.

Details: `AGENTIC_BUILD_GUIDE.md`.

## Folder

```
AGENTIC_BUILD_GUIDE.md  PLAN.template.md  AGENTS.template.md  PROGRESS.template.md
ARCHITECTURE.template.md  REFERENCES.md
archetypes/{static-site,crud-saas,multi-service,ai-native}.yml
maintenance/{day2,upgrade,deprecation,resume}.md
resources/{token-optimization,code-graph,memory}/
docs/agent-feedback/00-template.md
scripts/{protect-branch.sh,setup-bots.sh,check-*.sh}
.github/workflows/{validate,release,docker-publish,terraform}.yml
.opencode/commands/{new-phase,ship-phase,retro}.md
```

## Contributing

See `CONTRIBUTING.md` — `feat/*`/`fix/*` branches, Conventional Commits, tested PRs, CI `validate` must pass. Code of conduct: `CODE_OF_CONDUCT.md`. Security: `SECURITY.md`. License: `LICENSE` (MIT).

## References

Latest links: `REFERENCES.md` — agent web-fetches live before building.
