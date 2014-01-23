#!/usr/bin/env bash

function e_header()   { echo -e "\n\033[1m$@\033[0m"; }
function e_success()  { echo -e " \033[1;32m✔\033[0m  $@"; }
function e_error()    { echo -e " \033[1;31m✖\033[0m  $@"; }

# Install PHP
brew tap homebrew/dupes
brew install homebrew/dupes/grep
brew tap josegonzalez/homebrew-php
brew install php55
brew install php55-imagick
brew install php55-mcrypt
brew install php55-intl
brew install php55-opcache
brew install php55-xdebug
brew install composer

# phpQA toolchain
brew install phpunit
brew install phploc
brew install pdepend
brew install phpmd
brew install php-code-sniffer
brew install phpcpd

# Install native apps
brew tap phinze/homebrew-cask
brew install brew-cask

# function installcask() {
#   brew cask install "${@}" 2> /dev/null
# }

# installcask dropbox
# installcask google-chrome
# installcask google-chrome-canary
# installcask imagealpha
# installcask imageoptim
# installcask iterm2
# installcask the-unarchiver
# installcask transmission
# installcask virtualbox

# brew tap caskroom/versions
# installcask sublime-text3

brew cask alfred link

e_success "Everything Installed"
echo "

You still need to add the following to your /etc/apache2/httpd.conf

LoadModule php5_module    /usr/local/opt/php55/libexec/apache2/libphp5.so

You also need to set a timezone in /usr/local/etc/php/5.5"

