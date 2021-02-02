#!/usr/bin/env bash

cd ~ #Moving to home directory at the beginning of the process

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

#<----------------Installing MacOS Apps, via Homebrew, Caks, & The App Store-------------------->
brew=(
	cowsay
	cmatrix
    fortune
    git
    htop
    node
	vim
    starship
)
cask=(
    alfred
	visual-studio-code
	alfred
	google-chrome-beta
	android-file-transfer
	android-platform-tools
	android-studio
	appcleaner
	discord
	google-backup-and-sync
	iina
	spotify
	transmission
) #GUI apps that install with cask

brew update
brew upgrade

brew install ${brew[@]} #Homebrew App Installer
brew cask install ${cask[@]} #Casks Installer