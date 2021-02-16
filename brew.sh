#!/usr/bin/env bash

cd ~ #Moving to home directory at the beginning of the process

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

#<----------------Installing MacOS Apps, via Homebrew, Caks, & The App Store-------------------->
brew=(
	cowsay
    fortune
    git
	fish
    htop
    node
	vim
    starship
)
cask=(
    alfred
	alt-tab
	android-file-transfer
	android-platform-tools
	android-studio
	appcleaner
	firefox-developer-edition
	google-chrome-beta
	google-drive
	iina
	insomnia
	istat-menu
	iterm2
	spotify
	transmission
	visual-studio-code
) #GUI apps that install with cask

brew update
brew upgrade

brew install ${brew[@]} #Homebrew App Installer
brew cask install ${cask[@]} #Casks Installer