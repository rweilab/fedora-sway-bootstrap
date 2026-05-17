#!/usr/bin/env bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/../lib.sh"
SLAP_PRINT "Executing $0"

commands=(
  "sudo dnf install -y rust cargo"

  "cargo install --locked --git https://github.com/Feel-ix-343/markdown-oxide.git markdown-oxide"
)

for cmd in "${commands[@]}"; do
  SLAP_PRINT "→ $cmd"
  eval "$cmd"
done



SLAP_PRINT "FINISHED running $0"
  
