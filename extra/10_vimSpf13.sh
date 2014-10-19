#!/usr/bin/env bash

function e_header()   { echo -e "\n\033[1m$@\033[0m"; }
function e_success()  { echo -e " \033[1;32m✔\033[0m  $@"; }
function e_error()    { echo -e " \033[1;31m✖\033[0m  $@"; }

# if [[ ! -d "$HOME/.spf13-vim-3" ]]; then
#   e_header "Installing spf13 for vim"

#   cd $HOME

#   curl http://j.mp/spf13-vim3 -L -o - | sh

# fi

# if [[ -d "$HOME/.spf13-vim-3" ]]; then
#   e_header "Updating spf13 for vim"

#   cd $HOME/.spf13-vim-3/

#   git pull
#   vim +BundleInstall! +BundleClean +q

# fi