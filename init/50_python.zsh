# Update pip and setuptools
sudo pip install --upgrade pip setuptools

# Install Pygments
if [[ ! "$(type -P pygmentize)" ]]; then
  e_header "Installing Pygments"
  sudo pip install Pygments
  sudo pip install pygments-style-github
fi

# Install Sphinx
if [[ ! "$(type -P sphinx-build)" ]]; then
  e_header "Installing Sphinx"
  sudo pip install Sphinx
fi

# Install Mutagen
if [[ ! "$(type -P mutagen-inspect)" ]]; then
  e_header "Installing Mutagen"
  sudo pip install mutagen
fi
