# Initialize rbenv.
source $DOTFILES/source/50_ruby.sh

# Install Ruby.
if [[ "$(type -P rbenv)" ]]; then
  versions=(2.3.3)

  rubies=($(setdiff "${versions[*]}" "$(rbenv whence ruby)"))
  if (( ${#rubies[@]} > 0 )); then
    e_header "Installing Ruby versions: ${rubies[*]}"
    for r in "${rubies[@]}"; do
      rbenv install "$r"
      [[ "$r" == "${versions[0]}" ]] && rbenv global "$r"
    done
  fi
fi

gem install bundler
gem install awesome_print
gem install pry
gem install jekyll
