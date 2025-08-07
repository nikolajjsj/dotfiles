#!/usr/bin/env bash
cd ~
mkdir .config/
# symlinking
ln -s ~/code/dotfiles/nvim ~/.config/nvim
ln -sf ~/code/dotfiles/.zshrc ~/.zshrc
ln -sf ~/code/dotfiles/.bashrc ~/.bashrc
ln -sf ~/code/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/code/dotfiles/.gitconfig ~/.gitconfig

# Check if machine is MacOS
if [ "$(uname)" == "Darwin" ]; then
  echo 'Are the Xcode command line tools installed?'
  echo 'And have you installed HomeBrew?'
  echo ""
  echo 'If not exit using CMD+C, and install with:'
  echo 'xcode-select --install'
  echo '/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'
  echo ""
  read -p "Continue? (y/n) " -n 1
  echo ""

  if [[ $REPLY =~ ^[Nn]$ ]]; then
    echo 'Exiting...'
    exit 1
  fi

  # Prompt user if they want to set MacOS preferences
  read -p "Set MacOS settings? (y/n) " -n 1
  echo ""
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    # Close any open System Preferences panes, to prevent them from overriding settings we’re about to change
    osascript -e 'tell application "System Preferences" to quit'
    # Ask for the administrator password upfront
    sudo -v
    # Keep-alive: update existing `sudo` time stamp until `.macos` has finished
    while true; do
      sudo -n true
      sleep 60
      kill -0 "$$" || exit
    done 2>/dev/null &

    ### Faster Dock
    defaults write com.apple.dock autohide-time-modifier -int 0
    ### Faster key repeat
    # Effects the speed of the cursor when using the arrow keys.
    # source: https://apple.stackexchange.com/a/83923
    defaults write -g InitialKeyRepeat -int 13
    defaults write -g KeyRepeat -int 1

    echo "Done. Note that some of these changes require a logout/restart to take effect."
  fi

  # Prompt user if they want to install HomeBrew packages
  read -p "Install HomeBrew packages? (y/n) " -n 1
  echo ""
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    cd ~ #Moving to home directory at the beginning of the process
    brew update
    brew upgrade
    # Installs
    brew install --formula neovim git htop fd fzf go gopls luajit ripgrep tmux lazygit eza fnm
    brew install --cask spotify ghostty google-chrome dbngin slack tableplus tailscale-app
    # Cleans up
    brew cleanup
  fi
fi
