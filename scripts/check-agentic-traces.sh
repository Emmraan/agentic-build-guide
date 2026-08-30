#!/usr/bin/env bash
set -e
if git ls-files | grep -qi agentic; then echo "FAIL ABG trace"; git ls-files | grep -i agentic; exit 1; fi
echo "agentic traces check pass"
