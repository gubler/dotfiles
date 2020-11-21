if [ is_osx ]; then
    # Trim new lines and copy to clipboard
    alias pbc="tr -d '\n' | pbcopy"

    # Flush Directory Service cache
    alias flushdns="dscacheutil -flushcache"

    # Dokku alias
    alias yt=youtube-dl
    alias ic='cd ~/Library/Mobile\ Documents/com~apple~CloudDocs'

    # `o` with no arguments opens current directory
    # otherwise opens the given location
    function o() {
      if [ $# -eq 0 ]; then
        open .
      else
        open "$@"
      fi
    }
fi
