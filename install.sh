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
    ln -sf ~/code/.dotfiles/.gitconfig ~/.gitconfig
    ln -sf ~/code/.dotfiles/.zshrc ~/.zshrc
    ln -sf ~/code/.dotfiles/.bashrc ~/.bashrc
    ln -s ~/code/.dotfiles/nvim ~/.config/
    ln -sf ~/code/.dotfiles/alacritty.yml ~/.config/alacritty/alacritty.yml
    ln -sf ~/code/.dotfiles/.tmux.conf ~/.tmux.conf

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

