#!/usr/bin/env bash
SLAP_PRINT() {
    echo -e "\033[1;33mSLAP:\033[0m $*"
}

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SLAP_PRINT "Executing $0"

WALLPAPER_DIR="$SCRIPT_DIR/wallpapers"
mapfile -t WALLPAPERS < <(realpath "$WALLPAPER_DIR"/*)

TARGET="/usr/share/backgrounds/current-wallpaper"
CURRENT="$(realpath "$TARGET" 2>/dev/null)"

temp_index=0
for w in "${WALLPAPERS[@]}"; do
  name="${w##*/}"

  if cmp -s "$w" "$TARGET"; then
    echo -e "\033[1m$temp_index\033[0m: $name \t(Current)"
  else
    echo -e "\033[1m$temp_index\033[0m: $name"
  fi

  ((temp_index++))
done

read -rp "Select wallpaper: (0-$(($temp_index - 1))): " pick

if [[ ! "$pick" =~ ^[0-9]+$ ]] || (( pick < 0 || pick >= ${#WALLPAPERS[@]} )); then
  echo "Invalid selection"
  exit 1
fi

new="${WALLPAPERS[$pick]}"

echo "Selected:"
echo "$new"

sudo cp "$new" "$TARGET"

swaymsg reload

SLAP_PRINT "FINISHED running $0"
