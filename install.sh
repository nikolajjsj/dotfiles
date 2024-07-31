#!/usr/bin/env bash
cd ~
mkdir .config/
mkdir .config/kitty/
# symlinking
ln -s ~/code/dotfiles/nvim ~/.config/nvim
ln -sf ~/code/dotfiles/.zshrc ~/.zshrc
ln -sf ~/code/dotfiles/.bashrc ~/.bashrc
ln -sf ~/code/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/code/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/code/dotfiles/kitty.conf ~/.config/kitty/kitty.conf

# Check if machine is Linux
if [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  # Prompt user if they want to install packages
  read -p "Install packages? (y/n) " -n 1;
  echo "";
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo 'Installing software'
    sudo apt update
    sudo apt upgrade
    # Installs
    sudo apt install git htop ripgrep exa tmux
    # Cleanup
    sudo apt autoremove
  fi;

# Check if machine is MacOS
elif [ "$(uname)" == "Darwin" ]; then
  echo 'Are the Xcode command line tools installed?'
  echo 'And have you installed HomeBrew?'
  echo ""
  echo 'If not exit using CMD+C, and install with:'
  echo 'xcode-select --install'
  echo '/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'
  echo ""
  read -p "Continue? (y/n) " -n 1;
  echo "";

  if [[ $REPLY =~ ^[Nn]$ ]]; then
    echo 'Exiting...'
    exit 1
  fi;

  # Prompt user if they want to set MacOS preferences
  read -p "Set MacOS settings? (y/n) " -n 1;
  echo "";
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    # Close any open System Preferences panes, to prevent them from overriding settings we’re about to change
    osascript -e 'tell application "System Preferences" to quit'
    # Ask for the administrator password upfront
    sudo -v
    # Keep-alive: update existing `sudo` time stamp until `.macos` has finished
    while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
    #<----------------Changing MacOS Specific Preferences-------------------->
    ### VIM for VSCode
    defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
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
  fi;

  # Prompt user if they want to install HomeBrew packages
  read -p "Install HomeBrew packages? (y/n) " -n 1;
  echo "";
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    cd ~ #Moving to home directory at the beginning of the process
    brew update
    brew upgrade
    # Installs
    brew install --formula vim neovim git htop fd fzf go gopls luajit ripgrep tmux lazygit
    brew install --cask spotify kitty
    # Cleans up
    brew cleanup
  fi;
fi;

