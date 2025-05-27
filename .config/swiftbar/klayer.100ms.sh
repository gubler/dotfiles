#!/bin/bash

LAYER_FILE="$HOME/.local/kmonad/layer"
KMONAD_PROC=$(pgrep -x kmonad)

# Check if kmonad is running
if [[ -z "$KMONAD_PROC" ]]; then
    echo "⚠️"
    echo "---"
    echo "KMonad not running"
    exit 0
fi

if [[ -f "$LAYER_FILE" ]]; then
    LAYER=$(<"$LAYER_FILE")
else
    LAYER="uninitialized"
fi

# Choose icon
case "$LAYER" in
mods)
    ICON="⌨️"
    ;;
open)
    ICON="🕹️"
    ;;
*)
    ICON="❗"
    ;;
esac

# Top bar output
echo "$ICON"

# Dropdown
echo "---"
echo "Current Layer: $LAYER"
