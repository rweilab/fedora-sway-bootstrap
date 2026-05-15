echo "SLAP: Executing @p"

echo "SLAP: Installing COPR_PKGS"
COPR_PKGS=(lihaohong/yazi, agriffis/neovim-nightly)
for arg in ${COPR_PKGS[@]} ; do
  echo "SLAP: Enabling dnf copr package: $arg"
  dnf copr enable $arg
done

echo "SLAP: Installing PKGS"
PKGS=(neovim yazi emacs tailscale syncthing)
for arg in ${PKGS[@]} ; do
  echo "SLAP: Installing package: $arg"
  dnf install -y $arg
done

echo "SLAP: Installing BONUS_PKGS"
BONUS_PKGS=(ripgrep fzf tealdeer ffmpeg fd-find)
for arg in ${BONUS_PKGS[@]} ; do
  echo "SLAP: Installing package: $arg"
  dnf install -y $arg
done


echo "SLAP: Running auxilary installer scripts"
./scripts/installer_doom_emacs.sh
./scripts/installer_protonvpn.sh

echo "SLAP: Running waybar script"
./scripts/waybar_copy.sh

echo "SLAP: FINISHED running $0"
