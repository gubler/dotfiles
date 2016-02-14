# OSX-only stuff. Abort if not OSX.
is_osx || return 1

# Exit if Homebrew is not installed.
[[ ! "$(type -P brew)" ]] && e_error "Brew casks need Homebrew to install." && return 1

# Ensure the cask keg and recipe are installed.
kegs=(caskroom/fonts)
brew_tap_kegs

fonts=(
	font-anonymous-pro
	font-hack
    font-meslo-lg
    font-inconsolata
)

# Install Homebrew casks.
fonts=($(setdiff "${fonts[*]}" "$(brew cask list 2>/dev/null)"))
if (( ${#fonts[@]} > 0 )); then
  e_header "Installing Homebrew fonts: ${fonts[*]}"
  for font in "${fonts[@]}"; do
    brew cask install $font
  done
  brew cask cleanup
fi
