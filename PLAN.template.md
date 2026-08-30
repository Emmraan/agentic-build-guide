# PLAN — {{project_name}} (live tracker)

> Master plan. Every phase is a branch, a new session, deterministic exit criterion. Main verifies then squash-merge.
> ref: `REFERENCES.md` for all external versions — web-fetch latest before build (L24).

## Global rules

1. Research first: `web-fetch` + `using-agent-skills` + `find-skills` before ANY phase/task (L11).
2. File Ownership Map: 1 file = 1 owner via DAG `depends_on`; no overlap.
3. Branch-per-phase `phase/NN-name`, squash-merge 1 commit/phase (L21). Fix in same branch.
4. Token resume: `PLAN Status` + `PROGRESS.md` + `HANDOFF-NN.md` + `git log` (L8).
5. Task progress cleaned on complete; repo summary kept current (L23).

```
main <-- phase/00 -- merge -- phase/01 -- merge -- ... -- phase/15 -- merge
              | branch          | branch
```

## Phase Contract

| Field | Meaning |
|---|---|
| inputs | what phase needs |
| outputs | what it produces |
| states | pending → active → verify → blocked → complete |
| gates | lint/typecheck/test/coverage/validate |
| evidence | commands/tests that prove exit |
| transition | merge only after gates pass; 2 fails → escalate |

## Phase tracker

| Phase | Branch | Depends_on | Owner files | Skills | Exit criterion | Status |
|---|---|---|---|---|---|---|
| P0 | `phase/00-repo-foundation` | — | AGENTS.md, PLAN.md, .gitignore etc | open-source-project-maintainer | files valid | [ ] pending |
| P1 | `phase/01-scaffold` | P0 | configs, app shell | nextjs, typescript | build green | [ ] pending |
| P2 | `phase/02-data-layer` | P1 | lib/types, schemas, data/ | typescript | validate ✓ | [ ] pending |
| P3 | `phase/03-feature-a` | P2 | owners per DAG | per archetype | validate ✓ | [ ] pending |
| P4 | `phase/04-feature-b` | P2 | owners per DAG | per archetype | validate ✓ | [ ] pending |
| P5 | `phase/05-feature-c` | P2 | owners per DAG | per archetype | validate ✓ | [ ] pending |
| P6 | `phase/06-core-components` | P3,P4,P5 | components/ui/* | frontend-craft | build pass | [ ] pending |
| P7 | `phase/07-homepage` | P6 | app/page, header/footer | frontend-craft, seo | renders + metadata | [ ] pending |
| P8 | `phase/08-list-browse` | P6 | app/list/* | frontend-core | list renders | [ ] pending |
| P9 | `phase/09-detail` | P8 | app/[slug]/* | seo, nextjs | SSG + 404 | [ ] pending |
| P10 | `phase/10-search-filter` | P8 | lib/search.ts | frontend-core | search ✓ | [ ] pending |
| P11 | `phase/11-contribute-seo` | P9,P10 | lib/seo, sitemap | seo | seo artifacts | [ ] pending |
| P12 | `phase/12-tests` | P6-P11 | tests/* | testing | coverage ≥80% | [ ] pending |
| P13 | `phase/13-ci-release` | P12 | .github/workflows/* | github-actions | CI green | [ ] pending |
| P14 | `phase/14-docs-release` | P13 | README, docs/* | technical-writer | gates green | [ ] pending |
| P15 | `phase/15-agentic-build-guide` | P14 | AGENTIC_BUILD_GUIDE | technical-writer | review | [ ] pending |

Waves: P0-P2 seq → P3-P6 parallel → P7-P11 parallel → P12-P15 seq.

## Handoff template

At end of every phase, write `docs/handoffs/HANDOFF-NN.md` on same branch:

```
# HANDOFF — phase/NN
Branch: phase/NN-name
Status: complete — evidence {{lint 0, typecheck, tests}}
Next: phase/MM — brief
Resume: none or partial checkpoint
```
