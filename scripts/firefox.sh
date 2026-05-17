#!/usr/bin/env bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/../lib.sh"
SLAP_PRINT "Executing $0"


firefox >/dev/null 2>&1 &

while true; do
    PROFILE_DIR="$(find ~/.config/mozilla/firefox \
        -maxdepth 1 \
        -type d \
        -name '*.default-release' \
        2>/dev/null | head -n 1)"

    [[ -n "$PROFILE_DIR" ]] && break

    sleep 0.5
done

SLAP_PRINT "Located profile: $PROFILE_DIR"

pkill firefox || true

cp "$SCRIPT_DIR/../firefox/user.js" "$PROFILE_DIR"

mkdir -p "$PROFILE_DIR/chrome"

cp \
"$SCRIPT_DIR/../firefox/userChrome.css" \
"$PROFILE_DIR/chrome"



SLAP_PRINT "FINISHED running $0"


