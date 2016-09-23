#!/usr/bin/env bash

function e_header()   { echo -e "\n\033[1m$@\033[0m"; }
function e_success()  { echo -e " \033[1;32m✔\033[0m  $@"; }
function e_error()    { echo -e " \033[1;31m✖\033[0m  $@"; }

# Update homebrew recipes
brew update

# Tap extra sources
e_header "Tapping PHP..."
brew tap homebrew/dupes
brew tap homebrew/versions
brew tap homebrew/homebrew-php

# php base
e_header "Installing PHP 7.0 base"
brew install php70
brew install composer

e_success "Everything Installed"

