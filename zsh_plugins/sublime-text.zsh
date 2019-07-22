# Sublime Text aliases

alias s=subl

# Search for the Sublime Text command if not found
(( $+commands[subl] )) || {
  declare -a _sublime_paths

  if [[ "$OSTYPE" == linux* ]]; then
    if [[ "$(uname -r)" = *Microsoft* ]]; then
      _sublime_paths=(
        "$(wslpath -u 'C:\Program Files\Sublime Text 3\subl.exe')"
        "$(wslpath -u 'C:\Program Files\Sublime Text 2\subl.exe')"
      )
    else
      _sublime_paths=(
        "$HOME/bin/sublime_text"
        "/opt/sublime_text/sublime_text"
        "/opt/sublime_text_3/sublime_text"
        "/usr/bin/sublime_text"
        "/usr/local/bin/sublime_text"
        "/usr/bin/subl"
        "/usr/bin/subl3"
      )
    fi
  elif [[ "$OSTYPE" = darwin* ]]; then
    _sublime_paths=(
      "/usr/local/bin/subl"
      "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl"
      "/Applications/Sublime Text 3.app/Contents/SharedSupport/bin/subl"
      "/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl"
      "$HOME/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl"
      "$HOME/Applications/Sublime Text 3.app/Contents/SharedSupport/bin/subl"
      "$HOME/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl"
    )
  elif [[ "$OSTYPE" = cygwin ]]; then
    _sublime_paths=(
      "$(cygpath "$ProgramW6432/Sublime Text 2")/subl.exe"
      "$(cygpath "$ProgramW6432/Sublime Text 3")/subl.exe"
    )
  elif [[ "$OSTYPE" = msys ]]; then
    _sublime_paths=(
      "/c/Program Files/Sublime Text 2/subl.exe"
      "/c/Program Files/Sublime Text 3/subl.exe"
    )
  fi

  for _sublime_path in $_sublime_paths; do
    if [[ -a $_sublime_path ]]; then
      alias subl="'$_sublime_path'"
      break
    fi
  done

  unset _sublime_paths _sublime_path
}

