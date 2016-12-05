#!/usr/bin/env bash

function e_header()   { echo -e "\n\033[1m$@\033[0m"; }
function e_success()  { echo -e " \033[1;32m✔\033[0m  $@"; }
function e_error()    { echo -e " \033[1;31m✖\033[0m  $@"; }

# Exit if Composer is not installed.
[[ ! "$(type -P composer)" ]] && e_error "Valet needs composer to install." && return 1

# Exit if Homebrew is not installed.
[[ ! "$(type -P brew)" ]] && e_error "Valet needs Homebrew to install." && return 1

# Update homebrew recipes
brew update

# Install Laravel Valet
e_header "Installing Laravel Valet"
composer global require laravel/valet
~/.composer/vendor/bin/valet install

e_success "Everything Installed"

