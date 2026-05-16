# history
HISTFILE="$ZDOTDIR/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000

# completion
autoload -Uz compinit
compinit

# source all *.zsh modules
for file in "$ZDOTDIR"/*.zsh(.N); do
    [[ "$file" != "$ZDOTDIR/.zshrc" ]] && source "$file"
done

export EDITOR=nvim
