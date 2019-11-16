# SET DOTFILES ROOT
export DOTFILES_ROOT=$HOME/.config/dotfiles

# FIX PATH
PATH="/usr/local/bin:/usr/local/sbin:$DOTFILES_ROOT/bin:$HOME/Library/Python/3.7/bin:/usr/local/opt/python/libexec/bin:$PATH"
export -U PATH

# CONFIG Z

export _Z_DATA=$HOME/.local/.z

# LOAD ZSH PLUGINS & Z DIRECTORY NAVIGATOR
source $DOTFILES_ROOT/zsh_plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $DOTFILES_ROOT/zsh_plugins/zsh-you-should-use/you-should-use.plugin.zsh
source $DOTFILES_ROOT/zsh_plugins/sublime-text.zsh
source $DOTFILES_ROOT/bin/z/z.sh
source $DOTFILES_ROOT/zsh_plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

# SUBSTRING SEARCH CONFIG
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# THEME
fpath=( "$DOTFILES_ROOT/zsh_plugins/zfunctions" $fpath )
autoload -U promptinit; promptinit
prompt spaceship
spaceship_vi_mode_enable
export KEYTIMEOUT=1

# CONFIG
source $DOTFILES_ROOT/zsh_source/00_config.zsh

# ALIASES
source $DOTFILES_ROOT/zsh_source/01_aliases.zsh

if [ is_osx ]; then
    source $DOTFILES_ROOT/zsh_source/02_macos.zsh
else
    source $DOTFILES_ROOT/zsh_source/03_linux.zsh
fi


# Load local aliases
source $HOME/.local_zsh_config.zsh

# Autocomplete configuration
zstyle ':completion:*' completer _complete
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|=* r:|=*'
autoload -Uz compinit
compinit -u -d $HOME/.local/zsh/zcompdump

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
