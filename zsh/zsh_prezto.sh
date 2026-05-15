#!/usr/bin/env bash
set -e

echo "SLAP: Installing dependencies for zsh+prezdo"
sudo dnf install -y zsh git

if [ ! -d "$HOME/.zprezto" ]; then
  echo "SLAP: Cloning prezdo from github"
  git clone --recursive https://github.com/sorin-ionescu/prezto.git "$HOME/.zprezto"
fi

echo "SLAP: Running zpreszdo install commands"
for rcfile in "$HOME/.zprezto/runcoms/"*; do
  ln -sf "$rcfile" "$HOME/.$(basename "$rcfile")"
done

echo "SLAP: Changing login shell"
chsh -s $(which zsh)
