#!/usr/bin/env bash

echo 'Are the Xcode command line tools installed?'
echo 'If not exit using CMD+C, and install with:'
echo 'xcode-select -install'
read -p "Continue? (y/n) " -n 1;
echo "";
if [[ $REPLY =~ ^[Yy]$ ]]; then
	# cloning github repo
    cd ~

    # create directory needed for config.fish (symlink)
    mkdir ~/.config/fish/

    # symlinking
    ln -sf ~/dev/.dotfiles/.gitconfig ~/.gitconfig
    ln -sf ~/dev/.dotfiles/.vimrc ~/.vimrc
    ln -sf ~/dev/.dotfiles/config.fish ~/.config/fish/config.fish
    ln -sf ~/dev/.dotfiles/alacritty.yml ~/.config/alacritty.yml
fi;
