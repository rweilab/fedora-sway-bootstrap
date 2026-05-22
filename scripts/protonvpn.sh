SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/../lib.sh"
SLAP_PRINT "Executing $0"

wget "https://repo.protonvpn.com/fedora-$(cat /etc/fedora-release | cut -d' ' -f 3)-stable/protonvpn-stable-release/protonvpn-stable-release-1.0.4-1.noarch.rpm"

sudo dnf install -y ./protonvpn-stable-release-1.0.4-1.noarch.rpm && sudo dnf check-update --refresh 

sudo dnf install -y proton-vpn-gnome-desktop 

rm *.noarch.rpm

SLAP_PRINT "FINISHED running $0"
