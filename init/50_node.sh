# Exit if Homebrew is not installed.
[[ ! "$(type -P node)" ]] && e_error "Node should have been installed via Homebrew" && return 1

npm install -g yarn
