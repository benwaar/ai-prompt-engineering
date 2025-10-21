#!/bin/sh
# Tracked copy of the commit-msg hook. Copy this file to .git/hooks/commit-msg and make it executable.

COMMIT_MSG_FILE="$1"
MSG=$(sed -n '1p' "$COMMIT_MSG_FILE" | tr -d '\r')

RE='^(feat|fix|docs|style|refactor|perf|test|chore|build|ci)(\([a-zA-Z0-9_ -]+\))?: .+'

if echo "$MSG" | grep -Eiq -- "$RE"; then
  exit 0
else
  echo "" >&2
  echo "ERROR: Commit message does not follow Conventional Commits format." >&2
  echo "Example: 'feat(ui): add new button' or 'docs(readme): update usage'" >&2
  echo "Commit message received:" >&2
  echo "  $MSG" >&2
  echo "" >&2
  echo "For more info: https://www.conventionalcommits.org/" >&2
  exit 1
fi
