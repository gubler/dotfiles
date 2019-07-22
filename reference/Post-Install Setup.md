Post-Install Config

Once the initial installs run, you should do the following:

1. Log into 1Password
2. Move the Symfony CLI from `.symfony/bin` to `/usr/local/bin`
3. Install extra Homebrew packages with `brew bundle --file $DOTFILES_ROOT/docs/Brewfile-extra` (this is a lot of packages - you may want to
   trim it for the purposes of your new machine)

## Local Aliases

There are aliases that I create for work that I don't want in a public repository. During setup, a `.local_zsh_config.zsh` file is created in your home directory that you can add aliases to that will not be added to the repository.

## Install Extras

There are several scripts in the `post_install_scripts` folder for finishing setup of macOS.

- [macOS config](post_install_scripts/20_macos_config.sh)
- [macOS keyfixer](post_install_scripts/20_macos_keyfixer.sh)
- [macOS Sublime Text 3 setup](post_install_scripts/40_macos_sublime_text.sh)
- [macOS Terminal config](post_install_scripts/50_macos_terminal.sh)

After configuring Terminal, set the following preferences:

-  Termanal Menu > View > Allow Mouse Reporting
-  Terminal Menu > Preferences > Keyboard > Scroll alternate screen

This allows scrolling in vim buffers with the mouse.
