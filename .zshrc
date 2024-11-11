# SET DOTFILES ROOT
DOTFILES_ROOT=$HOME/.dotfiles

# SET DEFAULT EDITOR
export EDITOR=nvim

# SET ULIMIT ON MAC
ulimit -n 10240

# SET HOMEBREW SHELL ENV VARS
eval "$(/opt/homebrew/bin/brew shellenv zsh)"

# CLEAN UP PATH
PATH="$HOMEBREW_PREFIX/opt/curl/bin:$PATH" # Prefer Homebrew Curl
PATH="$DOTFILES_ROOT/bin:$PATH" # Add custom scripts
PATH="$HOME/.bin:$PATH"         # Add scripts in ~/.bin
PATH="$HOME/.local/bin:$PATH"         # Add scripts in ~/.bin
PATH="$HOME/.composer/vendor/bin:$PATH" # Add global composer binaries
PATH="/usr/local/bin:/usr/local/sbin:$PATH" # Add /usr/local

export -U PATH

# Allow insecure completions (this is due to ZSH being installed by admin account)
ZSH_DISABLE_COMPFIX="true"

# HISTORY CONFIGURATION
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

# ADD SHELLHISTORY APP CONFIG
# adding shhist command
PATH="$PATH:/Applications/ShellHistory.app/Contents/Helpers"
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

# PREFER US ENGLISH AND USE UTF-8
export LANG="en_US"
export LC_ALL="en_US.UTF-8"

# MAKE 'LESS' MORE.
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# MAKE FZF USE RIPGREP
export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'

# FIX LS
if [[ "command -v eza" ]]; then
    alias l='eza -alh --icons'
    alias lt='eza -lhT'
else
    alias l='ls -lah'
fi

alias c='clear'
alias :q='exit'
alias cdf="cd $DOTFILES_ROOT"
alias -- -="cd -"
alias ..='cd ..'
alias ...='cd ../..'

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

if [[ "command -v gcc-14" ]]; then
    export CC=gcc-14
    alias gcc-13='gcc-14'
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
    alias ca='castor'
fi

if [[ "command -v zoxide" ]]; then
    eval "$(zoxide init zsh)"
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

PURE_GIT_PULL=0
if [[ "$OSTYPE" == darwin* ]]; then
  fpath+=("$(brew --prefix)/share/zsh/site-functions")
else
  fpath+=($HOME/.zsh/pure)
fi
autoload -U promptinit; promptinit
prompt pure

source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-history-substring-search/zsh-history-substring-search.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# Set PhpStorm as the editor for Symfony Error Pages
export SYMFONY_IDE="phpstorm"
