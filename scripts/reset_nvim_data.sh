#!/bin/zsh

# Directories to reset
DATA_DIR="$HOME/.local/share/nvim"
CACHE_DIR="$HOME/.cache/nvim"

echo "Resetting Neovim data and cache..."

# Remove data directory
if [ -d "$DATA_DIR" ]; then
  rm -rf "$DATA_DIR"
  echo "Removed: $DATA_DIR"
else
  echo "No data directory found at: $DATA_DIR"
fi

# Remove cache directory (optional)
if [ -d "$CACHE_DIR" ]; then
  rm -rf "$CACHE_DIR"
  echo "Removed: $CACHE_DIR"
else
  echo "No cache directory found at: $CACHE_DIR"
fi

echo "Neovim data and cache have been reset. Configuration remains intact."
