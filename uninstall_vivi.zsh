#!/bin/zsh


set -e

PLUGIN_DIR="$HOME/.vivi"
ZSHRC="$HOME/.zshrc"

echo "Uninstalling vivi plugin..."


if [ -d "$PLUGIN_DIR" ]; then
    rm -rf "$PLUGIN_DIR"
    echo "Removed vivi files from $PLUGIN_DIR."
else
    echo "No vivi directory found at $PLUGIN_DIR."
fi


if grep -q "$PLUGIN_DIR/vivi.plugin.zsh" "$ZSHRC"; then
    sed -i "\|$PLUGIN_DIR/vivi.plugin.zsh|d" "$ZSHRC"
    echo "Removed vivi source line from .zshrc."
else
    echo "No vivi source line found in .zshrc."
fi

echo "vivi has been uninstalled successfully!"
