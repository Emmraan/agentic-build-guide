# Day-2 operations

- Flow: `Issue → branch fix/* feat/* → PR → CI pass → review → squash-merge → delete branch` (L14). Main frozen.
- Protection active per `protect-branch.sh` (L13). Bot bypass via App (L15).
- Parallel waves apply to any maintenance PLAN same as build (L22).

## Checklist

- [ ] PR uses `feat/fix/docs/chore/refactor/test` naming (L21)
- [ ] CI contexts pass: validate lint typecheck test coverage
- [ ] Task progress cleaned; repo summary updated (L23)
