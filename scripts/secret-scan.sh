#!/usr/bin/env bash
set -euo pipefail

# Scan STAGED content for secrets before they can enter a commit — the cheapest
# place to stop a credential is before it touches local history.
#
# gitleaks is a native binary, not an npm dependency, so we don't force it onto
# every machine: if it isn't installed we print how to get it and continue. CI
# runs gitleaks unconditionally over the whole history as the hard backstop, so
# the gate is never silently absent — only deferred to the server.

if command -v gitleaks >/dev/null 2>&1; then
  gitleaks protect --staged --redact --no-banner
else
  echo "gitleaks not installed — skipping the local staged secret scan."
  echo "  install it for pre-commit coverage:  brew install gitleaks"
  echo "  (CI still scans the full history on every push and pull request.)"
fi
