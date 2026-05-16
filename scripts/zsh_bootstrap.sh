#!/usr/bin/env bash
set -e
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "SLAP: Installing dependencies for zsh+prezdo"
sudo dnf install -y zsh
echo "SLAP: Complete"

echo "SLAP: Copying zsh files to XDG-compliant filepath"
mkdir ~/.config/zsh/
cp -t ~/.config/zsh/ "$SCRIPT_DIR/../zsh/user.zsh" 
cp -t ~/.config/zsh/ "$SCRIPT_DIR/../zsh/plugin.zsh"
cp -t ~/ "$SCRIPT_DIR/../.zshenv" 
echo "SLAP: Complete"

echo "SLAP: Changing login shell"
chsh -s $(which zsh)
echo "SLAP: Complete"

