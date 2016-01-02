# Editing

if [[ ! "$SSH_TTY" ]] && is_osx; then
  export EDITOR='subl -w'
  export LESSEDIT='subl %f'
else
  export EDITOR='vim'
fi

export VISUAL="$EDITOR"
alias q="$EDITOR"
alias qv="q $DOTFILES/link/.{,g}vimrc +'cd $DOTFILES'"
alias qs="q $DOTFILES"
