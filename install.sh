#!/usr/bin/env bash
#
# install.sh - Install Bash Audio Tools
#
# Usage: ./install.sh   (must be run from inside the repo)

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
INSTALL_DIR="${HOME}/.local/bin"

echo "🎧 Installing Bash Audio Tools..."
echo

# ---------- Sanity check: are we in the repo? ----------
if [[ ! -f "${SCRIPT_DIR}/audio-record" || ! -f "${SCRIPT_DIR}/audio-playback" ]]; then
    echo "❌ Error: audio-record and/or audio-playback not found next to install.sh"
    echo "   Run this script from inside the cloned repository."
    exit 1
fi

# ---------- Make scripts executable ----------
chmod +x "${SCRIPT_DIR}/audio-record" "${SCRIPT_DIR}/audio-playback"

# ---------- Create install dir & symlink ----------
mkdir -p "$INSTALL_DIR"
ln -sf "${SCRIPT_DIR}/audio-record"   "${INSTALL_DIR}/audio-record"
ln -sf "${SCRIPT_DIR}/audio-playback" "${INSTALL_DIR}/audio-playback"

echo "✅ Symlinked to: $INSTALL_DIR"
echo

# ---------- PATH setup ----------
if [[ ":$PATH:" == *":${INSTALL_DIR}:"* ]]; then
    echo "✅ $INSTALL_DIR is already in your PATH."
else
    echo "⚠️  $INSTALL_DIR is not in your PATH."

    if [[ "${SHELL:-}" == *fish* ]]; then
        echo
        echo "   Fish detected. Run this once:"
        echo
        echo "       fish_add_path $INSTALL_DIR"
        echo
        echo "   Then restart your shell (or run 'exec fish')."
    else
        echo
        echo "   Add this to your ~/.bashrc or ~/.zshrc:"
        echo
        echo "       export PATH=\"\$HOME/.local/bin:\$PATH\""
        echo
        echo "   Then restart your shell (or run 'source ~/.bashrc')."
    fi
fi

echo
echo "🎉 Done! Open a new terminal and try:  audio-record 5"
