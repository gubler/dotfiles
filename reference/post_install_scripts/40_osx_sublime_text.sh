###############################################################################
# Sublime Text                                                                #
###############################################################################

echo ""
echo "Install Sublime Text settings and packages"
cp -r ${HOME}/.dotfiles/reference/SublimeText/Preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Preferences.sublime-settings 2> /dev/null
cp -r ${HOME}/.dotfiles/reference/SublimeText/Package\ Control.sublime-package ~/Library/Application\ Support/Sublime\ Text\ 3/Installed\ Packages/Package\ Control.sublime-package 2> /dev/null
cp -r ${HOME}/.dotfiles/reference/SublimeText/Package\ Control.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Package\ Control.sublime-settings 2> /dev/null
cp -r ${HOME}/.dotfiles/reference/SublimeText/Marked 2.sublime-build ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Marked 2.sublime-build 2> /dev/null
