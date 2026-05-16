SLAP_PRINT "Executing @p"

SLAP_PRINT "Installing dependencies for doom emacs"
sudo dnf install -y emacs git ripgrep
SLAP_PRINT "Complete"

EMACS_DIR="$HOME/.config/emacs"

if [ -x "$EMACS_DIR/bin/doom" ]; then
    echo "SLAP: Doom already installed, skipping"
else
    echo "SLAP: Installing Doom Emacs"
    git clone --depth 1 https://github.com/doomemacs/doomemacs "$EMACS_DIR"
    "$EMACS_DIR/bin/doom" install
fi

SLAP_PRINT "FINISHED running $0"
