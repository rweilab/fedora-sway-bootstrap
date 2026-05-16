#!/usr/bin/env bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/../lib.sh"
SLAP_PRINT "Executing $0"


firefox &
PID=$!
while [ ! -d ~/.config/mozilla/firefox ]; do
  sleep 0.2
done

while ! pgrep firefox >/dev/null; do
  sleep 0.2
done
kill $PID

PROFILE_DIR="$(find ~/.config/mozilla/firefox/ -name '*.default-release')"
SLAP_PRINT "Located "$PROFILE_DIR""
cp "$SCRIPT_DIR/../firefox/user.js" "$PROFILE_DIR"


SLAP_PRINT "FINISHED running $0"
