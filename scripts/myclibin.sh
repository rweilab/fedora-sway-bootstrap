SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/../lib.sh"
SLAP_PRINT "Executing $0"

SLAP_PRINT "Installing dependencies for doom emacs"

mkdir -p ~/bin
cp "$SCRIPT_DIR/date-progress ~/bin"

SLAP_PRINT "FINISHED running $0"
