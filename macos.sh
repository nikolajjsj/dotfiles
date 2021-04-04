#!/usr/bin/env bash

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

#<----------------Changing MacOS Specific Preferences-------------------->
### Finder
defaults write com.apple.finder ShowPathbar -bool true #Adds the path bar to the bottom of the finder
defaults write com.apple.finder FXEnableRemoveFromICloudDriveWarning -bool false #Stop the automatic save to iCloud thing
defaults write com.apple.finder FXPreferredViewStyle -string "clmv" #Changes Default Finder View to List
defaults write com.apple.finder _FXSortFoldersFirst -bool true #Moves Folders to top When Sorting Alphabetically in Finder
defaults write com.apple.finder SidebarShowingiCloudDesktop -bool NO #Removes iCloud Desktop from Finder Sidebar
defaults write com.apple.NSGlobalDomain AppleShowAllExtensions -bool YES #Shows All File Extensions Always
# Show icons for hard drives, servers, and removable media on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true
# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true


### Dock behaviour
defaults write com.apple.dock autohide-time-modifier -int 0 #Sets Dock Autohide Time to O Seconds
defaults write com.apple.dock orientation -string  left #Moving the Dock to the left Side of the Screen

### Transmission
# IP block list for transmission. Source: https://giuliomac.wordpress.com/2014/02/19/best-blocklist-for-transmission/
defaults write org.m0k.transmission BlocklistNew -bool true
defaults write org.m0k.transmission BlocklistURL -string "http://john.bitsurge.net/public/biglist.p2p.gz"
defaults write org.m0k.transmission BlocklistAutoUpdate -bool true
# Randomize port on launch in Transmission
defaults write org.m0k.transmission RandomPort -bool true

### Safari
# Privacy: don’t send search queries to Apple in Safari & Webkit
defaults write com.apple.Safari UniversalSearchEnabled -bool false
defaults write com.apple.Safari SuppressSearchSuggestions -bool true

### Google Chrome
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
echo "Done. Note that some of these changes require a logout/restart to take effect."
