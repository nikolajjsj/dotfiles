#!/usr/bin/env bash

echo 'Are the Xcode command line tools installed?'
echo 'If not exit using CMD+C, and install with:'
echo 'xcode-select -install'

read answer

echo ' ' 
echo 'What is your username on this system?'
read uname

# cloning github repo
cd ~
mkdir dev
cd dev
git clone https://github.com/nikolajjsj/.dotfiles.git
cd .dotfiles

# symlinking
ln -s .gitconfig ~/.gitconfig
ln -s .vimrc ~/.vimrc
ln -s config.fish ~/.config/fish/config.fish
ln -s alacritty.yml ~/.config/alacritty.yml

# brew.sh - installs brews
echo 'Do you want to install the default brews?'
echo 'If not press CMD+C'
read answer
echo ' ' 
# macos-sh - sets default preferences
echo 'Do you set default preferences'
echo 'If not press CMD+C'
read answer
echo ' ' 