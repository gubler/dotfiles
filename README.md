# Dotfiles

My macOS/ Ubuntu dotfiles.

### TL;DR

1. **Fork this repo to your own account.**
1. For macOS:
    - ```xcode-select --install```
    - Log into Mac App Store
1. ```export github_user=YOUR_GITHUB_USER_NAME```
1. ```bash -c "$(curl -fsSL https://raw.github.com/$github_user/dotfiles/master/bin/dotfiles)" && source ~/.bashrc```
1. Update ```~/.gitconfig``` with your name and email
1. Read the [post-install document](reference/Post-Install Setup.md)

## What This Is

I've been futzing around with bash and zsh for years and moving bits and pieces of my configurations around from machine to machine and platform to platform. After seeing all of the work put into various [dotfile repos](http://dotfiles.github.io/), I finally forked several and merged them into what I wanted.

The core of the system is by [@cowboy](https://github.com/cowboy/dotfiles/): execute a single command to "bootstrap" a new system to pull down all of my dotfiles and configs, as well as install all the tools I commonly use. In addition, be able to re-execute that command at any time to synchronize anything that might have changed. Finally, make it easy to re-integrate changes back in, so that other machines could be updated.

The command is [dotfiles][dotfiles].

## What, exactly, does the "dotfiles" command do?

When [dotfiles][dotfiles] is run _for the first time_, it does a few things:

1. In Ubuntu, Git is installed if necessary via APT (it's already there in macOS).
1. This repo is cloned into your user directory, under `~/.dotfiles`.
1. Files in `/copy` are copied into `~/`. ([read more](#the-copy-step))
1. Files in `/link` are symlinked into `~/`. ([read more](#the-link-step))
1. You are prompted to choose scripts in `/init` to be executed. The installer attempts to only select relevant scripts, based on the detected OS and the script filename.
1. Your chosen init scripts are executed (in alphanumeric order, hence the funky names). ([read more](#the-init-step))

On subsequent runs, step 1 is skipped, step 2 just updates the already-existing repo, and step 5 remembers what you selected the last time. The other steps are the same.

### Other subdirectories

* The `/backups` directory gets created when necessary. Any files in `~/` that would have been overwritten by files in `/copy` or `/link` get backed up there.
* The `/bin` directory contains executable shell scripts (including the [dotfiles][dotfiles] script) and symlinks to executable shell scripts. This directory is added to the path.
* The `/caches` directory contains cached files, used by some scripts or functions.
* The `/reference` holds extra config files
* The `/vendor` directory contains third-party libraries.

### The "copy" step
Any file in the `/copy` subdirectory will be copied into `~/`. Any file that _needs_ to be modified with personal information (like [copy/.gitconfig](copy/.gitconfig) which contains an email address and private key) should be _copied_ into `~/`. Because the file you'll be editing is no longer in `~/.dotfiles`, it's less likely to be accidentally committed into your public dotfiles repo.

### The "link" step
Any file in the `/link` subdirectory gets symlinked into `~/` with `ln -s`. Edit one or the other, and you change the file in both places. Don't link files containing sensitive data, or you might accidentally commit that data! If you're linking a directory that might contain sensitive data (like `~/.ssh`) add the sensitive files to your [.gitignore](.gitignore) file!

### The "init" step
Scripts in the `/init` subdirectory will be executed. A whole bunch of things will be installed, but _only_ if they aren't already.

#### macOS

* Minor XCode init via the [init/10_osx_xcode.sh](init/10_osx_xcode.sh) script.
* Homebrew via the [init/20_osx_homebrew.sh](init/20_osx_homebrew.sh) script. This script also installs (via the [Brewfile](Brewfile)):
  * Recipes
  * Casks
  * Fonts

## Hacking my dotfiles

Because the [dotfiles][dotfiles] script is completely self-contained, you should be able to delete everything else from your dotfiles repo fork, and it will still work. The only thing it really cares about are the `/copy`, `/link` and `/init` subdirectories, which will be ignored if they are empty or don't exist.

If you modify things and notice a bug or an improvement, [file an issue](https://github.com/gubler/dotfiles/issues) or [a pull request](https://github.com/gubler/dotfiles/pulls) and let me know.

Also, before installing, be sure to [read my gently-worded note](#heed-this-critically-important-warning-before-you-install).

## Installation
**Note:** Before running this, you may have to set Git to use HTTPS instead of GIT due to corporate firewalls (or whatever other reasons you may have). If so, run:

```sh
git config --global url."https://".insteadOf git://
```

### macOS Notes

* You need to be an administrator (for `sudo`).
* You need to have [XCode](https://developer.apple.com/downloads/index.action?=xcode) or, at the very minimum, the [XCode Command Line Tools](https://developer.apple.com/downloads/index.action?=command%20line%20tools), which are available as a much smaller download.

The easiest way to install the XCode Command Line Tools in macOS 10.9+ is to open up a terminal, type `xcode-select --install` and [follow the prompts](http://osxdaily.com/2014/02/12/install-command-line-tools-mac-os-x/).

### Heed this critically important warning before you install

**If you're not me, please _do not_ install dotfiles directly from this repo!**

Why? Because I often completely break this repo while updating. Which means that if I do that and you run the `dotfiles` command, your home directory will burst into flames, and you'll have to go buy a new computer. No, not really, but it will be very messy.

### Actual installation (for you)

1. [Read my gently-worded note](#heed-this-critically-important-warning-before-you-install)
1. Fork this repo
1. Open a terminal/shell and do this:

```sh
export github_user=YOUR_GITHUB_USER_NAME

bash -c "$(curl -fsSL https://raw.github.com/$github_user/dotfiles/master/bin/dotfiles)" && source ~/.bashrc
```

Since you'll be using the [dotfiles][dotfiles] command on subsequent runs, you'll only have to export the `github_user` variable for the initial install.

There's a lot of stuff that requires admin access via `sudo`, so be warned that you might need to enter your password here or there.

### Actual installation (for me)

```sh
bash -c "$(curl -fsSL https://bit.ly/gubler_dotfiles)" && source ~/.bashrc
```
### After Installation

After you run the install, you will need to:

* Configure the `.gitconfig` file that is copied to your home directory.
  - Set your name and email address at the top of the file
  - If you want to use the `https://` protocol instead of `git://`, you will need to uncomment the following from the bottom of the file:
  ~~~
  [url "https://"]
    insteadOf = git://
  ~~~

* Either copy your SSH keys from wherever you _securely_ store them or generate new ones with:

```sh
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
```

I have some additional [post-install configuration instructions](refence/Post-Install Setup.md).

## The "init" step
A whole bunch of things will be installed, but _only_ if they aren't already.

## The ~/ "copy" step
Any file in the `copy` subdirectory will be copied into `~/`. Any file that _needs_ to be modified with personal information (like [.gitconfig](copy/.gitconfig) which contains an email address and private key) should be _copied_ into `~/`. Because the file you'll be editing is no longer in `~/.dotfiles`, it's less likely to be accidentally committed into your public dotfiles repo.

This step will not copy over more recent versions of files.

## The ~/ "link" step
Any file in the `link` subdirectory gets symbolically linked with `ln -s` into `~/`. Edit these, and you change the file in the repo. Don't link files containing sensitive data, or you might accidentally commit that data!

Your .ssh folder is in the `link` directory, but rsa keys (public and private) as well as `known_hosts` and `authorized_keys` are ignored.

## Scripts
In addition to the aforementioned [dotfiles][dotfiles] script, there are a few other [bash scripts][bin].

* [dotfiles][dotfiles] - (re)initialize dotfiles. It might ask for your password (for `sudo`).
* Look through the [bin][bin] subdirectory for a few more.

## Credits
Modified from [@cowboy](https://github.com/cowboy/dotfiles), [@mathiasbynes](https://github.com/mathiasbynens/dotfiles) and [@paulirish](https://github.com/paulirish/dotfiles). I'm just riding on the hard work they've done (especially @cowboy).

[Cortex Podcast](https://www.relay.fm/cortex) wallpaper in reference directory by [GrafikSyndikat](https://grafiksyndikat.com/wallpaper/cortex-desktop/)

## License
Copyright (c) 2019 Daryl Gubler  
Licensed under the MIT license.
