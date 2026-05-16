#!/usr/bin/env bash
SLAP_PRINT() {
    echo -e "\033[1;33mSLAP:\033[0m $*"
}

SLAP_PRINT "Executing $0"
sudo -v
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

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
done

# --- Normal dnf install

SLAP_PRINT "Installing PKGS"
PKGS=(neovim yazi emacs tailscale syncthing)
for arg in "${PKGS[@]}" ; do
  SLAP_PRINT "Installing package: $arg"
  sudo dnf install -y $arg
done

SLAP_PRINT "Installing BONUS_PKGS"
BONUS_PKGS=(ripgrep fzf tealdeer ffmpeg fd-find)
for arg in ${BONUS_PKGS[@]} ; do
  SLAP_PRINT "Installing package: $arg"
  sudo dnf install -y $arg
done

tldr --update
cp "$SCRIPT_DIR/Cat_at_Play_4k.png" ~/Pictures/


SLAP_PRINT "Running auxiliary installer scripts"
chmod +x ./scripts/*.sh
./scripts/installer_doom_emacs.sh
./scripts/installer_protonvpn.sh
./scripts/zsh_bootstrap.sh

SLAP_PRINT "Running extra installer scripts"
./scripts/waybar_copy.sh
./scripts/kitty_bootstrap.sh
./scripts/sway_override.sh
./scripts/firefox.sh




COUNT=4
while [ $COUNT -gt 0 ]; do
  SLAP_PRINT "!!! System reboot is required"
  COUNT=$(($COUNT - 1))
done

SLAP_PRINT "FINISHED running $0"
