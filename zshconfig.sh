#!/bin/bash

# Install ZSH
sudo apt install zsh

# Make ZSH default shell
chsh -s $(which zsh)

# Install Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Update Oh-My-Zsh
omz update

# Set ZSH config
cat "${MYDOTFILES_PATH}/.myzshrc" >> "~/.zshrc"