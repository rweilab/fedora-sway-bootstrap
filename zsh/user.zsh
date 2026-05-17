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
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
	command rm -f -- "$tmp"
}

export EDITOR=nvim
export VISUAL=nvim

alias chezomi="chezmoi"
alias n="nvim"
alias nn="nvim ~/syncthing/2026_Spring/notes"
alias c="clear"
alias rb="systemctl reboot"




export PATH="$HOME/.cargo/bin:$PATH"


# ----- good bloat identifier ------
# zmodload zsh/zprof
# # (Close and reopen terminal, then run:)
# zprof
# -----
