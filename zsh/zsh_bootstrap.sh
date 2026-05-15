#!/usr/bin/env bash
set -e

echo "SLAP: Installing dependencies for zsh+prezdo"
sudo dnf install -y zsh
echo "SLAP: Complete"

echo "SLAP: Copying zsh files to XDG-compliant filepath"
mkdir ~/.config/zsh/
cp -t ~/.config/zsh/ ./user.zsh ./plugin.zsh
cp ./.zshenv ~/
echo "SLAP: Complete"

echo "SLAP: Changing login shell"
chsh -s $(which zsh)
echo "SLAP: Complete"
