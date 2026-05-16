#!/usr/bin/env bash
set -e
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "SLAP: Installing kitty term"
sudo dnf install -y kitty
echo "SLAP: Complete"

echo "SLAP: Installing JetBrains-Mono-Fonts"
sudo dnf install -y jetbrains-mono-fonts
echo "SLAP: Complete"

echo "SLAP: Copying kitty files"
mkdir -p ~/.config/kitty/
cp "$SCRIPT_DIR/../kitty/kitty.conf" ~/.config/kitty/
cp "$SCRIPT_DIR/../kitty/theme.conf" ~/.config/kitty/

echo "SLAP: Complete"

