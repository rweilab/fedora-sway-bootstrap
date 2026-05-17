#!/usr/bin/env bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/../lib.sh"
SLAP_PRINT "Executing $0"
set -e

SLAP_PRINT "Checking login shell"
LOGIN_SHELL="$(getent passwd "$USER")"
if [[ "$LOGIN_SHELL" == */zsh ]]; then
    echo ""
    SLAP_PRINT "Login shell is zsh ; No need to change shell"
else
  attempts=0
  while true; do
      ((attempts++))
      if chsh -s "$(command -v zsh)"; then
          echo "Shell changed successfully"
          break
      fi
      echo "Wrong password (attempt $attempts)"
  done
fi


SLAP_PRINT "FINISHED running $0"
