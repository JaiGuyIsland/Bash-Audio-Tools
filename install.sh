#!/usr/bin/env bash
#
# install.sh - Install Bash Audio Tools
#
# Usage: ./install.sh
#
# Part of Bash Audio Tools by JaiGuyIsland
# https://github.com/JaiGuyIsland/Bash-Audio-Tools

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
INSTALL_DIR="${HOME}/.local/bin"

echo "🎧 Installing Bash Audio Tools..."

# ---------- Make scripts executable ----------
chmod +x "${SCRIPT_DIR}/audio-record" "${SCRIPT_DIR}/audio-playback"

# ---------- Create install dir ----------
mkdir -p "$INSTALL_DIR"

# ---------- Symlink ----------
ln -sf "${SCRIPT_DIR}/audio-record"   "${INSTALL_DIR}/audio-record"
ln -sf "${SCRIPT_DIR}/audio-playback" "${INSTALL_DIR}/audio-playback"

echo "✅ Installed to: $INSTALL_DIR"

# ---------- PATH check ----------
if [[ ":$PATH:" != *":${INSTALL_DIR}:"* ]]; then
    echo
    echo "⚠️  $INSTALL_DIR is not in your PATH."
    echo "   Add this to your ~/.bashrc (or ~/.zshrc):"
    echo
    echo "       export PATH=\"\$HOME/.local/bin:\$PATH\""
    echo
fi

# ---------- Dependency check ----------
echo
echo "Checking for a recorder..."
if command -v arecord >/dev/null 2>&1 || command -v sox >/dev/null 2>&1; then
    echo "  ✅ Found one."
else
    echo "  ⚠️  No recorder found. Install 'alsa-utils' or 'sox'."
fi

echo "Checking for a player..."
if command -v aplay >/dev/null 2>&1 || command -v paplay >/dev/null 2>&1 \
   || command -v play >/dev/null 2>&1 || command -v ffplay >/dev/null 2>&1; then
    echo "  ✅ Found one."
else
    echo "  ⚠️  No player found. Install 'alsa-utils', 'sox', or 'ffmpeg'."
fi

echo
echo "Done! Try: audio-record 5"
