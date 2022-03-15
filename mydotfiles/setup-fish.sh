#!/bin/bash

# Install Fish Shell
sudo apt install fish

# Enter Fish Shell
fish

# Disable greeting message
set fish_greeting

# Install Powerline Fonts (Optional below here)
sudo apt install fonts-Powerline

# Install Oh-My-Fish 
curl -L https://get.oh-my.fish | fish

# Install and set up Oh-My-Fish THEME
omf install ocean

# Change the default SHELL
chsh -s $(which zsh)