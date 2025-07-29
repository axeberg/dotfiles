# Useful shell functions

# Create directory and cd into it
mg() {
    mkdir -p "$@" && cd "$@" || return
}

# cd and list
cdl() {
    cd "$@" && ll
}

# Find and kill process on port
killport() {
    if [[ -z "$1" ]]; then
        echo "Usage: killport <port>"
        return 1
    fi
    lsof -i tcp:"$1" | awk 'NR!=1 {print $2}' | xargs kill -9 2>/dev/null
    echo "Killed processes on port $1"
}

# Get latest version of npm package
npm-latest() {
    if [[ -z "$1" ]]; then
        echo "Usage: npm-latest <package-name>"
        return 1
    fi
    npm info "$1" | grep latest
}

# Git diff with syntax highlighting
dif() {
    if [[ -z "$1" || -z "$2" ]]; then
        echo "Usage: dif <file1> <file2>"
        return 1
    fi
    git diff --color --no-index "$1" "$2" | delta
}

# Code diff
cdiff() {
    if [[ -z "$1" || -z "$2" ]]; then
        echo "Usage: cdiff <file1> <file2>"
        return 1
    fi
    code --diff "$1" "$2"
}

# Extract any archive
extract() {
    if [[ -f "$1" ]]; then
        case "$1" in
            *.tar.bz2)   tar xjf "$1"   ;;
            *.tar.gz)    tar xzf "$1"   ;;
            *.bz2)       bunzip2 "$1"   ;;
            *.rar)       unrar x "$1"   ;;
            *.gz)        gunzip "$1"    ;;
            *.tar)       tar xf "$1"    ;;
            *.tbz2)      tar xjf "$1"   ;;
            *.tgz)       tar xzf "$1"   ;;
            *.zip)       unzip "$1"     ;;
            *.Z)         uncompress "$1";;
            *.7z)        7z x "$1"      ;;
            *)           echo "'$1' cannot be extracted" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# Create a backup of a file
backup() {
    if [[ -z "$1" ]]; then
        echo "Usage: backup <file>"
        return 1
    fi
    cp "$1" "$1.backup.$(date +%Y%m%d-%H%M%S)"
}

# Quick notes
note() {
    local notes_dir="$HOME/notes"
    mkdir -p "$notes_dir"
    
    if [[ -z "$1" ]]; then
        # List notes
        ls -la "$notes_dir"
    elif [[ "$1" == "edit" ]]; then
        # Edit note
        $EDITOR "$notes_dir/${2:-$(date +%Y-%m-%d)}.md"
    else
        # Quick note
        echo "$(date '+%Y-%m-%d %H:%M:%S'): $*" >> "$notes_dir/$(date +%Y-%m-%d).md"
        echo "Note added to $notes_dir/$(date +%Y-%m-%d).md"
    fi
}

# Weather
weather() {
    curl -s "wttr.in/${1:-}"
}

# Cheatsheet
cheat() {
    if [[ -z "$1" ]]; then
        echo "Usage: cheat <command>"
        return 1
    fi
    curl -s "cheat.sh/$1"
}

# Quick HTTP server
serve() {
    local port="${1:-8000}"
    python3 -m http.server "$port"
}

# Git worktree helpers
gwt() {
    case "$1" in
        add)
            if [[ -z "$2" || -z "$3" ]]; then
                echo "Usage: gwt add <path> <branch>"
                return 1
            fi
            git worktree add "$2" "$3"
            ;;
        list|ls)
            git worktree list
            ;;
        remove|rm)
            if [[ -z "$2" ]]; then
                echo "Usage: gwt remove <path>"
                return 1
            fi
            git worktree remove "$2"
            ;;
        *)
            echo "Usage: gwt {add|list|remove}"
            ;;
    esac
}

# Docker helpers
docker-clean() {
    docker system prune -a --volumes -f
}

docker-stop-all() {
    docker stop $(docker ps -aq)
}

docker-remove-all() {
    docker rm $(docker ps -aq)
}

# Quick calculator
calc() {
    echo "$*" | bc -l
}

# Show PATH entries on separate lines
path() {
    echo "$PATH" | tr ':' '\n' | nl
}

# Reload shell configuration
reload() {
    source ~/.zshrc
    echo "Zsh configuration reloaded"
}

# FZF-powered functions
if command -v fzf >/dev/null 2>&1; then
    # cd to selected directory
    fcd() {
        local dir
        dir=$(fd --type d --hidden --follow --exclude .git . "${1:-.}" 2>/dev/null | fzf +m) && cd "$dir"
    }
    
    # Open file in editor
    fe() {
        local files
        files=$(fd --type f --hidden --follow --exclude .git . "${1:-.}" 2>/dev/null | fzf -m) && ${EDITOR:-vim} $files
    }
    
    # Git branch checkout
    fbr() {
        local branches branch
        branches=$(git --no-pager branch -vv) &&
        branch=$(echo "$branches" | fzf +m) &&
        git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
    }
    
    # Kill process
    fkill() {
        local pid
        pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')
        
        if [ "x$pid" != "x" ]; then
            echo "$pid" | xargs kill -${1:-9}
        fi
    }
fi