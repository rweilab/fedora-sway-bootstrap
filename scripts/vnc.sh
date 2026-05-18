#!/usr/bin/env bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/../lib.sh"
SLAP_PRINT "Executing $0"

sudo mkdir -p /usr/local/bin
sudo tee /usr/local/bin/start-vnc > /dev/null << 'EOF'
#!/bin/bash

sudo firewall-cmd --add-port=5900/tcp --permanent
sudo firewall-cmd --reload

swaymsg create_output HEADLESS-1

wayvnc --output=HEADLESS-1 --max-fps=20 0.0.0.0 5900 &

echo -e "\033[1;33m=== WORKSPACES ===\033[0m"
swaymsg -t get_workspaces

echo
echo -e "\033[1;33m=== IP ADDRESSES ===\033[0m"
ip addr

echo
echo -e "\033[1;33mVNC should be available on port 5900\033[0m"
EOF

sudo chmod +x /usr/local/bin/start-vnc

echo "done"


SLAP_PRINT "FINISHED running $0"
