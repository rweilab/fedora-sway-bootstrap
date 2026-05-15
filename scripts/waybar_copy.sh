echo "SLAP: Executing $0"

mkdir -p ~/.config/waybar
cp -t ~/.config/waybar/ ../waybar/good/config.jsonc ../waybar/good/style.css
echo "SLAP: Copied waybar files"

echo "SLAP: Rebooting Waybar"
pkill waybar && nohup waybar >/dev/null 2>&1
echo "SLAP: Done"

echo "SLAP: FINISHED running $0"
