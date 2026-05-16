SLAP_PRINT "Executing @p"

git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.config/emacs
~/.config/emacs/bin/doom install

SLAP_PRINT "FINISHED running $0"
