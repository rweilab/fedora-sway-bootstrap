echo "SLAP: Executing $0"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

mkdir -p ~/.config/waybar
cp "$SCRIPT_DIR/../waybar/good/config.jsonc" ~/.config/waybar/
cp "$SCRIPT_DIR/../waybar/good/style.css" ~/.config/waybar/
echo "SLAP: Copied waybar files"

echo "SLAP: Rebooting Waybar"
if pgrep waybar >/dev/null; then
    pkill waybar
    sleep 0.5
fi

nohup waybar >/dev/null 2>&1 & disown
echo "SLAP: Done rebooting waybar"

echo "SLAP: FINISHED running $0"
