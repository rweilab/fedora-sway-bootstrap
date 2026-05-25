#!/usr/bin/env bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/lib.sh"
SLAP_PRINT "Executing $0"

WALLPAPER_DIR="$SCRIPT_DIR/wallpapers"
mapfile -t WALLPAPERS < <(realpath "$WALLPAPER_DIR"/*)

TARGET="/usr/share/backgrounds/current-wallpaper"
CURRENT="$(realpath "$TARGET" 2>/dev/null)"

temp_index=0
for w in "${WALLPAPERS[@]}"; do
  name="${w##*/}"

  if [[ "$w" == "$CURRENT" ]]; then
    echo -e "\033[1m$temp_index\033[0m: $name \t(Current)"
  else
    echo -e "\033[1m$temp_index\033[0m: $name"
  fi

  ((temp_index++))
done

read -rp "Select wallpaper: " pick

if [[ ! "$pick" =~ ^[0-9]+$ ]] || (( pick < 0 || pick >= ${#WALLPAPERS[@]} )); then
  echo "Invalid selection"
  exit 1
fi

new="${WALLPAPERS[$pick]}"

echo "Selected:"
echo "$new"

sudo ln -sf "$new" "$TARGET"

swaymsg reload

SLAP_PRINT "FINISHED running $0"
