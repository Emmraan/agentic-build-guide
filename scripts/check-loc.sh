#!/usr/bin/env bash
set -euo pipefail
fail=0
while IFS= read -r f; do
  loc=$(wc -l < "$f" | tr -d ' ')
  if [ "$loc" -gt 500 ]; then echo "FAIL loc >500: $f ($loc)"; fail=1; fi
done < <(find app lib components -type f \( -name "*.ts" -o -name "*.tsx" \) 2>/dev/null || true)
[ "$fail" -eq 0 ] || exit 1
echo "loc check pass"
