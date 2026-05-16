#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/../lib.sh"
SLAP_PRINT "Executing $0"

SLAP_PRINT "Installing dependencies for zsh"
sudo dnf install -y zsh
SLAP_PRINT "Complete"

SLAP_PRINT "Copying zsh files to XDG-compliant filepath"
mkdir -p ~/.config/zsh/
cp -t ~/.config/zsh/ "$SCRIPT_DIR/../zsh/user.zsh" 
cp -t ~/.config/zsh/ "$SCRIPT_DIR/../zsh/plugin.zsh"
cp "$SCRIPT_DIR/../zsh/xdg.zshenv" ~/.config/zsh/.zshenv

cp -t ~/ "$SCRIPT_DIR/../zsh/.zshenv" 
SLAP_PRINT "Complete"

SLAP_PRINT "Changing login shell"
chsh -s "$(command -v zsh)"
SLAP_PRINT "Complete"

