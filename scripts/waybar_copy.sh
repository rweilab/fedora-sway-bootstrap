SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/../lib.sh"
SLAP_PRINT "Executing $0"

SLAP_PRINT "Killing Waybar"
if pgrep waybar >/dev/null; then
    pkill waybar
fi

mkdir -p ~/.config/waybar
cp "$SCRIPT_DIR/../waybar/config.jsonc" ~/.config/waybar/
cp "$SCRIPT_DIR/../waybar/style.css" ~/.config/waybar/
SLAP_PRINT "Copied waybar files"

mkdir -p "$SCRIPT_DIR"/fonts
cd "$SCRIPT_DIR"/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/JetBrainsMono.zip
mkdir -p ~/.local/share/fonts/JetBrainsMono
unzip JetBrainsMono.zip -d ~/.local/share/fonts/JetBrainsMono
rm JetBrainsMono.zip
fc-cache -fv

SLAP_PRINT "Reopening waybar"
nohup waybar >/dev/null 2>&1 & disown

SLAP_PRINT "FINISHED running $0"
