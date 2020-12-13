# Functions

function is_osx() {
  [[ "$OSTYPE" =~ ^darwin ]] || return 1
}

# Editor Config
export EDITOR='vim'
export VISUAL="$EDITOR"

## Command history configuration
if [ -z "$HISTFILE" ]; then
    HISTFILE=$HOME/.local/zsh/zsh_history
fi

HISTSIZE=10000
SAVEHIST=10000

# Show history
case $HIST_STAMPS in
  "mm/dd/yyyy") alias history='fc -fl 1' ;;
  "dd.mm.yyyy") alias history='fc -El 1' ;;
  "yyyy-mm-dd") alias history='fc -il 1' ;;
  *) alias history='fc -l 1' ;;
esac

setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups # ignore duplication command history list
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history # share command history data

# Prefer US English and use UTF-8
export LANG="en_US"
export LC_ALL="en_US.UTF-8"

# Make 'less' more.
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# MAKE FZF USE RIPGREP
export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'

# CONFIG NNN
export NNN_PLUG='z:fzcd;f:finder;o:fzopen;d:diffs;p:preview-tui;i:imgview'
export NNN_FCOLORS='c1e22d2e006033f7c6d6abc4'
export NNN_FIFO="/tmp/nnn.fifo"

