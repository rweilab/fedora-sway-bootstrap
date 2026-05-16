#!/usr/bin/env bash
set -e
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "SLAP: Installing dependencies for zsh"
sudo dnf install -y zsh
echo "SLAP: Complete"

echo "SLAP: Copying zsh files to XDG-compliant filepath"
mkdir -p ~/.config/zsh/
cp -t ~/.config/zsh/ "$SCRIPT_DIR/../zsh/user.zsh" 
cp -t ~/.config/zsh/ "$SCRIPT_DIR/../zsh/plugin.zsh"
cp "$SCRIPT_DIR/..zsh/xdg.zshenv" ~/.config/zsh/.zshenv

cp -t ~/ "$SCRIPT_DIR/../zsh/.zshenv" 
echo "SLAP: Complete"

echo "SLAP: Changing login shell"
chsh -s "$(command -v zsh)"
echo "SLAP: Complete"

