#!/usr/bin/env bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/lib.sh"
SLAP_PRINT "Executing $0"
# set -e

WALLPAPER_DIR="$SCRIPT_DIR"/wallpapers
mapfile -t WALLPAPERS < <(realpath "$WALLPAPER_DIR"/*)
PIC_DIRS=(
  "/usr/share/backgrounds/"
  "$(find /usr/share/sddm/themes/ -type d -iname '*fedora' | head -n 1)"
)
CONFIGS=(
  "/usr/share/sddm/themes/theme.conf"
  "$HOME/.config/sway/config.d/99-personal.conf"
  "/home/slap/repos/dots-fedora-sway/dot_config/swaylock/config"
    # line 38 and line 46
    # e.g. output * bg /usr/share/backgrounds/Cat_at_Play_4k.png fill
)

temp_index=0

for w in "$WALLPAPER_DIR"/*; do
  name="${w##*/}"

  if [[ -f "/usr/share/backgrounds/$name" ]]; then
    MATCH=$name
    echo -e "$temp_index: $name \t (Current)"
    temp_index=$(($temp_index + 1))
  else
    echo "$temp_index: ${w##*/}"
    temp_index=$(($temp_index + 1))
  fi
done



# for w in "${WALLPAPERS[@]}"; do
#   # grep or rg /usr/share/sddm/theme/theme.conf for w##*/
#   rg $w ${PIC_DIRS[1]}
#   echo "$w"
#   echo "${w##*/}"
# done

# copy new to PIC_DIRS
# change CONFIGS filepaths
# remove old pics from PIC_DIRS
#
# old="/usr/share/backgrounds/old.png"
# new="/usr/share/backgrounds/new.png"








# sudo cp "$SCRIPT_DIR/../wallpapers/Cat_at_Play_4k.png" /usr/share/backgrounds/
#
# THEME_DIR="$(find /usr/share/sddm/themes/ -type d -iname '*fedora' | head -n 1)"
# SLAP_PRINT "Located $THEME_DIR"
# sudo cp "$SCRIPT_DIR/../wallpapers/Cat_at_Play_4k.png" "$THEME_DIR"
# WALLPAPER="$THEME_DIR/Cat_at_Play_4k.png"
#
#
# sudo sed -i "s|^background=.*|background=$WALLPAPER|" "$THEME_DIR/theme.conf"


SLAP_PRINT "FINISHED running $0"
