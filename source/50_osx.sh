# OSX-only stuff. Abort if not OSX.
is_osx || return 1

# APPLE, Y U PUT /usr/bin B4 /usr/local/bin?!
PATH="/usr/local/bin:$(path_remove /usr/local/bin)"
PATH="/usr/local/sbin:$(path_remove /usr/local/sbin)"

# Add Composer global to path
PATH="~/.composer/vendor/bin:$PATH"

export PATH

# Trim new lines and copy to clipboard
alias pbc="tr -d '\n' | pbcopy"

# Replace git with hub
alias git=hub

# Clean up LaunchServices to remove duplicates in the “Open With” menu
alias lscleanup="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder"

# Get macOS Software Updates, and update installed Ruby gems, Homebrew, npm, and their installed packages
alias update='sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup; npm install npm -g; npm update -g; sudo gem update --system; sudo gem update; sudo gem cleanup'

# Alias phing in projects
alias phing=vendor/bin/phing

# Alias symfony console in projects
alias sf=bin/console

# Make 'less' more.
[[ "$(type -P lesspipe.sh)" ]] && eval "$(lesspipe.sh)"

# Start ScreenSaver. This will lock the screen if locking is enabled.
alias ss="open /System/Library/Frameworks/ScreenSaver.framework/Versions/A/Resources/ScreenSaverEngine.app"

# Lock the screen (when going AFK)
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# Pure Comedy
alias nom="say -v cello i am a cat and i\'m small very small oh so small i am a cat and i\'m probably eating pancakes om nom nom nom nom nom nom om nom nom nom nom nom om nom nom nom nom nom nom nom om nom nom nom nom"

# Export Localization.prefPane text substitution rules.
function txt_sub_backup() {
  local prefs=~/Library/Preferences/.GlobalPreferences.plist
  local backup=$DOTFILES/conf/osx/NSUserReplacementItems.plist
  /usr/libexec/PlistBuddy -x -c "Print NSUserReplacementItems" "$prefs" > "$backup" &&
  echo "File ~${backup#$HOME} written."
}

# Import Localization.prefPane text substitution rules.
function txt_sub_restore() {
  local prefs=~/Library/Preferences/.GlobalPreferences.plist
  local backup=$DOTFILES/conf/osx/NSUserReplacementItems.plist
  if [[ ! -e "$backup" ]]; then
    echo "Error: file ~${backup#$HOME} does not exist!"
    return 1
  fi
  cmds=(
    "Delete NSUserReplacementItems"
    "Add NSUserReplacementItems array"
    "Merge '$backup' NSUserReplacementItems"
  )
  for cmd in "${cmds[@]}"; do /usr/libexec/PlistBuddy -c "$cmd" "$prefs"; done
}

# `s` with no arguments opens the current directory in Sublime Text, otherwise
# opens the given location
function s() {
  if [ $# -eq 0 ]; then
    subl .
  else
    subl "$@"
  fi
}

# `a` with no arguments opens current directory in Atom, otherwise opens the given
# location
function o() {
  if [ $# -eq 0 ]; then
    atom .
  else
    atom "$@"
  fi
}

# `o` with no arguments opens current directory, otherwise opens the given
# location
function o() {
  if [ $# -eq 0 ]; then
    open .
  else
    open "$@"
  fi
}

# run composer without xdebug enabled
function composer() {
    COMPOSER="$(which composer)" || {
        echo "Could not find composer in path" >&2;
        return 1;
    } &&
    mv /usr/local/etc/php/7.1/conf.d/ext-xdebug.ini /usr/local/etc/php/7.1/conf.dis;
    $COMPOSER "$@";
    STATUS=$?;
    mv /usr/local/etc/php/7.1/conf.dis/ext-xdebug.ini /usr/local/etc/php/7.1/conf.d;
    return $STATUS;
}
