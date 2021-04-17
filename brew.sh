#!/usr/bin/env bash

cd ~ #Moving to home directory at the beginning of the process

brew update
brew upgrade

#<----------------Installing MacOS Apps, via Homebrew, Caks, & The App Store-------------------->
## formulas
brew install --formula vim
brew install --formula cowsay
brew install --formula fortune
brew install --formula git
brew install --formula htop
brew install --formula node
brew install --formula starship

## casks
brew install --cask alfred
brew install --cask android-file-transfer
brew install --cask android-platform-tools
brew install --cask android-studio
brew install --cask appcleaner
brew install --cask flutter
brew install --cask google-chrome
brew install --cask insomnia
brew install --cask iterm2
brew install --cask spotify
brew install --cask visual-studio-code

# Cleans up
brew cleanup