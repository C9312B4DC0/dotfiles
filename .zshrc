# ╔══════════════════════════════════════════════════════════════════════════╗
# ║                             ZSH Configuration                            ║
# ╚══════════════════════════════════════════════════════════════════════════╝


# ┌──────────────────────────────────────────────────────────────────────────┐
# │                          Oh My Zsh Configuration                         │
# └──────────────────────────────────────────────────────────────────────────┘

# Path to Oh My Zsh installation
export ZSH="$HOME/.oh-my-zsh"

# Theme configuration (empty for Starship)
ZSH_THEME=""

# Oh My Zsh update behavior
zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' frequency 7    # check for updates every 7 days


# ┌──────────────────────────────────────────────────────────────────────────┐
# │                            History Settings                              │
# └──────────────────────────────────────────────────────────────────────────┘

HISTSIZE=50000
SAVEHIST=50000
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file
setopt SHARE_HISTORY             # Share history between all sessions


# ┌──────────────────────────────────────────────────────────────────────────┐
# │                          Completion Settings                             │
# └──────────────────────────────────────────────────────────────────────────┘


# Enable correction
ENABLE_CORRECTION="true"

# Show dots while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Completion styling
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'


# ┌──────────────────────────────────────────────────────────────────────────┐
# │                              Plugins                                     │
# └──────────────────────────────────────────────────────────────────────────┘

plugins=(
    # Core functionality
    git
    docker
    kubectl
    terraform
    ansible
    
    # Utility plugins
    ssh-agent
    sudo
    extract
    command-not-found
    
    # Enhancement plugins
    colored-man-pages
    history-substring-search
    fzf
    
    # Must be last
    zsh-autosuggestions
    zsh-syntax-highlighting
)


# ┌──────────────────────────────────────────────────────────────────────────┐
# │                          Load Oh My Zsh                                  │
# └──────────────────────────────────────────────────────────────────────────┘

source $ZSH/oh-my-zsh.sh



# ╔══════════════════════════════════════════════════════════════════════════╗
# ║                           User Configuration                             ║
# ╚══════════════════════════════════════════════════════════════════════════╝


# ┌──────────────────────────────────────────────────────────────────────────┐
# │                         Environment Variables                            │
# └──────────────────────────────────────────────────────────────────────────┘

# Language environment
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Preferred editor
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='micro'
else
    export EDITOR='micro'
fi

export VISUAL="code"

# Path additions (customize as needed)
# export PATH="$HOME/bin:$PATH"
# export PATH="$HOME/.local/bin:$PATH"


# ┌──────────────────────────────────────────────────────────────────────────┐
# │                              FZF Settings                                │
# └──────────────────────────────────────────────────────────────────────────┘

# Better FZF defaults
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border --preview "bat --color=always --style=header,grid --line-range :300 {}"'


# ┌──────────────────────────────────────────────────────────────────────────┐
# │                               Aliases                                    │
# └──────────────────────────────────────────────────────────────────────────┘

# Configuration shortcuts
alias zshconfig="$EDITOR ~/.zshrc"
alias ssconfig="$EDITOR ~/.config/starship.toml"

# Enhanced ls
alias ll='eza -lag --icons --git --header --group-directories-first --time-style=long-iso --color=always --classify --links --inode'

# Navigation shortcuts
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'


# ┌──────────────────────────────────────────────────────────────────────────┐
# │                        External Tool Integration                         │
# └──────────────────────────────────────────────────────────────────────────┘

# Initialize Starship prompt
eval "$(starship init zsh)"

# Initialize Zoxide (better cd)
eval "$(zoxide init zsh)"

# Load FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

. "$HOME/.atuin/bin/env"

eval "$(atuin init zsh)"
