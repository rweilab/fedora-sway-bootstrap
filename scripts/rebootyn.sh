#!/usr/bin/env bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/../lib.sh"
SLAP_PRINT "Executing $0"

read -rp ""SLAP_PRINT" "Reboot? (y/n):" " answer

if [[ "$answer" == "y" ]]; then
    SLAP_PRINT "Rebooting computer..."
    sleep 0.5
    sudo reboot now
else
    SLAP_PPRINT "Ok."
fi


SLAP_PRINT "FINISHED running $0"
