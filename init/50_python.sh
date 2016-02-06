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

# Install gmvault
if [[ ! "$(type -P gmvault)" ]]; then
  e_header "Installing gmvault"
  sudo pip install gmvault
fi
