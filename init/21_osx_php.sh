# OSX-only stuff. Abort if not OSX.
is_osx || return 1

# Exit if Composer is not installed.
[[ ! "$(type -P composer)" ]] && e_error "Requires composer to install." && return 1

# php directory for composer alias
mkdir /usr/local/etc/php/7.1/conf.dis

# Install Laravel Installer
e_header "Installing Laravel Installer"
composer global require "laravel/installer"

# Install Symfony Installer
e_header "Installing Symfony Installer"
sudo curl -LsS https://symfony.com/installer -o /usr/local/bin/symfony
sudo chmod a+x /usr/local/bin/symfony

# Install Laravel Valet
e_header "Installing Laravel Valet"
composer global require laravel/valet
~/.composer/vendor/bin/valet install
