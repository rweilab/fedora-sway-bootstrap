SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/../lib.sh"
SLAP_PRINT "Executing $0"

mkdir -p "$HOME/bin"
cp "$SCRIPT_DIR/date-progress" ~/bin

cat > "$HOME/bin/changebg" <<'EOF'
#!/usr/bin/env bash

"$HOME/repos/provision/changebg.sh" "$@"
EOF
chmod +x "$HOME/bin/changebg"

SLAP_PRINT "FINISHED running $0"
