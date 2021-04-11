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
fi;

