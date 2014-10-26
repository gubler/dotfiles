#!/usr/bin/env bash

function e_header()   { echo -e "\n\033[1m$@\033[0m"; }
function e_success()  { echo -e " \033[1;32m✔\033[0m  $@"; }
function e_error()    { echo -e " \033[1;31m✖\033[0m  $@"; }

# Update homebrew recipes
brew update

# Tap extra sources
e_header "Tapping PHP..."
brew tap homebrew/homebrew-php

# php base
e_header "Installing PHP base"
brew install php56
brew install php56-imagick
brew install php56-mcrypt
brew install php56-intl
brew install php56-opcache
brew install php56-xdebug
brew install composer

# phpQA toolchain
e_header "Installing PHPQA toolchain"
brew install phpunit
brew install phploc
brew install pdepend
brew install phpmd
brew install php-code-sniffer
brew install phpcpd
brew install phpdocumentor

e_success "Everything Installed"
echo "

You still need to add the following to your /etc/apache2/httpd.conf

LoadModule php5_module    /usr/local/opt/php56/libexec/apache2/libphp5.so

You also need to set a timezone in /usr/local/etc/php/5.6

If you want to enable xdebug add the following:

[Xdebug]
xdebug.max_nesting_level = 250
xdebug.remote_enable = 1
xdebug.remote_port = 9000
xdebug.idekey = PHPSTORM
xdebug.remote_host = 'localhost'
xdebug.remote_handler="dbgp"
xdebug.remote_mode = req
xdebug.profiler_enable = 0
xdebug.profiler_enable_trigger = 1
xdebug.profiler_output_dir = '/tmp'

"

