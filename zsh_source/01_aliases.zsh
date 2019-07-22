# FIX LS
if [[ "command -v exa" ]]; then
    alias l='exa -alh'
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

if [[ "command -v htop" ]]; then
    alias top='htop'
fi

# VAGRANT
if [[ "command -v vagrant" ]]; then
    alias va='vagrant'
    alias vu='vagrant up'
    alias vs='vagrant ssh'
    alias vus='vagrant up && vagrant ssh'
    alias vh='vagrant halt'
fi

# GIT
alias g='git'
function gc() { git checkout "${@:-master}"; } # Checkout master by default
alias gco='gc'
alias gst='git status'
alias gca='git commit -v -a'
alias gpom='git push origin master'

# PHP & SYMFONY
alias phing=vendor/bin/phing
alias sf=symfony
alias sfc='symfony console'
alias sfs='symfony serve'

function sfunit() { php bin/phpunit "$@" }
alias sfdr="sf doctrine:schema:drop --full-database --force -n && rm -rf /dev/shm/app && sf doctrine:migrations:migrate -n && sf doctrine:fixtures:load -n"
alias sfcc="rm -rf /dev/shm/app && sf cache:clear"

# FUN
alias dadjoke="curl -H \"Accept: text/plain\" https://icanhazdadjoke.com/; echo"
alias weather="curl wttr.in"
