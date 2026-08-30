#!/usr/bin/env bash
set -e
# skip in template repo itself (guide is expected to have agentic files)
if [ -f "AGENTIC_BUILD_GUIDE.md" ] && [ -f "REFERENCES.md" ]; then echo "template repo skip agentic traces check"; exit 0; fi
if git ls-files | grep -qi agentic; then echo "FAIL ABG trace"; git ls-files | grep -i agentic; exit 1; fi
echo "agentic traces check pass"
