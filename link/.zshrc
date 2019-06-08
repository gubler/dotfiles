# Functions

function is_osx() {
  [[ "$OSTYPE" =~ ^darwin ]] || return 1
}


# Load ZSH PLUGINS & Z DIRECTORY NAVIGATOR
source $HOME/.dotfiles/zsh_plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
source $HOME/.dotfiles/bin/z/z.sh
source $HOME/.dotfiles/zsh_plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/.dotfiles/zsh_plugins/zsh-you-should-use/you-should-use.plugin.zsh
source $HOME/.dotfiles/zsh_plugins/zsh-lux/zsh-lux.plugin.zsh
source $HOME/.dotfiles/zsh_plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# THEME
source $HOME/.dotfiles/zsh_plugins/powerlevel10k/powerlevel10k.zsh-theme
source $HOME/.dotfiles/zsh_plugins/purepower

# CONFIG

# Editor Config
if [[ "$OSTYPE" =~ ^darwin ]]; then
    export EDITOR='subl -w'
    export LESSEDIT='subl %f'
else
    export EDITOR='vim'
fi

export VISUAL="$EDITOR"

## Command history configuration
if [ -z "$HISTFILE" ]; then
    HISTFILE=$HOME/.zsh_history
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

# ALIASES
alias l='exa -alh'
alias lt='exa -lhT'

alias du="ncdu --color dark -rr -x --exclude .git --exclude node_modules"
alias find="fd"
alias c="bat"
alias ping='prettyping --nolegend'
alias top="sudo htop"

# Git shortcuts
alias g='git'
function gc() { git checkout "${@:-master}"; } # Checkout master by default
alias gco='gc'
alias gst='git status'
alias gca='git commit -v -a'

# Symfony/PHP
alias phing=vendor/bin/phing
alias sf=bin/console

# Vagrant
alias v=vagrant
alias vu="vagrant up"
alias vs="vagrant ssh"
alias vus="vagrant up && vagrant ssh"
alias vh="vagrant halt"

# Fun
alias dadjoke="curl -H \"Accept: text/plain\" https://icanhazdadjoke.com/; echo"
alias weather="curl wttr.in"

# Apt Package Search
alias apt-search="apt-cache search"

if [[ "$OSTYPE" =~ ^darwin ]]; then
    # APPLE, Y U PUT /usr/bin B4 /usr/local/bin?!
    PATH="/usr/local/bin:/usr/local/sbin:$HOME/Library/Python/3.7/bin:/usr/local/opt/python/libexec/bin:$PATH"

    export -U PATH

    # Trim new lines and copy to clipboard
    alias pbc="tr -d '\n' | pbcopy"
    alias dokku='bash $HOME/.dokku/contrib/dokku_client.sh'
    alias yt=youtube-dl
    alias ic='cd ~/Library/Mobile\ Documents/com~apple~CloudDocs'

    # Flush Directory Service cache
    alias flushdns="dscacheutil -flushcache"

    # `s` with no arguments opens the current directory in Sublime Text, otherwise
    # opens the given location
    function s() {
      if [ $# -eq 0 ]; then
        subl .
      else
        subl "$@"
      fi
    }

    # add support for ctrl+o to open selected file in sublime
    export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(s {})+abort'"

    # `o` with no arguments opens current directory, otherwise opens the given
    # location
    function o() {
      if [ $# -eq 0 ]; then
        open .
      else
        open "$@"
      fi
    }
fi

# Load local aliases
source $HOME/.local_aliases.zsh
