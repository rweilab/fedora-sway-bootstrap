#!/usr/bin/env bash
echo "SLAP: Executing $0"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

firefox &
PID=$!

while [ ! -d ~/.mozilla/firefox ]; do
  sleep 0.2
done

kill $PID

wget https://raw.githubusercontent.com/yokoffing/Betterfox/main/user.js




# ---
echo "SLAP: Executing $0"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "SLAP: Killing Waybar"
if pgrep waybar >/dev/null; then
    pkill waybar
fi

mkdir -p ~/.config/waybar
cp "$SCRIPT_DIR/../waybar/config.jsonc" ~/.config/waybar/
cp "$SCRIPT_DIR/../waybar/style.css" ~/.config/waybar/
echo "SLAP: Copied waybar files"

mkdir -p ../waybar/fonts
cd ../waybar/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/JetBrainsMono.zip
mkdir -p ~/.local/share/fonts/JetBrainsMono
unzip JetBrainsMono.zip -d ~/.local/share/fonts/JetBrainsMono
rm JetBrainsMono.zip
fc-cache -fv

echo "SLAP: Reopening waybar"
nohup waybar >/dev/null 2>&1 & disown

echo "SLAP: FINISHED running $0"
