# Modern shell aliases

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias -- -='cd -'

# Listing (using eza instead of ls)
alias ls='eza --icons --group-directories-first'
alias l='eza -l --icons --group-directories-first'
alias la='eza -la --icons --group-directories-first'
alias ll='eza -l --icons --group-directories-first'
alias lt='eza --tree --icons'
alias tree='eza --tree --icons'

# Common directories
alias dl='cd ~/Downloads'
alias dt='cd ~/Desktop'
alias dev='cd ~/dev'
alias dot='cd ~/.local/share/chezmoi'  # Chezmoi source directory

# Git
alias g='git'
alias gs='git status'
alias gd='git diff'
alias gds='git diff --staged'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git pull'
alias gco='git checkout'
alias gb='git branch'
alias glg='git log --graph --oneline --decorate'

# Jujutsu
alias jjs='jj status'
alias jjd='jj diff'
alias jjl='jj log'
alias jjn='jj new'

# Editor shortcuts
alias v='nvim'
alias vi='nvim'
alias vim='nvim'
alias code='code'
alias zed='zed'

# Docker
alias dk='docker'
alias dkc='docker compose'
alias dkps='docker ps'
alias dkpa='docker ps -a'
alias dki='docker images'
alias dkex='docker exec -it'
alias dklog='docker logs -f'
alias dkprune='docker system prune -a'

# Kubernetes
alias k='kubectl'
alias kgp='kubectl get pods'
alias kgs='kubectl get services'
alias kgd='kubectl get deployments'
alias kaf='kubectl apply -f'
alias kdel='kubectl delete'
alias klog='kubectl logs -f'
alias kexec='kubectl exec -it'
alias kctx='kubectl config current-context'
alias kns='kubectl config view --minify --output "jsonpath={..namespace}"'

# Python
alias py='python3'
alias pip='pip3'
alias venv='python3 -m venv'
alias activate='source venv/bin/activate'

# pnpm (as primary package manager)
alias p='pnpm'
alias pi='pnpm install'
alias pa='pnpm add'
alias pad='pnpm add -D'
alias pr='pnpm run'
alias pd='pnpm dev'
alias pb='pnpm build'
alias pt='pnpm test'
alias pstart='pnpm start'

# npm (fallback for non-pnpm projects)
alias ni='npm install'
alias nr='npm run'
alias nstart='npm start'
alias nbuild='npm run build'
alias ntest='npm test'
alias ndev='npm run dev'

# Cargo
alias cr='cargo run'
alias cb='cargo build'
alias ct='cargo test'
alias cc='cargo check'
alias cf='cargo fmt'
alias cl='cargo clippy'

# System utilities
alias reload='source ~/.zshrc'
alias path='echo -e ${PATH//:/\\n}'
alias ports='lsof -i -P -n'  # More reliable than netstat on macOS
alias myip='curl -s ifconfig.me'
alias localip='ipconfig getifaddr en0'

# Modern replacements
alias cat='bat'
alias find='fd'
alias grep='rg'
alias sed='sd'
alias ps='procs'
alias top='btm'  # bottom
alias du='dust'
alias cd='z'     # zoxide

# macOS specific
if [[ "$OSTYPE" == "darwin"* ]]; then
  alias showfiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder'
  alias hidefiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder'
  alias cleanup="fd -H -I -t f -e DS_Store -x rm {}"
  alias emptytrash='rm -rf ~/.Trash/*'
  alias flushdns='sudo dscacheutil -flushcache && sudo killall -HUP mDNSResponder'
  alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
  alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"
  alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
fi

# Quick config edits with chezmoi
alias czsh='chezmoi edit ~/.zshrc'
alias cvim='chezmoi edit ~/.config/nvim/init.lua'
alias ctmux='chezmoi edit ~/.tmux.conf'
alias cgit='chezmoi edit ~/.gitconfig'

# Suffix aliases (open files with specific programs)
alias -s {js,ts,jsx,tsx,json}=code
alias -s {rs,toml}=zed
alias -s {md,txt}=nvim
alias -s {jpg,jpeg,png,gif}=open

# Global aliases
alias -g G='| grep'
alias -g L='| less'
alias -g H='| head'
alias -g T='| tail'
alias -g NE='2> /dev/null'
alias -g NUL='> /dev/null 2>&1'
