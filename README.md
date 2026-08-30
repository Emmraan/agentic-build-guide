# Agentic Build Guide: Universal v2

[![Template](https://img.shields.io/badge/Template-Use%20this%20template-blue)](https://github.com/Emmraan/agentic-build-guide/generate)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Validate](https://github.com/Emmraan/agentic-build-guide/actions/workflows/validate.yml/badge.svg)](https://github.com/Emmraan/agentic-build-guide/actions/workflows/validate.yml)

A small core and on-demand layers to build any product like a company with a real SWE. Always up to date via references, not dumps.

You give an idea, the agent asks follow-ups, proposes a stack with cost, performance and scale tradeoffs, then builds in phases. Works for a new project and for future maintenance.

## Contents

- [Quick start](#quick-start)
- [How it works](#how-it-works)
- [Structure](#structure)
- [Contributing](#contributing)
- [License](#license)

## Quick start

```bash
# 1. Use this template or copy the folder
npx degit Emmraan/agentic-build-guide agentic-build-guide

# 2. Add your idea
echo "Build a SaaS directory with 100 products" > idea.md

# 3. Let the agent plan and build
# in chat: read idea.md, then approve PLAN, then say build
```

Details are in [AGENTIC_BUILD_GUIDE.md](AGENTIC_BUILD_GUIDE.md) which is about 113 lines and around 800 tokens. Templates, archetypes and resources load on demand.

## How it works

- **Idea to plan:** agent runs `using-agent-skills` and `find-skills` plus `web-fetch` of docs in [REFERENCES.md](REFERENCES.md) and proposes a stack. You approve a custom `PLAN.md` with P0 to P15, a DAG and file ownership.
- **Build modes:** AUTONOMOUS runs non-stop with parallel waves (P0-2 seq, P3-6 parallel, P7-11 parallel, P12-15 seq) or NORMAL pauses per phase. Switch with `mode: autonomous` or `mode: normal`. Any maintenance plan uses the same rule.
- **Resume:** file checkpoints `PLAN Status` plus `PROGRESS.md` plus `HANDOFF-NN.md`. A new session reads 3 files and continues. Task progress is cleaned on completion, repo context stays.
- **Quality:** every code file under 500 lines, clean industry style, comments only when needed, AI pattern blocked by CI.

## Structure

| Path | Purpose |
|---|---|
| `AGENTIC_BUILD_GUIDE.md` | Core guide, small and token efficient |
| `PLAN.template.md` `AGENTS.template.md` `PROGRESS.template.md` `ARCHITECTURE.template.md` | Project OS templates |
| `REFERENCES.md` | All external links, agent web-fetches live |
| `archetypes/` | `static-site`, `crud-saas`, `multi-service`, `ai-native` presets |
| `maintenance/` | Day 2, upgrade, deprecation, resume runbooks |
| `resources/` | `token-optimization`, `code-graph`, `memory` on demand |
| `scripts/` | `protect-branch.sh`, `setup-bots.sh`, `check-*.sh` |
| `.github/workflows/` | `validate` and `release` (GitHub tags only) |
| `.opencode/commands/` | `new-phase`, `ship-phase`, `retro` |

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for branches `feat/*` and `fix/*`, Conventional Commits and tested PRs. By participating you agree to [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md). For security see [SECURITY.md](SECURITY.md).

## License

MIT, see [LICENSE](LICENSE).
