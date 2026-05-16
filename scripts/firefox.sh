#!/usr/bin/env bash
echo "SLAP: Executing $0"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

firefox &
PID=$!
while [ ! -d ~/.mozilla/firefox ]; do
  sleep 0.2
done
kill $PID

PROFILE_DIR="(find ~/.config/mozilla/firefox/ -name '*.default-release')"
echo "SLAP: Located "$PROFILE_DIR""
cp "$SCRIPT_DIR/..firefox/user.js" "$PROFILE_DIR"


echo "SLAP: FINISHED running $0"
