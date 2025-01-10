
#!/bin/zsh

# Vivi Installation Script
set -e

PLUGIN_NAME="vivi"
REPO_URL="https://github.com/rufevean/vivi.git"
PLUGIN_DIR="$HOME/.vivi"

# Step 1: Clone the repository
echo "Cloning vivi repository into $PLUGIN_DIR..."
if [ -d "$PLUGIN_DIR" ]; then
    echo "Repository already exists at $PLUGIN_DIR. Pulling latest changes..."
    git -C "$PLUGIN_DIR" pull
else
    git clone "$REPO_URL" "$PLUGIN_DIR"
fi

# Step 2: Add the plugin to .zshrc
if grep -q "$PLUGIN_NAME" ~/.zshrc; then
    echo "Plugin already added to .zshrc."
else
    echo "Adding vivi plugin to .zshrc..."
    echo "source $PLUGIN_DIR/vivi.plugin.zsh" >> ~/.zshrc
fi
