#!/usr/bin/env bash

echo 'Are the Xcode command line tools installed?'
echo 'If not exit using CMD+C, and install with:'
echo 'xcode-select -install'

read answer

# cloning github repo
cd ~
mkdir dev
cd dev
git clone https://github.com/nikolajjsj/.dotfiles.git
cd .dotfiles

# create directory needed for config.fish (symlink)
mkdir ~/.config/fish/

# symlinking
ln -sf ~/dev/.dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dev/.dotfiles/.vimrc ~/.vimrc
ln -sf ~/dev/.dotfiles/config.fish ~/.config/fish/config.fish
ln -sf ~/dev/.dotfiles/alacritty.yml ~/.config/alacritty.yml
