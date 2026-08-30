# 06 - devDeps pinned
- Obs: package.json no semantic-release deps -> npx fetches random latest
- Impact: release non-deterministic
- Class: TOOLING
- Fix: add devDeps pinned + lock
- Change: package.json:7
- Check: pnpm install deterministic
- Next L: L33 Pin semantic-release deps
