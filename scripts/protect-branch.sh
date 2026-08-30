#!/usr/bin/env bash
# Usage: ./scripts/protect-branch.sh solo|team
# ref: ../REFERENCES.md — GitHub Branch Protection / Rulesets docs — web-fetch latest before use (L11/L24)
set -euo pipefail
MODE=${1:-solo}
OWNER=${OWNER:?set OWNER}
REPO=${REPO:?set REPO}
TOKEN=${GH_TOKEN:-${PAT:?set GH_TOKEN or PAT}}
API="https://api.github.com"
if [ "$MODE" = "solo" ]; then
  curl -f -s -X PUT -H "Authorization: Bearer $TOKEN" -H "Accept: application/vnd.github+json" \
    "$API/repos/$OWNER/$REPO/branches/main/protection" \
    -d '{"required_status_checks":{"strict":true,"contexts":["validate"]},"enforce_admins":true,"required_pull_request_reviews":null,"restrictions":null,"allow_force_pushes":false,"allow_deletions":false,"required_conversation_resolution":true}'
else
  curl -f -s -X PUT -H "Authorization: Bearer $TOKEN" -H "Accept: application/vnd.github+json" \
    "$API/repos/$OWNER/$REPO/branches/main/protection" \
    -d '{"required_status_checks":{"strict":true,"contexts":["validate"]},"enforce_admins":true,"required_pull_request_reviews":{"dismiss_stale_reviews":true,"require_code_owner_reviews":true,"required_approving_review_count":1,"require_last_push_approval":true},"restrictions":null,"allow_force_pushes":false,"allow_deletions":false,"required_conversation_resolution":true}'
fi
echo "Protection $MODE applied for $OWNER/$REPO"
