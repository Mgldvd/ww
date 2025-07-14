#!/usr/bin/env bash
# install wiwi as `ww` and place YAML in ~/.config/ww

set -euo pipefail

TARGET_BIN="/usr/local/bin/ww"
CONFIG_DIR="$HOME/.config/ww"

sudo install -m755 ww "$TARGET_BIN"
mkdir -p "$CONFIG_DIR"
cp -n *.yml "$CONFIG_DIR" 2>/dev/null || true

echo "Installed. Put more .yml files in $CONFIG_DIR or run ww in directories containing them."
