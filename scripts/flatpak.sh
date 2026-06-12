#!/usr/bin/env bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/../lib.sh"
SLAP_PRINT "Executing $0"

commands=(
  "flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo"

  "flatpak install -y flathub io.github.flattool.Warehouse"
  "flatpak install -y flathub com.parsecgaming.parsec"
  "flatpak install -y flathub org.onlyoffice.desktopeditors"
  "flatpak install -y flathub md.obsidian.Obsidian"
  "flatpak install -y flathub com.adilhanney.saber"
  "flatpak install flathub com.spotify.Client"
)

for cmd in "${commands[@]}"; do
  SLAP_PRINT "→ $cmd"
  eval "$cmd"
done



SLAP_PRINT "FINISHED running $0"
