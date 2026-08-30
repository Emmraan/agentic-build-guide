# 04 - Single validate context
- Obs: protect-branch contexts 5 vs validate single job -> PR pending
- Impact: branch frozen after solo->team
- Class: SPEC
- Fix: contexts ["validate"] only
- Change: scripts/protect-branch.sh:13
- Check: PR merges after validate
- Next L: L31 Single validate context, not 5
