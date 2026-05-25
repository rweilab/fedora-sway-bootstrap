#!/usr/bin/env bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/../lib.sh"
SLAP_PRINT "Executing $0"
set -e

WALLPAPER="$SCRIPT_DIR/../wallpapers/Cat_at_Play_4k.png"
TARGET="/usr/share/backgrounds/current-wallpaper"

THEME_DIR="$(find /usr/share/sddm/themes/ -type d -iname '*fedora' | head -n 1)"

SLAP_PRINT "Located $THEME_DIR"

# create/update stable symlink
sudo ln -sf "$WALLPAPER" "$TARGET"

sudo sed -i \
  "s|^background=.*|background=$TARGET|" \
  "$THEME_DIR/theme.conf"

SLAP_PRINT "FINISHED running $0"
