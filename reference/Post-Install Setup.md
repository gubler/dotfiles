# Post-Install Config

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

## gmvault

You need to do the initial sync with gmvault manually so that the authorization tokens can be saved and the recurring task can then do a quick sync.

These steps load a launchd agent to run gmvault every 15 minutes. **NOTE:** The paths on Lines 16, 24, and 26 must be full paths. You _cannot_ leave the ~ for your home directory.

1. Copy the `local.gmvault.plist` to `~/Library/LaunchAgents/`
2. Modify:
    * Line 11: The gmvault binary (`which gmvault`)
    * Line 16: Directory to backup to
    * Line 17: Email Address to backup
    * Line 24/26: Change the path for log file
3. Load the plist file: `launchctl load ~/Library/LaunchAgents/local.gmvault.plist`
