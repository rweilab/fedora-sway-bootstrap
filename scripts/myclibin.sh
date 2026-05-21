SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/../lib.sh"
SLAP_PRINT "Executing $0"

SLAP_PRINT "Installing dependencies for doom emacs"

mkdir -p ~/bin
cp "$SCRIPT_DIR/date-progress ~/bin"
EMACS_DIR="$HOME/.config/emacs"

if [ -x "$EMACS_DIR/bin/doom" ]; then
    SLAP_PRINT "Doom already installed, skipping"
else
    echo "SLAP: Installing Doom Emacs"
    git clone --depth 1 https://github.com/doomemacs/doomemacs "$EMACS_DIR"
    "$EMACS_DIR/bin/doom" install
fi

SLAP_PRINT "FINISHED running $0"
