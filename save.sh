#!/bin/bash
# Saves every change in this folder and sends it to GitHub.
# Usage:  ./save.sh                     -> message "Practice YYYY-MM-DD"
#         ./save.sh "Codewars: 3 kata"  -> your own message
cd "$(dirname "$0")" || exit 1
git add -A
if git diff --cached --quiet; then
  echo "Nothing to save: no changes."
  exit 0
fi
msg="${1:-Practice $(date +%Y-%m-%d)}"
git commit -q -m "$msg" && git push -q && echo "Done: saved to GitHub."
