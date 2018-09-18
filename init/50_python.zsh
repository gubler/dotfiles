# Update pip and setuptools
sudo pip3 install --upgrade pip3 setuptools

# Install Pygments
if [[ ! "$(type -P pygmentize)" ]]; then
  e_header "Installing Pygments"
  sudo pip3 install Pygments
  sudo pip3 install pygments-style-github
fi

# Install Sphinx
if [[ ! "$(type -P sphinx-build)" ]]; then
  e_header "Installing Sphinx"
  sudo pip3 install Sphinx
fi

# Install Mutagen
if [[ ! "$(type -P mutagen-inspect)" ]]; then
  e_header "Installing Mutagen"
  sudo pip3 install mutagen
fi
