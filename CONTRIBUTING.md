# Contributing

For developers and users - AI agents follow `AGENTIC_BUILD_GUIDE.md`.

## Quick start

1. Fork the repo, clone your fork.
2. Create a branch: `feat/your-feature` or `fix/bug` (Conventional Branch).
3. Make changes with tests if needed.
4. Run `pnpm lint && pnpm typecheck && pnpm test:coverage` locally (via `validate.yml`).
5. Commit with Conventional Commits: `feat:`, `fix:`, `docs:`, `chore:`.
6. Push and open a PR against `main`. Fill the PR template, link the issue.

## Branch and commit

- Branches: `feat/*`, `fix/*`, `docs/*`, `chore/*`, `refactor/*`, `test/*` (day-2); `phase/NN-name` for phased builds.
- Commits: `feat: add ...` triggers minor, `fix:` patch, `BREAKING CHANGE:` major (semantic-release).

## What we check

- PR must be tested (`coverage ≥80%` on `lib/` where applicable).
- CI `validate` must pass: lint, typecheck, tests, ai-pattern, loc <500.
- No AI slop pattern - keep docs/code clean (see `AGENTIC_BUILD_GUIDE.md` L27).

## Reporting issues

Open an issue with reproduction steps, expected vs actual, environment.

Thank you for contributing!
