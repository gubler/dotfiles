source /usr/local/share/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle colorize
antigen bundle dotenv
antigen bundle Tarrasch/zsh-autoenv
antigen bundle gulp
antigen bundle history-substring-search
antigen bundle httpie
antigen bundle laravel5
antigen bundle marked2
antigen bundle phing
antigen bundle rbenv
antigen bundle thefuck
antigen bundle sublime
antigen bundle symfony2
antigen bundle vagrant
antigen bundle yarn
antigen bundle z

# Load the theme.
antigen theme candy

# Tell Antigen that you're done.
antigen apply

# Load .dotfiles
source $HOME/.dotfiles/source/00_functions.zsh
source $HOME/.dotfiles/source/10_config.zsh
source $HOME/.dotfiles/source/20_aliases.zsh
source $HOME/.dotfiles/source/50_macos_config.zsh
source $HOME/.dotfiles/source/50_ubuntu_config.zsh
source $HOME/.local_aliases.zsh
