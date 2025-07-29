#!/usr/bin/env bash

# macOS Random Accent Color
# Sets a random system accent and highlight color

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Check if we're on macOS
if [[ "$OSTYPE" != "darwin"* ]]; then
    echo "This script only works on macOS"
    exit 1
fi

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    echo "Node.js is required but not installed"
    exit 1
fi

# Run the color randomizer
node "$SCRIPT_DIR/macos-random-accent-color.js" "$@"