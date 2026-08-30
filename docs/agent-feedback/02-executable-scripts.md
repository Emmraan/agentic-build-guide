# 02 - Executable scripts
- Obs: scripts 100644 not 100755 -> exit 126
- Impact: validate fail at check-loc.sh
- Class: WORKFLOW
- Fix: git update-index --chmod=+x + bash wrapper
- Change: scripts/*.sh:1 chmod + validate.yml:21
- Check: bash ./scripts/check-loc.sh passes
- Next L: L29 Scripts executable via git chmod + bash
