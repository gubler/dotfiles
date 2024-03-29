# Dotfiles

My dotfiles for macOS.

## Install

### Install Dependencies

- Install command line dev tools with `xcode-select --install`
- Log into Mac App Store
- Install Homebrew: `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`

### Install the dotfiles

- Clone the dotfiles to `~/.dotfiles`
- Install Applications via Homebrew: `brew bunde install --file ~/.dotfiles/Brewfile`
- Copy `~/.dotfiles/copy/.gitconfig` to home directory and edit NAME and EMAIL at top of file
- Run the macOS defaults config: `~/.dotfiles/bin/macosConfig.sh`

### Update

To update the dotfiles, run `sync-dotfiles`.
