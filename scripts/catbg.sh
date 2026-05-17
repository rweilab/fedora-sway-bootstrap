#!/usr/bin/env bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/../lib.sh"
SLAP_PRINT "Executing $0"

set -e

sudo cp "$SCRIPT_DIR/../Cat_at_Play_4k.png" /usr/share/backgrounds/


THEME_DIR="$(find /usr/share/sddm/themes/ -type d -iname '*fedora' | head -n 1)"
SLAP_PRINT "Located $THEME_DIR"
sudo cp "$SCRIPT_DIR/../Cat_at_Play_4k.png" "$THEME_DIR"
WALLPAPER="$THEME_DIR/Cat_at_Play_4k.png"

sudo mkdir -p "$XDG_CONFIG_HOME/swaylock/"
sudo cat > "$XDG_CONFIG_HOME/swaylock/config" <<EOF
image=$WALLPAPER
EOF


sudo sed -i "s|^background=.*|background=$WALLPAPER|" "$THEME_DIR/theme.conf"


SLAP_PRINT "FINISHED running $0"
