# FIX LS
if [[ "command -v exa" ]]; then
    alias l='exa -alh --icons'
    alias lt='exa -lhT'
else
    alias l='ls -lah'
fi

# UTILITY
alias h='cd ~'
alias c='clear'
alias :q='exit'
alias cdf="cd $DOTFILES_ROOT"

# EDITOR
alias cim='vim'
alias vm='vim'
alias v='vim'

# APP REPLACEMENTS
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

# GIT
alias g='git'
function gc() { git checkout "${@:-master}"; } # Checkout master by default
alias gco='gc'
alias gst='git status'
alias gca='git commit -v -a'
alias gpo='git push origin'
alias gpom='git push origin main'

# PHP & SYMFONY
alias phing=vendor/bin/phing
alias sf=symfony
alias sfc='symfony console'
alias sfs='symfony serve'

function sfunit() { php bin/phpunit "$@" }
alias sfdr="sf doctrine:schema:drop --full-database --force -n && rm -rf /dev/shm/app && sf doctrine:migrations:migrate -n && sf doctrine:fixtures:load -n"
alias sfcc="rm -rf /dev/shm/app && sf cache:clear"

# tmux

# alias ta='tmux attach -t'
# alias tad='tmux attach -d -t'
# alias ts='tmux new-session -s'
# alias tl='tmux list-sessions'
# alias tksv='tmux kill-server'
# alias tkss='tmux kill-session -t'

# FUN
alias dadjoke="curl -H \"Accept: text/plain\" https://icanhazdadjoke.com/; echo"
alias weather="curl wttr.in"

# Run m4b-tool via docker (must have built image first)
alias m4b-tool='docker run -it --rm -u $(id -u):$(id -g) -v "$(pwd)":/mnt m4b-tool'


# NNN configuration
alias ls='nnn -e'
alias nnn='nnn -e'

# Docker Compose
alias dcom='docker run --rm --interactive --tty --volume `pwd`:/app odev/composer'
alias dcomi='docker run --rm --interactive --tty --volume `pwd`:/app odev/composer --ignore-platform-reqs'
alias dnpm='docker run --rm --interactive --tty -v `pwd`:/usr/src/app -w /usr/src/app odev/node npm'
alias dnpx='docker run --rm --interactive --tty -v `pwd`:/usr/src/app -w /usr/src/app odev/node npx'
alias dsc='docker-compose exec php bin/console'
alias dce='docker-compose exec'

# LazyGit/LazyDocker
alias ld='lazydocker'
alias gg='lazygit'

# TMUX
alias ta='tmux attach -t'
