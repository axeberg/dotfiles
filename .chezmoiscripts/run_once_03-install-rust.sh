#!/usr/bin/env bash

set -euo pipefail

# Install Rust if not present
if ! command -v rustup &> /dev/null; then
    echo "Installing Rust..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    source "$HOME/.cargo/env"
else
    echo "Rust already installed, updating..."
    rustup update
fi

# Install components
rustup component add rust-analyzer rustfmt clippy rust-src

# Install essential cargo tools
cargo install --locked \
    cargo-edit \
    cargo-watch \
    cargo-outdated \
    cargo-audit \
    sccache \
    bacon || true

# Configure sccache
mkdir -p "$HOME/.cargo"
if ! grep -q "rustc-wrapper" "$HOME/.cargo/config.toml" 2>/dev/null; then
    cat >> "$HOME/.cargo/config.toml" << 'EOF'

[build]
rustc-wrapper = "sccache"
EOF
fi