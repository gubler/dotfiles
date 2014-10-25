#!/usr/bin/env bash

function e_header()   { echo -e "\n\033[1m$@\033[0m"; }
function e_success()  { echo -e " \033[1;32m✔\033[0m  $@"; }
function e_error()    { echo -e " \033[1;31m✖\033[0m  $@"; }

# Install native apps

apps=(
  alfred
  dropbox
  google-chrome
  google-chrome-canary
  qlcolorcode
  qlprettypatch
  qlmarkdown
  qlstephen
  quicklook-json
  quicklook-csv
  slack
  transmit
  firefox
  hazel
  vagrant
  iterm2
  sublime-text3
  virtualbox
  flux
  tower
  nvalt
  skype
  transmission
  imagealpha
  imageoptim
  the-unarchiver
  acorn
  audio-hijack-pro
  bartender
  base
  bettertouchtool
  caffeine
  calibre
  chronosync
  clarify
  codekit
  colloquy
  crashplan
  fantastical
  feeder
  fluid
  hazel
  hyperdock
  istat-menus
  livereload
  marked
  moom
  omnifocus
  omnigraffle
  pandoc
  rcdefaultapp
  screenflow
  sequel-pro
  shortcat
  sigil
  soulver
  steam
  superduper
  totalfinder
  unison-usenet
  virtualhostx
  xld
  audiobook-builder
  default-folder-x
  eaglefiler
  handbrake
  hyperswitch
  keyboard-maestro
  levelator
  minecraft
  pdfpenpro
  phpstorm
  scansnap-manager
  scrivener
  simple-comic
  textexpander
  totalfinder
  fission
  boot2docker
  skype
  fuze
  betterzipql
)

# Install apps to /Applications
# Default is: /Users/$user/Applications
e_header "installing apps..."
brew cask install --appdir="/Applications" ${apps[@]}


e_header "linking to Alfred"
brew cask alfred link

e_success "Optional Apps Installed"
echo "

You still need to add licenses for some, and download the rest of apps from the Mac AppStore.

"

