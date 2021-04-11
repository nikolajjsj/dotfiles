#!/usr/bin/env bash

echo 'Are the Xcode command line tools installed?'
echo 'And have you installed HomeBrew?'
echo ""
echo 'If not exit using CMD+C, and install with:'
echo 'xcode-select --install'
echo 'and/or:'
echo '/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'
echo ""
read -p "Continue? (y/n) " -n 1;
echo "";
if [[ $REPLY =~ ^[Yy]$ ]]; then
    cd ~

    # symlinking
    ln -sf ~/dev/.dotfiles/.gitconfig ~/.gitconfig
    ln -sf ~/dev/.dotfiles/.vimrc ~/.vimrc
    ln -sf ~/dev/.dotfiles/.zshrc ~/.zshrc

    # Prompt user if they want to set MacOS preferences
    read -p "Set MacOS settings? (y/n) " -n 1;
    echo "";
    if [[ $REPLY =~ ^[Yy]$ ]]; then
      sh ./macos.sh
    fi;

    # Prompt user if they want to install HomeBrew packages
    read -p "Install HomeBrew packages? (y/n) " -n 1;
    echo "";
    if [[ $REPLY =~ ^[Yy]$ ]]; then
      sh ./brew.sh
    fi;

    # Prompt user if they want to set fish as the default shell
    read -p "Set fish as default shell? (y/n) " -n 1;
    echo "";
    if [[ $REPLY =~ ^[Yy]$ ]]; then
      # Change the default shell to fish
      echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
      chsh -s /usr/local/bin/fish
    fi;
fi;

