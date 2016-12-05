#!/usr/bin/env bash

function e_header()   { echo -e "\n\033[1m$@\033[0m"; }
function e_success()  { echo -e " \033[1;32m✔\033[0m  $@"; }
function e_error()    { echo -e " \033[1;31m✖\033[0m  $@"; }

# Exit if Composer is not installed.
[[ ! "$(type -P composer)" ]] && e_error "Requires composer to install." && return 1

# Install Laravel Installer
e_header "Installing Laravel Installer"
composer global require "laravel/installer"

# Install Symfony Installer
e_header "Installing Symfony Installer"
sudo curl -LsS https://symfony.com/installer -o /usr/local/bin/symfony
sudo chmod a+x /usr/local/bin/symfony

e_success "Everything Installed"

