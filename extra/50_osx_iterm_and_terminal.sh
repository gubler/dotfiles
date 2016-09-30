###############################################################################
# Terminal & iTerm 2                                                          #
###############################################################################

echo ""
echo "Only use UTF-8 in Terminal.app"
defaults write com.apple.terminal StringEncodings -array 4

echo ""
echo "Use Material Theme by default in Terminal.app"
open "${HOME}/.dotfiles/reference/MaterialTheme.terminal"
sleep 1 # Wait a bit to make sure the theme is loaded
defaults write com.apple.terminal "Default Window Settings" -string "MaterialTheme"
defaults write com.apple.terminal "Startup Window Settings" -string "MaterialTheme"

echo ""
echo ""
echo "-------------------------------------------------------"
echo ""
echo "## To Set Up iTerm2"
echo ""
echo "In iTem2, go to Preferences -> General"
echo "Under Preferences at the bottom,"
echo "check 'Load Preferences from a custom folder or URL:"
echo "Click Browse and select:"
echo "${HOME}/.dotfiles/reference/iterm2_profile"
echo ""
echo "-------------------------------------------------------"
echo ""



