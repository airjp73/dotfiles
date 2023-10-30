# Some things are in bashrc so they can be picked up by Sublime Merge
source ~/.bashrc

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export NVIM_PATH=$(which nvim)

# Any sensitive info that shouldn't go in git
source "$HOME/.tokens"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Plugins
plugins=(git)
plugins+=(zsh-nvm)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
VSCODE_SETTINGS="$HOME/Library/Application Support/Code/User/settings.json"

# Make completions work
ZSH_DISABLE_COMPFIX=true

eval "$(starship init zsh)"

# NPM alias w/ autocompletion from current dir
# alias nr="npm run"

_npm_scripts() {
    # check package.json file in current directory
    if [ ! -f ./package.json ]; then
        return
    fi

    local scripts="$(node -e 'const { scripts } = require(`./package.json`); if (!scripts) process.exit(); let a = Object.entries(scripts); for (let s in scripts) { console.log(s); }' | grep -E ^$2)"
    local -a toks
    local tmp

    if [ -z "$scripts" ]; then
        return;
    fi

    while read -r tmp; do
        toks+=( "$tmp" )
    done <<< "$scripts"

    if [[ ${#toks[@]} -ne 0 ]]; then
        COMPREPLY+=( "${toks[@]}" )
    fi
}

complete -F _npm_scripts nr

# bun completions
[ -s "/Users/aaronpettengill/.bun/_bun" ] && source "/Users/aaronpettengill/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
