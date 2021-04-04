#!/usr/bin/env bash

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

#<----------------Changing MacOS Specific Preferences-------------------->
# Finder
defaults write com.apple.finder ShowPathbar -bool true #Adds the path bar to the bottom of the finder
defaults write com.apple.finder FXEnableRemoveFromICloudDriveWarning -bool false #Stop the automatic save to iCloud thing
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv" #Changes Default Finder View to List
defaults write com.apple.finder _FXSortFoldersFirst -bool true #Moves Folders to top When Sorting Alphabetically in Finder
defaults write com.apple.finder SidebarShowingiCloudDesktop -bool NO #Removes iCloud Desktop from Finder Sidebar
defaults write com.apple.NSGlobalDomain AppleShowAllExtensions -bool YES #Shows All File Extensions Always

# Dock behaviour
defaults write com.apple.dock autohide-time-modifier -int 0 #Sets Dock Autohide Time to O Seconds
defaults write com.apple.dock orientation -string  left #Moving the Dock to the left Side of the Screen

# IP block list for transmission. Source: https://giuliomac.wordpress.com/2014/02/19/best-blocklist-for-transmission/
defaults write org.m0k.transmission BlocklistNew -bool true
defaults write org.m0k.transmission BlocklistURL -string "http://john.bitsurge.net/public/biglist.p2p.gz"
defaults write org.m0k.transmission BlocklistAutoUpdate -bool true
# Randomize port on launch in Transmission
defaults write org.m0k.transmission RandomPort -bool true

# Privacy: don’t send search queries to Apple in Safari & Webkit
defaults write com.apple.Safari UniversalSearchEnabled -bool false
defaults write com.apple.Safari SuppressSearchSuggestions -bool true

# Disable Google Chromes all too sensitive backswipe on trackpads
defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool false

# Kill affected applications
for app in "Activity Monitor" \
	"Address Book" \
	"Calendar" \
	"cfprefsd" \
	"Contacts" \
	"Dock" \
	"Finder" \
	"Google Chrome" \
	"Mail" \
	"Photos" \
	"Safari" \
	"SystemUIServer" \
	"Terminal" \
	"TextEdit" \
	"Transmission"; do
	killall "${app}" &> /dev/null
done