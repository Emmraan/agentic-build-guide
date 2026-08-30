# ARCHITECTURE — {{project_name}}

> Repo-level context — kept current, never cleaned (L23). New agent reads this + AGENTS.md + PLAN Status.

## Stack

- {{framework}} + {{language}} + {{styling}} + {{data layer}} + {{deploy}}

## Data shape

- {{schemas, types, validation}}

## Folder structure (modular, <500 LOC per file — L10)

```
app/              # routes (SSG where possible)
components/ui/    # shared UI, one file per component
lib/              # types, schemas, data loaders, search/seo utils
data/             # json source
tests/            # coverage ≥80% on lib/
scripts/          # validate-*.ts
```

## Decisions

| Decision | Why | Alternative rejected |
|---|---|---|
| {{choice}} | {{reason cost/perf/scale}} | {{tradeoff}} |

See `DECISIONS.md` for full log.
