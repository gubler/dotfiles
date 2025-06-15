# Dotfiles

My dotfiles for macOS.
## PREREQUISITES

1. Install xcode command line tools: `xcode-select --install`
2. Install Homebrew

## SETUP

1. Clone this repository to `~/.dotfiles`.
2. Install Homebrew apps with Brewfile (`brew bunde install --file ~/.dotfiles/Brewfile`)
3. Symlink files into home directory: `cd ~/.dotfiles; stow .`
    - You may have some errors because default files were already created. You will have to clean those up.
4. Post-homebrew initialization: `~/.dotfiles/bin/dotfiles-init`
5. Update `~/.gitconfig` with your name and email
7. Update `~/.wegorc` with your OpenWeathermap API key
6. Create new SSH keys.
7. Run the macOS defaults config: `~/.dotfiles/bin/macosConfig.sh`

## UPDATE

1. Run `sync-dotfiles`

## Additional Setup

### Asimov

If this machine will be doing Time Machine updates, start Asimov

```bash
sudo brew services start asimov
```

### Tmux

1. Clone TPM to computer
```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```
2. Install plugins: Run `<prefix>+I` (that's a capital I) in tmux.

### Castor

Use the instructions from the [Castor github](https://github.com/jolicode/castor?tab=readme-ov-file#installation) for installation.

