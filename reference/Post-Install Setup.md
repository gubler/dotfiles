# Post-Install Config

## Logins

Log into the following apps:

- 1Password
- Dropbox (Suggest selective sync until the Apps directories are synced)

## Local Aliases

There are aliases that I create for work that I don't want in a public repository. During setup, a `.local_aliases.sh` file is created in your home directory that you can add aliases to that will not be added to the repository.

## Install Extras

There are several extras in the [/extras](/extras) to finish up the install:

- [Vim Spf13 plugins suite](extras/10_vimSpf13.sh)
- [macOS config](extras/20_osx_config.sh)
- [macOS extra Homebrew applications](20_osx_homebrew_extra.sh)
- [macOS keyfixer](20_osx_keyfixer.sh)
- [macOS Sublime Text 3 setup](40_osx_sublime_text.sh)
- [macOS iTem2 and Terminal config](50_osx_item_and_terminal.sh)

## OfflineIMAP

Email is backed up from Fastmail via OfflineIMAP. To set up OfflineIMAP:

- Update `~/.offlineimaprc` (this was created during `.dotfiles` install). You will need to update the `remoteuser` and `remotepass` values.
    - The configuration file is designed to sync email from Fastmail to `~/Mail/Fastmail`. If you are using a different provider or want to sync to a different location, you will need to modify `~/.offlineimaprc` appropriately.
- Run `~/.dotfiles/extra/20_osx_homebrew_extra.sh`. This will install OfflineIMAP and start the service.
