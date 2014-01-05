# Dotfiles

My OS X / Ubuntu dotfiles.

## TODO

* Update README
* Revise Cask lists
  * Install important apps in ```extra/30_osx_install.sh```
  * install remaining apps in ```extra/60_osx_optional_install.sh```

## What This Is

I've been futzing around with bash and zsh for years and moving bits and peices of my configurations around from machine to machine and platform to platform. After seeing all of the work put into various [dotfile repos](http://dotfiles.github.io/), I finally forked several and merged them into what I wanted.

The core of the system is by [@cowboy](https://github.com/cowboy/dotfiles/): execute a single command to "bootstrap" a new system to pull down all of my dotfiles and configs, as well as install all the tools I commonly use. In addition, be able to re-execute that command at any time to synchronize anything that might have changed. Finally, make it easy to re-integrate changes back in, so that other machines could be updated.

The command is [dotfiles][dotfiles].

[dotfiles]: bin/dotfiles
[bin]: https://github.com/cowboy/dotfiles/tree/master/bin

## What, exactly, does the "dotfiles" command do?

It's really not very complicated. When [dotfiles][dotfiles] is run, it does a few things:

1. Git is installed if necessary, via APT or Homebrew (which is installed if necessary).
2. This repo is cloned into the `~/.dotfiles` directory (or updated if it already exists).
2. Files in `init` are executed (in alphanumeric order, hence the "50_" names).
3. Files in `copy` are copied into `~/`.
4. Files in `link` are linked into `~/`.

Note:

* The `backups` folder only gets created when necessary. Any files in `~/` that would have been overwritten by `copy` or `link` get backed up there.
* Files in `bin` are executable shell scripts (Eg. [~/.dotfiles/bin][bin] is added into the path).
* Files in `source` get sourced whenever a new shell is opened (in alphanumeric order, hence the "50_" names).
* Files in `conf` just sit there. If a config file doesn't _need_ to go in `~/`, put it in there.
* Files in `caches` are cached files, only used by some scripts. This folder will only be created if necessary.

### What about the other folders?

* `libs` is for submoduled applications
* `extra` are scripts to be run once. They aren't hooked into the regular dotfiles command due to either needing input during execution or taking a long, long time to run.
* `reference` holds extra config files as well as an [app log][references/application_list.md] that includes apps, plugins, browser extensions, etc...

## Installation
### OS X Notes

* You need to be an administrator (for `sudo`).
* You need to have installed [XCode](https://developer.apple.com/downloads/index.action?=xcode) or, at the very minimum, the [XCode Command Line Tools](https://developer.apple.com/downloads/index.action?=command%20line%20tools), which are available as a _much smaller_ download thank XCode.

### Ubuntu Notes

* You need to be an administrator (for `sudo`).
* You might want to set up your ubuntu server [like I do it](/cowboy/dotfiles/wiki/ubuntu-setup), but then again, you might not.
* Either way, you should at least update/upgrade APT with `sudo apt-get -qq update && sudo apt-get -qq dist-upgrade` first.

### Actual Installation

```sh
bash -c "$(curl -fsSL https://bit.ly/gubler_dotfiles)" && source ~/.bashrc
```

If, for some reason, [bit.ly](https://bit.ly/) is down, you can use the canonical URL.

```sh
bash -c "$(curl -fsSL https://raw.github.com/gubler/dotfiles/master/bin/dotfiles)" && source ~/.bashrc
```

## The "init" step
A whole bunch of things will be installed, but _only_ if they aren't already.

### OS X
* Homebrew recipes
  * bash 4
  * ssh-copy-id
  * git
  * git-extras
  * tree
  * lesspipe
  * nmap
  * htop-osx
  * man2html
  * ack 2

### Ubuntu
* APT packages
  tree sl id3tool cowsay
  nmap telnet
  htop ack-grep

  * build-essential
  * libssl-dev
  * git-core
  * tree
  * nmap
  * telnet
  * htop
  * ack-grep

### Both
* Nave
  * node (latest stable)
    * npm
    * grunt-cli
    * linken
    * bower
    * node-inspector
    * yo
    * coffee-script
    * less
    * karma
* rbenv
  * ruby 2.1.0
* gems
  * bundler
  * awesome_print
  * pry
* Pygments

## The ~/ "copy" step
Any file in the `copy` subdirectory will be copied into `~/`. Any file that _needs_ to be modified with personal information (like [.gitconfig](copy/.gitconfig) which contains an email address and private key) should be _copied_ into `~/`. Because the file you'll be editing is no longer in `~/.dotfiles`, it's less likely to be accidentally committed into your public dotfiles repo.

This step will not copy over more recent versions of files.

## The ~/ "link" step
Any file in the `link` subdirectory gets symbolically linked with `ln -s` into `~/`. Edit these, and you change the file in the repo. Don't link files containing sensitive data, or you might accidentally commit that data!

Your .ssh folder is in the `link` directory, but rsa keys (public and private) as well as `known_hosts` and `authorized_keys` are ignored.

## Aliases and Functions
To keep things easy, the `~/.bashrc` and `~/.bash_profile` files are extremely simple, and should never need to be modified. Instead, add your aliases, functions, settings, etc into one of the files in the `source` subdirectory, or add a new file. They're all automatically sourced when a new shell is opened. Take a look, I have [a lot of aliases and functions](https://github.com/gubler/dotfiles/tree/master/source). I even have a [fancy prompt](source/50_prompt.sh) that shows the current directory, time and current git/svn repo status.

## Scripts
In addition to the aforementioned [dotfiles][dotfiles] script, there are a few other [bash scripts][bin].

* [dotfiles][dotfiles] - (re)initialize dotfiles. It might ask for your password (for `sudo`).
* [src](link/.bashrc#L6-15) - (re)source all files in `source` directory
* Look through the [bin][bin] subdirectory for a few more.

## Prompt
Currentlt working with [@cowboy's awesome bash prompt](source/50_prompt.sh). It shows git and svn repo status, a timestamp, error exit codes, and even changes color depending on how you've logged in.

Git repos display as **[branch:flags]** where flags are:

**?** untracked files  
**!** changed (but unstaged) files  
**+** staged files

SVN repos display as **[rev1:rev2]** where rev1 and rev2 are:

**rev1** last changed revision  
**rev2** revision

Check it out:

![The awesome bash prompt](http://farm8.staticflickr.com/7142/6754488927_563dd73553_b.jpg)

## Credits
Modified from [@cowboy](https://github.com/cowboy/dotfiles), [@mathiasbynes](https://github.com/mathiasbynens/dotfiles) and [@paulirish](https://github.com/paulirish/dotfiles). I'm just riding on the hard work they've done (especially @cowboy).

## License
Copyright (c) 2014 Daryl Gubler  
Licensed under the MIT license.
