#  Startup 
# Commands to execute on startup (before the prompt is shown)
# Check if the interactive shell option is set
if [[ $- == *i* ]]; then
fi

 DISABLE_MAGIC_FUNCTIONS="true"
 ZSH_AUTOSUGGEST_MANUAL_REBIND=1
 DISABLE_AUTO_TITLE="true"

# Yazi Setup
export EDITOR="nvim"
function y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
    yazi "$@" --cwd-file="$tmp"
    IFS= read -r -d '' cwd < "$tmp"
    [ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
    rm -f -- "$tmp"
}

export EDITOR=nvim
export VISUAL=nvim

alias emc="nohup emacsclient -c & disown"
alias chezomi="chezmoi"
alias yeet='paru -Rcs'
alias n="nvim"
alias nn="nvim ~/syncthing/2026_Spring/notes"


# ----- good bloat identifier ------
# zmodload zsh/zprof
# # (Close and reopen terminal, then run:)
# zprof
# -----
