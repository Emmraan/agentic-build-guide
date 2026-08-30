# 03 - pnpm lock and cache
- Obs: packageManager pnpm@10.12.1 but no pnpm-lock.yaml -> setup-node cache fail
- Impact: validate fail lock file not found
- Class: TOOLING
- Fix: pnpm install, commit lock, restore cache
- Change: pnpm-lock.yaml:1 + validate.yml:14 + release.yml:19 + .nvmrc:1 22.15.1
- Check: pnpm install --frozen-lockfile passes
- Next L: L30 Commit lockfile, restore cache, frozen install
