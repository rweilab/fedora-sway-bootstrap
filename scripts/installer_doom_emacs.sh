echo "SLAP: Executing @p"

git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.config/emacs
printf "n\n" | ~/.config/emacs/bin/doom install

echo "SLAP: FINISHED running $0"
