#!/usr/bin/env bash

function e_header()   { echo -e "\n\033[1m$@\033[0m"; }
function e_success()  { echo -e " \033[1;32m✔\033[0m  $@"; }
function e_error()    { echo -e " \033[1;31m✖\033[0m  $@"; }

# Exit if Homebrew is not installed.
[[ ! "$(type -P brew)" ]] && e_error "MariaDB needs Homebrew to install." && return 1

# Update homebrew recipes
brew update

# Install MariaDB
e_header "Installing MariaDB"
brew install mariadb

# Install MariaDB
e_header "Secure MariaDB"
mysql_secure_installation

e_success "Everything Installed"

