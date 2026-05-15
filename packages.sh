echo "SLAP: Executing packages script"

COPR_PKGS=(lihaohong/yazi, agriffis/neovim-nightly)
for arg in ${COPR_PKGS[@]} ; do
  echo "SLAP: Enabling dnf copr package: $arg"
  dnf copr enable $arg
done

PKGS=(neovim yazi emacs tailscale syncthing)
for arg in ${PKGS[@]} ; do
  echo "SLAP: Installing package: $arg"
  dnf install -y $arg
done

BONUS_PKGS=(ripgrep fzf tealdeer ffmpeg fd-find)
for arg in ${BONUS_PKGS[@]} ; do
  echo "SLAP: Installing package: $arg"
  dnf install -y $arg
done

echo "SLAP: FINISHED running $0"
