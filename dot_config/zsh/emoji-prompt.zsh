# Emoji Prompt Feature
# Source this file in your ~/.zshrc.local to enable the emoji prompt

# Function to select random element from array
function random_element {
    declare -a array=("$@")
    r=$((RANDOM % ${#array[@]}))
    printf "%s\n" "${array[$r]}"
}

# Set emoji prompt
setEmoji () {
    EMOJI="$*"
    DISPLAY_DIR='$(dirs)'
    DISPLAY_BRANCH='$(git_branch)'
    PROMPT="${YELLOW}${DISPLAY_DIR}${GREEN}${DISPLAY_BRANCH}${RESET} ${EMOJI}"$'\n'"$ "
}

# Get new random emoji
newRandomEmoji () {
    setEmoji "$(random_element 😅 👽 🔥 🚀 👻 ⛄ 👾 🍔 😄 🍰 🐑 😎 🏎 🤖 😇 😼 💪 🦄 🥓 🌮 🎉 💯 ⚛️ 🐠 🐳 🐿 🥳 🤩 🤯 🤠 👨‍💻 🦸‍ 🧝‍ 🧞‍ 🧙‍ 👨‍🚀 👨‍🔬 🕺 🦁 🐶 🐵 🐻 🦊 🐙 🦎 🦖 🦕 🦍 🦈 🐊 🦂 🐍 🐢 🐘 🐉 🦚 ✨ ☄️ ⚡️ 💥 💫 🧬 🔮 ⚗️ 🎊 🔭 ⚪️ 🔱)"
}

# Git branch function
function git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\ \(\1\)/'
}

# Colors
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
RESET=$(tput sgr0)

# Allow substitution in PS1
setopt promptsubst

# Initialize with random emoji
newRandomEmoji

# Prompt aliases for quick theme changes
alias jestify="PS1=\"🃏\n$ \""
alias testinglibify="PS1=\"🐙\n$ \""
alias cypressify="PS1=\"🌀\n$ \""
alias staticify="PS1=\"🚀\n$ \""
alias nodeify="PS1=\"💥\n$ \""
alias reactify="PS1=\"⚛\n$ \""
alias harryify="PS1=\"🧙‍\n$ \""