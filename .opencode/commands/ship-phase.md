# /ship-phase - verify + squash-merge

1. Run `lint typecheck test:coverage validate` - fix in same branch if fails.
2. Update `PLAN.md` status + write `HANDOFF-NN.md`.
3. `git checkout main && git merge --squash phase/NN-name && git commit -m "feat: phase NN"`.
4. Clean task progress (L23); keep repo summary.
