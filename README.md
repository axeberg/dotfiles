# axeberg - dotfiels

My preferred development environment configuration managed with [Chezmoi](https://www.chezmoi.io/).

## 🚀 Quick Start

### Install on a new machine (one command)
```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply axeberg/dotfiles
```

## 📦 What's Included

### Terminal & Shell
- **Zsh** with Zinit plugin manager
- **Starship** prompt with custom theme
- **Ghostty** terminal (GPU-accelerated, modern)
- **tmux** and **Zellij** multiplexers

### Development Tools
- **Neovim** with lazy.nvim and LSP support
- **Zed** editor configuration
- **Git** with delta diff viewer
- **jj (Jujutsu)** version control
- **Rust** toolchain with cargo extensions

### Language Support
Full LSP, formatter, and linter support for:
- Rust, Go, Python, JavaScript/TypeScript
- Ruby, Java, C/C++, Zig
- Lua, Bash, YAML, JSON, Markdown

### Modern CLI Tools
- `eza` (better ls)
- `bat` (better cat)
- `ripgrep` (better grep)
- `fd` (better find)
- `zoxide` (better cd)
- `fzf` (fuzzy finder)
- And more... see `dot_config` folder for details

## 🛠️ Usage

### Preview changes before applying
```bash
chezmoi diff
```

### Apply configuration
```bash
chezmoi apply -v
```

### Update from repository
```bash
chezmoi update -v
```

### Edit a managed file
```bash
chezmoi edit ~/.zshrc
chezmoi apply
```

### Add a new dotfile
```bash
chezmoi add ~/.config/newapp/config
```

## 📁 Structure

- `dot_*` → `.` files (e.g., `dot_zshrc` → `~/.zshrc`)
- `dot_config/` → `~/.config/`
- `.chezmoiscripts/` → Installation scripts (run once)
- `.chezmoi.toml` → Chezmoi configuration
- `*.tmpl` → Template files for machine-specific configs

## ⚙️ Configuration

Edit `.chezmoi.toml` to set your personal information:
```toml
[data]
    name = "Your Name"
    email = "your.email@example.com"
```

## 🔧 Development

When working on the dotfiles:
```bash
# Use current directory as source
chezmoi --config .chezmoi.toml --source . diff
chezmoi --config .chezmoi.toml --source . apply
```

## 📝 License

MIT
