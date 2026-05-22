SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/../lib.sh"
SLAP_PRINT "Executing $0"

SLAP_PRINT "Killing Waybar"
if pgrep waybar >/dev/null; then
    pkill waybar
fi

# Note waybar heavy modified from https://github.com/HANCORE-linux/waybar-themes v2.2


SLAP_PRINT "Installing JetBrainsMono Nerdfont"
mkdir -p "$SCRIPT_DIR"/fonts
cd "$SCRIPT_DIR"/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/JetBrainsMono.zip
mkdir -p ~/.local/share/fonts/JetBrainsMono
unzip JetBrainsMono.zip -d ~/.local/share/fonts/JetBrainsMono
rm -rf "$SCRIPTS_DIR"/fonts
fc-cache -fv

SLAP_PRINT "Reopening waybar"
nohup waybar >/dev/null 2>&1 & disown

SLAP_PRINT "FINISHED running $0"
