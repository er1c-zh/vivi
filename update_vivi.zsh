#!/bin/zsh



set -e

PLUGIN_DIR="$HOME/.vivi"

echo "Updating vivi plugin..."
if [ -d "$PLUGIN_DIR" ]; then
    git -C "$PLUGIN_DIR" pull
    echo "vivi updated successfully!"
else
    echo "Error: vivi is not installed. Please run the installation script first."
fi
