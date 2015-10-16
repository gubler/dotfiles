# Install Pygments
if [[ ! "$(type -P pygmentize)" ]]; then
  e_header "Installing Pygments"
  sudo easy_install Pygments
fi