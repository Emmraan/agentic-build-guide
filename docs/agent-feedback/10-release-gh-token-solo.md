# 10 - Release GH token solo
- Obs: release used App token requiring APP_ID, solo needs only GITHUB_TOKEN
- Impact: release failed waiting for App secrets
- Class: WORKFLOW
- Fix: solo via GITHUB_TOKEN, team via App per L15
- Change: release.yml:6
- Check: release creates tag without App
- Next L: L37 Solo release via GITHUB_TOKEN, team via App
