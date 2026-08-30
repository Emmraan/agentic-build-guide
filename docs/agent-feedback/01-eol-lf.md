# 01 - EOL lf
- Obs: All files CRLF, no .gitattributes -> bash\r 126
- Impact: validate fail 6s on check-loc.sh
- Class: TOOLING
- Fix: .gitattributes * eol=lf + renormalize
- Change: .gitattributes:1 new
- Check: validate green on Linux
- Next L: L28 EOL lf enforcement via .gitattributes
