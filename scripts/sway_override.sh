#!/usr/bin/env bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/../lib.sh"
SLAP_PRINT "Executing $0"

set -e

SLAP_PRINT "Copying sway files"
mkdir -p ~/.config/sway/config.d
cp "$SCRIPT_DIR/../sway/config" ~/.config/sway/config.d/99-personal.conf

SLAP_PRINT "Complete"

