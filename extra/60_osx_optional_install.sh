#!/usr/bin/env bash

function e_header()   { echo -e "\n\033[1m$@\033[0m"; }
function e_success()  { echo -e " \033[1;32m✔\033[0m  $@"; }
function e_error()    { echo -e " \033[1;31m✖\033[0m  $@"; }


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

# acorn
# alfred
# anvil
# audacity
# audio-hijack-pro
# bartender
# base
# bettertouchtool
# caffeine
# calibre
# chronosync
# clarify
# codekit
# colloquy
# colorschemer-studio
# cord
# crashplan
# dropbox
# f-lux
# fantastical
# feeder
# ffmpegx
# firefox
# fluid
# google-chrome
# google-hangouts
# hazel
# hostbuddy
# hyperdock
# imagealpha
# imageoptim
# istat-menus
# iterm2
# kaleidoscope
# launchcontrol
# livereload
# marked2
# moom
# nvalt
# omnifocus
# omnigraffle
# pandoc
# paparazzi
# qlcolorcode
# qlimagesize
# qlmarkdown
# qlprettypatch
# qlstephen
# quicklook-csv
# quicklook-json
# rcdefaultapp
# screenflow
# sequel-pro
# shortcat
# sigil
# sketch
# skype
# soulver
# steam
# superduper
# taskpaper
# the-unarchiver
# totalfinder
# tower
# transmission
# transmit
# unison-usenet
# vagrant
# virtualbox
# virtualhostx
# vmware-fusion
# xld
# xscope

e_success "Optional Apps Installed"
echo "

You still need to add licenses for some, and download the rest of apps from the Mac App Store.

"

