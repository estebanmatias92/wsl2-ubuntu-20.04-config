#!/bin/bash

# Install ZSH
sudo apt install zsh

# Make ZSH default shell
chsh -s $(which zsh)

# Set ZSH config
cat ".myzshrc" >> "~/.zshrc"