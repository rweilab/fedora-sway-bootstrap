#!/usr/bin/env bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/../lib.sh"
SLAP_PRINT "Executing $0"

nvim --headless "+Lazy! sync" +qa

nvim --headless \
"+MasonInstall \
lua-language-server \
rust-analyzer \
bash-language-server \
markdown-oxide \
clangd" \
+qa

SLAP_PRINT "FINISHED running $0"
  
