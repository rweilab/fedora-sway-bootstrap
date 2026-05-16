#!/usr/bin/env bash
echo "SLAP: Executing $0"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

set -e

echo "SLAP: Copying sway files"
mkdir -p ~/.config/sway/config.d
cp "$SCRIPT_DIR/../sway/config" ~/.config/sway/config.d/99-personal.conf

echo "SLAP: Complete"

