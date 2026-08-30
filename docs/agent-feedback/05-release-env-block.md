# 05 - Release env block
- Obs: release.yml env: { GITHUB_TOKEN: ${{ }} } flow -> Invalid workflow line 19
- Impact: 7 release runs failed, no tags
- Class: TOOLING
- Fix: env block style with multiline
- Change: release.yml:20
- Check: release workflow parses
- Next L: L32 Release env must be block style, not flow
