#!/usr/bin/env bash
SLAP_PRINT "Executing $0"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

set -e

SLAP_PRINT "Installing kitty term"
sudo dnf install -y kitty
SLAP_PRINT "Complete"

SLAP_PRINT "Installing JetBrains-Mono-Fonts"
sudo dnf install -y jetbrains-mono-fonts
SLAP_PRINT "Complete"

SLAP_PRINT "Copying kitty files"
mkdir -p ~/.config/kitty/
cp "$SCRIPT_DIR/../kitty/kitty.conf" ~/.config/kitty/
cp "$SCRIPT_DIR/../kitty/theme.conf" ~/.config/kitty/

SLAP_PRINT "Complete"

