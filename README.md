# axeberg - dotfiles

My preferred development environment configuration managed with [chezmoi](https://www.chezmoi.io/).

Everything runs on the **Catppuccin Latte** light theme across the full stack — terminal, editor, prompt, multiplexer, and CLI tools.

## Quick Start

### Install on a new machine (one command)
```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply axeberg/dotfiles
```

On first run, chezmoi will prompt for your git identities (name, email, SSH signing key filename) for each context — private, work, and homelab. These are stored locally in `~/.config/chezmoi/chezmoi.toml` and never committed to the repo. The values populate the per-directory gitconfigs via `includeIf`.

## What's Included

### Terminal & Shell
- **Zsh** with [Zinit](https://github.com/zdharma-continuum/zinit) plugin manager (syntax highlighting, autosuggestions, fzf-tab)
- **[Starship](https://starship.rs)** prompt (Pure preset, Catppuccin Latte palette)
- **[Ghostty](https://ghostty.org)** terminal with JetBrainsMono Nerd Font
- **[Atuin](https://atuin.sh)** for searchable shell history
- **[Zellij](https://zellij.dev)** and **tmux** multiplexers
- **[direnv](https://direnv.net)** for per-directory environment variables

### Editors
- **[Zed](https://zed.dev)** — primary editor with language-specific LSP, formatter, and linter configs for Rust, TypeScript, Python, and more
- **[Neovim](https://neovim.io)** with lazy.nvim and LSP support

### Version Control
- **Git** with [delta](https://github.com/dandavella/delta) (side-by-side diffs, Catppuccin Latte syntax theme) and [difftastic](https://github.com/Wilfred/difftastic) (AST-aware structural diffs)
- **[jj (Jujutsu)](https://github.com/jj-vcs/jj)** as an alternative VCS
- **[lazygit](https://github.com/jesseduffield/lazygit)** terminal UI for git

### Kubernetes
- **[k9s](https://k9scli.io)** — terminal UI for cluster management
- **[stern](https://github.com/stern/stern)** — multi-pod log tailing
- Plus helm, skaffold, devspace, and rancher CLI

### Modern CLI Replacements
| Classic | Replacement | What it does |
|---------|-------------|-------------|
| `ls`    | `eza`       | File listing with git status and icons |
| `cat`   | `bat`       | Syntax-highlighted file viewing |
| `grep`  | `ripgrep`   | Fast recursive search |
| `find`  | `fd`        | Intuitive file finding |
| `sed`   | `sd`        | Simpler find-and-replace |
| `cd`    | `zoxide`    | Frecency-based directory jumping |
| `du`    | `dust`      | Disk usage visualization |
| `ps`    | `procs`     | Process viewer |
| `top`   | `bottom`    | System monitor |

### Languages
Full LSP, formatter, and linter support configured for:
Rust, Go, Python, TypeScript/JavaScript, Zig, Ruby, Lua

## Repo Structure

```
dot_*                    → dotfiles (dot_zshrc → ~/.zshrc)
dot_config/              → ~/.config/
  Brewfile               → Homebrew packages
  ghostty/config         → Terminal config
  starship/starship.toml → Prompt config
  zed/settings.json      → Editor config
  zellij/config.kdl      → Multiplexer config
  zsh/aliases.zsh        → Shell aliases
  zsh/functions.zsh      → Shell functions
dot_gitconfig.tmpl       → Git config (includeIf for per-directory identity)
dot_gitconfigs/          → ~/.gitconfigs/ (private, work, homelab identities)
dot_zshrc                → Shell configuration
dot_zshenv               → Environment variables
.chezmoi.toml.tmpl       → Prompted setup (git identities, never committed)
.chezmoiscripts/         → One-time install scripts (Homebrew, Rust, macOS defaults)
```

## Usage

```bash
chezmoi diff              # Preview changes before applying
chezmoi apply -v          # Apply configuration
chezmoi update -v         # Pull latest and apply
chezmoi edit ~/.zshrc     # Edit a managed file
chezmoi add ~/.config/x   # Start managing a new file
```

## License

MIT
