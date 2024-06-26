# SET DOTFILES ROOT
DOTFILES_ROOT=$HOME/.dotfiles

if [ $(uname -p) = "arm" ]; then
  HOMEBREW_ROOT="/opt/homebrew"
else
  HOMEBREW_ROOT="/usr/local"
fi

export EDITOR=nvim

# Set ULIMIT on MacOS
ulimit -n 10240

# Oh My ZSH CONFIG
# Path to your oh-my-zsh installation.
ZSH="$HOME/.oh-my-zsh"
# Path to oh-my-zsh custom directory
ZSH_CUSTOM="$DOTFILES_ROOT/zsh"
# Default theme - replaced by Starship
ZSH_THEME="candy"

plugins=(git fzf vi-mode zoxide)

source $ZSH/oh-my-zsh.sh

PATH="$HOMEBREW_ROOT/opt/curl/bin:$PATH" # Prefer Homebrew Curl
PATH="$HOME/.cargo/bin:$PATH"   # Add Rust/Cargo bin
PATH="$DOTFILES_ROOT/bin:$PATH" # Add custom scripts
PATH="$HOME/.bin:$PATH"         # Add scripts in ~/.bin
PATH="$HOME/.local/bin:$PATH"         # Add scripts in ~/.bin
PATH="$HOME/.composer/vendor/bin:$PATH" # Add global composer binaries
PATH="/usr/local/bin:/usr/local/sbin:$PATH" # Add /usr/local

export -U PATH

case $HIST_STAMPS in
  "mm/dd/yyyy") alias history='fc -fl 1' ;;
  "dd.mm.yyyy") alias history='fc -El 1' ;;
  "yyyy-mm-dd") alias history='fc -il 1' ;;
  *) alias history='fc -l 1' ;;
esac

setopt append_history # Append to the history file instead of replacing it
setopt extended_history # save both start time and execution duration
setopt hist_expire_dups_first # remove dups before unique events when trimmming history
setopt hist_ignore_dups # ignore duplication command history list
setopt hist_ignore_space # do not store commands with leading spaces to history
setopt hist_verify # load history expansions into editing buffer instead of executing them directly
setopt share_history # share command history data

# adding shhist to PATH, so we can use it from Terminal
PATH="${PATH}:/Applications/ShellHistory.app/Contents/Helpers"

# creating an unique session id for each terminal session
__shhist_session="${RANDOM}"

# prompt function to record the history
__shhist_prompt() {
    local __exit_code="${?:-1}"
    fc -lDt "%s" -1 | sudo --preserve-env --user ${SUDO_USER:-${LOGNAME}} shhist insert --session ${TERM_SESSION_ID:-${__shhist_session}} --username ${LOGNAME} --hostname $(hostname) --exit-code ${__exit_code}
    return ${__exit_code}
}

# integrating prompt function in prompt
precmd_functions=(__shhist_prompt $precmd_functions)

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
alias nnn='nnn -e'

# FIX LS
if [[ "command -v eza" ]]; then
    alias l='eza -alh --icons'
    alias lt='eza -lhT'
else
    alias l='ls -lah'
fi

alias h='cd ~'
alias c='clear'
alias :q='exit'
alias cdf="cd $DOTFILES_ROOT"
alias -- -="cd -"

# NeoVim
alias cim='nvim'
alias vm='nvim'
alias v='nvim'
alias vim='nvim'

# Composer
alias cm='composer'

# OTHER APPS

if [[ "command -v gcc-13" ]]; then
    export CC=gcc-13
fi

if [[ "command -v tmux" ]]; then
    alias tm="tmux"
fi

if [[ "command -v fd" ]]; then
    alias find="fd"
fi

if [[ "command -v bat" ]]; then
    alias c="bat"
fi

if [[ "command -v prettyping" ]]; then
    alias ping='prettyping --nolegend'
fi

if [[ "command -v gotop" ]]; then
    alias top='gotop'
fi

if [[ "command -v lazydocker" ]]; then
    alias ld='lazydocker'
fi

if [[ "command -v lazygit" ]]; then
    alias gg='lazygit'
fi

if [[ "command -v castor" ]]; then
    eval "$($HOME/.local/bin/castor completion zsh)"
    alias cs='castor'
fi

# Alias SSH to Kitty's SSH kitten if in Kitty Terminal
if [[ $TERM = "xterm-kitty" ]]; then
    alias ssh="kitty +kitten ssh"
fi

if [[ "command -v tldr" ]]; then
    alias tldrf='tldr --list | fzf --preview "tldr {1} --color=always" --preview-window=right,70% | xargs tldr'
fi

alias g='git'
function gc() { git checkout "${@:-master}"; } # Checkout master by default
alias gco='gc'
alias gst='git status'
alias gca='git commit -v -a'
alias gpo='git push origin'
alias gpot='git push origin && git push --tag origin'
alias gpom='git push origin main'

alias sf='symfony'

alias dadjoke="curl -H \"Accept: text/plain\" https://icanhazdadjoke.com/; echo"
alias weather="curl wttr.in"

# Trim new lines and copy to clipboard
alias pbc="tr -d '\n' | pbcopy"

# Flush Directory Service cache
alias flushdns="dscacheutil -flushcache"

# `o` with no arguments opens current directory
# otherwise opens the given location
function o() {
  if [ $# -eq 0 ]; then
    open .
  else
    open "$@"
  fi
}

# Simple calculator
function calc() {
        local result=""
        result="$(printf "scale=10;$*\n" | bc --mathlib | tr -d '\\\n')"
        #                       └─ default (when `--mathlib` is used) is 20
        #
        if [[ "$result" == *.* ]]; then
                # improve the output for decimal numbers
                printf "$result" |
                sed -e 's/^\./0./'        `# add "0" for cases like ".5"` \
                    -e 's/^-\./-0./'      `# add "0" for cases like "-.5"`\
                    -e 's/0*$//;s/\.$//'   # remove trailing zeros
        else
                printf "$result"
        fi
        printf "\n"
}

export STARSHIP_CONFIG=$HOME/.config/starship/starship.toml
eval "$(starship init zsh)"

source $HOMEBREW_ROOT/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOMEBREW_ROOT/share/zsh-history-substring-search/zsh-history-substring-search.zsh
source $HOMEBREW_ROOT/share/zsh-autosuggestions/zsh-autosuggestions.zsh

source $HOME/.cargo/env

