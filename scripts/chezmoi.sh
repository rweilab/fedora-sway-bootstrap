#!/usr/bin/env bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/../lib.sh"
SLAP_PRINT "Executing $0"

chezmoi init --apply https://github.com/rweilab/dots-fedora-sway.git


SLAP_PRINT "FINISHED running $0"

# .config/doom/config.el
#
# .config/hypr/hypridle.conf
# .config/hypr/monitors.conf
# .config/hypr/userprefs.conf
# .config/kitty
# .config/kitty/kitty.conf
# .config/nvim/init.lua
# .config/sunsetr/sunsetr.toml
# .config/waybar
# .config/waybar/includes
# .config/waybar/layouts
# .config/waybar/layouts/my_config.jsonc
# .config/zsh
# .config/zsh/user.zsh
#
# $CONFIG_DIR/swaylock/config
#
# cp "$SCRIPT_DIR/../kitty/kitty.conf" ~/.config/kitty/
# cp "$SCRIPT_DIR/../kitty/theme.conf" ~/.config/kitty/
#   still need to install jetbrains-mono-fonts & kitty
#
# cp "$SCRIPT_DIR/../sway/config" ~/.config/sway/config.d/99-personal.conf
#
#
# cp "$SCRIPT_DIR/../waybar/config.jsonc" ~/.config/waybar/
# cp "$SCRIPT_DIR/../waybar/style.css" ~/.config/waybar/
#   still need to install nerd font and restart waybar
#
#
# cp -t ~/.config/zsh/ "$SCRIPT_DIR/../zsh/user.zsh" 
# cp -t ~/.config/zsh/ "$SCRIPT_DIR/../zsh/plugin.zsh"
# cp "$SCRIPT_DIR/../zsh/xdg.zshenv" ~/.config/zsh/.zshenv
# cp -t ~/ "$SCRIPT_DIR/../zsh/.zshenv" 
#   all this can be chezmoi managed
#     need to change login shell 
#     chsh -s "$(command -v zsh)"
