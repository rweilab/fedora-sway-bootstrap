SLAP_PRINT "Executing @p"

SLAP_PRINT "Installing dependencies for doom emacs"
sudo dnf install -y emacs git ripgrep
SLAP_PRINT "Complete"

git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.config/emacs
~/.config/emacs/bin/doom install

SLAP_PRINT "FINISHED running $0"
