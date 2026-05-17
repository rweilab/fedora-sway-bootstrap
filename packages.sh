#!/usr/bin/env bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/lib.sh"

SLAP_PRINT "Executing $0"
sudo -v
set -e

SLAP_PRINT "Checking internet connectivity..."
if ! curl -fsI https://google.com >/dev/null; then
  echo "SLAP: No internet connection. Aborting install."
  exit 1
fi
SLAP_PRINT "SLAP: Internet OK"


SLAP_PRINT "Installing COPR_PKGS"
COPR_PKGS=(lihaohong/yazi agriffis/neovim-nightly)
for arg in "${COPR_PKGS[@]}" ; do
  SLAP_PRINT "SLAP: Enabling dnf copr package: $arg"
  sudo dnf -y copr enable $arg
done

# --- Using dnf install pkg --from-repo=
SLAP_PRINT "Installing PRIO_PKGS"
PRIO_PKGS=(
  neovim
)
PRIO_REPOS=(
  "copr:copr.fedorainfracloud.org:agriffis:neovim-nightly"
)

for i in "${!PRIO_PKGS[@]}"; do
  pkg="${PRIO_PKGS[$i]}"
  repo="${PRIO_REPOS[$i]}"

  SLAP_PRINT "$pkg from $repo"
  sudo dnf -y install "$pkg" --from-repo="$repo"
  SLAP_PRINT "dnf versionlock adding: $pkg"
  sudo dnf versionlock add "$pkg"
done
#TODO remove nvim once dnf updates pkg to v0.12.x

# --- Normal dnf install
SLAP_PRINT "Installing PKGS"
PKGS=(neovim yazi emacs tailscale syncthing chezmoi)
for arg in "${PKGS[@]}" ; do
  SLAP_PRINT "Installing package: $arg"
  sudo dnf install -y $arg
done

SLAP_PRINT "Installing BONUS_PKGS"
BONUS_PKGS=(ripgrep fzf tealdeer ffmpeg fd-find nodejs npm rust cargo)
for arg in ${BONUS_PKGS[@]} ; do
  SLAP_PRINT "Installing package: $arg"
  sudo dnf install -y $arg
done
SLAP_PRINT "Updating TLDR cache"
tldr --update

SLAP_PRINT "Running auxiliary installer scripts"
chmod +x ./scripts/*.sh

SLAP_PRINT "Loading chezmoi"
./scripts/chezmoi.sh

SLAP_PRINT "Running /script installer scripts"
./scripts/catbg.sh
./scripts/installer_doom_emacs.sh
./scripts/installer_protonvpn.sh
./scripts/zsh_bootstrap.sh
# dont switch shell if already zsh
./scripts/waybar_copy.sh
./scripts/kitty_bootstrap.sh
# ./scripts/sway_override.sh
./scripts/firefox.sh
./scripts/flatpak.sh
# ./scripts/markdown_oxide.sh
# bypass in favor of Mason binary installation in nvim setup
# building markdown-oxide from source is taking to long


# TODO
# chezmoi add
# nvim headless run for plugin/lsp install
# service activate

# FURTHER EXPANSION IDEAS:
# https://github.com/swaywm/sway/wiki/Useful-add-ons-for-sway
# wlsunset?


COUNT=5
while [ $COUNT -gt 0 ]; do
  SLAP_PRINT "!!! System reboot is required"
  COUNT=$(($COUNT - 1))
done
./scripts/rebootyn.sh


SLAP_PRINT "FINISHED running $0"
