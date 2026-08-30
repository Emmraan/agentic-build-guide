#!/usr/bin/env bash
# Usage: ./scripts/setup-bots.sh solo|team
set -euo pipefail
MODE=${1:-solo}
if [ "$MODE" = "solo" ]; then
  echo '{"extends":["config:recommended"],"packageRules":[{"matchManagers":["npm"],"groupName":"all deps","groupAll":true}]}' > .github/renovate.json
else
  echo '{"extends":["config:recommended"],"packageRules":[{"groupName":"all deps","groupAll":true}]}' > .github/renovate.json
fi
echo "Bots $MODE configured"
