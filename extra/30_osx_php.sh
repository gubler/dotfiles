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
# Installing 5.5 instead of 5.6 because: Work.
e_header "Installing PHP 5.5 base"
brew install php55
brew install php55-imagick
brew install php55-mcrypt
brew install php55-intl
brew install php55-opcache
brew install php55-xdebug
brew install composer

# phpQA toolchain
# - Not sure I need this since I usually have these
# - as they are usually in project specific composer files
# e_header "Installing PHPQA toolchain"
# brew install phpunit
# brew install phploc
# brew install pdepend
# brew install phpmd
# brew install php-code-sniffer
# brew install phpcpd
# brew install phpdocumentor

e_success "Everything Installed"
echo "

## Apache Config

You still need to add the following to your /etc/apache2/httpd.conf

LoadModule php5_module    /usr/local/opt/php55/libexec/apache2/libphp5.so

You may also need to create a /private/var/logs/apache2 directory.

## PHP Config

You also need to confure the following in /usr/local/etc/php/5.5 (my updated values are in parens:

* memory_limit (512M)
* post_max_size (25M)
* upload_max_filesize (25M)
* date.timezone ('America/New_York')

If you want to enable xdebug add the following to the bottom of php.ini:

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

