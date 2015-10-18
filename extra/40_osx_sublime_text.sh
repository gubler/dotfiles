###############################################################################
# Sublime Text                                                                #
###############################################################################

echo ""
echo "Install Sublime Text settings and packages"
cp -r ${HOME}/.dotfiles/reference/SublimeText/Preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text*/Packages/User/Preferences.sublime-settings 2> /dev/null
cp -r ${HOME}/.dotfiles/reference/SublimeText/Package\ Control.sublime-package ~/Library/Application\ Support/Sublime\ Text*/Installed\ Packages/Package\ Control.sublime-package 2> /dev/null
cp -r ${HOME}/.dotfiles/reference/SublimeText/Package\ Control.sublime-settings ~/Library/Application\ Support/Sublime\ Text*/Packages/User/Package\ Control.sublime-settings 2> /dev/null
