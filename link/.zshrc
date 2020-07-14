# SET DOTFILES ROOT
DOTFILES_ROOT=$HOME/.config/dotfiles
# CONFIG Z
_Z_DATA=$HOME/.local/.z

# Path to your oh-my-zsh installation.
ZSH="$HOME/.oh-my-zsh"
# Path to oh-my-zsh custom directory
ZSH_CUSTOM="$DOTFILES_ROOT/zsh"
# Default theme - replaced by Starship
ZSH_THEME="candy"

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git fzf tmux vi-mode z)

source $ZSH/oh-my-zsh.sh

# User configuration

# FIX PATH
PATH="/usr/local/bin:/usr/local/sbin:$DOTFILES_ROOT/bin:$HOME/.bin:$HOME/Library/Python/3.7/bin:/usr/local/opt/python/libexec/bin:$PATH"
export -U PATH

# # CONFIG
# source $DOTFILES_ROOT/zsh_source/00_config.zsh
# # ALIASES
# source $DOTFILES_ROOT/zsh_source/01_aliases.zsh
# # OS Specific
# if [ is_osx ]; then
#     source $DOTFILES_ROOT/zsh_source/02_macos.zsh
# else
#     source $DOTFILES_ROOT/zsh_source/03_linux.zsh
# fi

# Load local aliases
source $HOME/.zshrc.local

# Starship Prompt
export STARSHIP_CONFIG=$DOTFILES_ROOT/config/starship.toml
eval "$(starship init zsh)"

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh
