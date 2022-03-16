#!/bin/bash

# Install Fish Shell and make it default
echo ""
echo "[-][-] Installing Fish and make it default Shell [-][-]"
echo ""
sudo apt install fish &&
chsh -s (which fish)

# Disable greeting message
fish -c 'set fish_greetin'

# Install Powerline Fonts (Optional below here)
echo ""
echo "[-][-] Installing Powerline Fonts [-][-]"
echo ""
sudo apt install fonts-Powerline

# Install Oh-My-Fish 
echo ""
echo "[-][-] Installing Oh-My-Fish [-][-]"
echo ""
curl -L https://get.oh-my.fish | fish

# Install and set up Oh-My-Fish THEME
echo ""
echo "[-][-] Setting up Oh-My-Fish theme [-][-]"
echo ""
fish -c 'omf install ocean'