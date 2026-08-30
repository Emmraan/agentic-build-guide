# Token optimization (optional)

Source: `ppgranger/token-saver` — 36 processors, 60-99% CLI output cut, deterministic, 60ms.

- Use as hook to trim `pnpm test`, `lint`, `build` output before LLM read. Preserves errors/diffs (L12).
- Load on-demand via `using-agent-skills` when output large.
