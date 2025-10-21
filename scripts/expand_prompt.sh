#!/usr/bin/env bash
set -euo pipefail

PATH_ARG="docs/COPILOT_PROMPTS.md"
EXPAND=0

while [[ $# -gt 0 ]]; do
  case "$1" in
    -p|--path)
      PATH_ARG="$2"; shift 2;;
    --expand)
      EXPAND=1; shift;;
    -h|--help)
      echo "Usage: $0 [-p path] [--expand]"; exit 0;;
    *)
      echo "Unknown arg: $1"; exit 1;;
  esac
done

if [[ ! -f "$PATH_ARG" ]]; then
  echo "File not found: $PATH_ARG" >&2
  exit 1
fi

if [[ $EXPAND -eq 1 ]]; then
  # Replace a standalone line containing [UTALA_BASE_STYLE] with the contents of the macro file
  if [[ -f "prompts/macros/base_style.md" ]]; then
    RESULT=$(sed -e '/\[UTALA_BASE_STYLE\]/{r prompts/macros/base_style.md' -e 'd}' "$PATH_ARG")
  else
    echo "Macro file prompts/macros/base_style.md not found; copying original prompt." >&2
    RESULT=$(cat "$PATH_ARG")
  fi
else
  RESULT=$(cat "$PATH_ARG")
fi

# Copy to clipboard (detect platform)
copy_to_clipboard() {
  if command -v pbcopy >/dev/null 2>&1; then
    printf '%s' "$1" | pbcopy
    echo "Prompt copied to clipboard (macOS)"
  elif command -v wl-copy >/dev/null 2>&1; then
    printf '%s' "$1" | wl-copy
    echo "Prompt copied to clipboard (Wayland)"
  elif command -v xclip >/dev/null 2>&1; then
    printf '%s' "$1" | xclip -selection clipboard
    echo "Prompt copied to clipboard (xclip)"
  elif command -v xsel >/dev/null 2>&1; then
    printf '%s' "$1" | xsel --clipboard --input
    echo "Prompt copied to clipboard (xsel)"
  else
    # Fallback: print to stdout
    printf '%s' "$1"
    echo "\n(clipboard tools not found; printed to stdout)" >&2
  fi
}

copy_to_clipboard "$RESULT"
