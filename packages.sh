#!/usr/bin/env bash
echo "SLAP: Executing $0"

set -e

echo "SLAP: Checking internet connectivity..."
if ! curl -fsI https://google.com >/dev/null; then
  echo "SLAP: No internet connection. Aborting install."
  exit 1
fi
echo "SLAP: Internet OK"



echo "SLAP: Installing COPR_PKGS"
COPR_PKGS=(lihaohong/yazi agriffis/neovim-nightly)
for arg in "${COPR_PKGS[@]}" ; do
  echo "SLAP: Enabling dnf copr package: $arg"
  sudo dnf -y copr enable $arg
done

# --- Using dnf install pkg --from-repo=

echo "SLAP: Installing PRIO_PKGS"
PRIO_PKGS=(
  neovim
)
PRIO_REPOS=(
  "copr:copr.fedorainfracloud.org:agriffis:neovim-nightly"
)

for i in "${!PRIO_PKGS[@]}"; do
  pkg="${PRIO_PKGS[$i]}"
  repo="${PRIO_REPOS[$i]}"

  echo "Installing $pkg from $repo"
  sudo dnf -y install "$pkg" --repo="$repo"
done

# --- Normal dnf install

echo "SLAP: Installing PKGS"
PKGS=(neovim yazi emacs tailscale syncthing)
for arg in "${PKGS[@]}" ; do
  echo "SLAP: Installing package: $arg"
  sudo dnf install -y $arg
done

echo "SLAP: Installing BONUS_PKGS"
BONUS_PKGS=(ripgrep fzf tealdeer ffmpeg fd-find)
for arg in ${BONUS_PKGS[@]} ; do
  echo "SLAP: Installing package: $arg"
  sudo dnf install -y $arg
done


echo "SLAP: Running auxiliary installer scripts"
chmod +x ./scripts/*.sh
./scripts/installer_doom_emacs.sh
./scripts/installer_protonvpn.sh
./scripts/zsh_bootstrap.sh

echo "SLAP: Running extra installer scripts"
./scripts/waybar_copy.sh
./scripts/kitty_bootstrap.sh

echo "SLAP: FINISHED running $0"
