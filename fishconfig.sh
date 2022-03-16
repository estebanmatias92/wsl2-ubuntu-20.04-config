#!/bin/bash

# Install Fish Shell and make it default
echo ""
echo "-------------------------------------------------------"
echo "------ Installing Fish and make it default Shell ------"
echo "-------------------------------------------------------"
echo ""
yes | sudo apt install fish &&
chsh -s (which fish)

# Disable greeting message
fish -v -c 'set fish_greetin'
sleep 1

# Install Powerline Fonts (Optional below here)
echo ""
echo "----------------------------------------"
echo "------ Installing Powerline Fonts ------"
echo "----------------------------------------"
echo ""
sudo apt install fonts-Powerline
sleep 1


# Install Oh-My-Fish 
echo ""
echo "-----------------------------------"
echo "------ Installing Oh-My-Fish ------"
echo "-----------------------------------"
echo ""
curl -L https://get.oh-my.fish | fish
sleep 1


# Install and set up Oh-My-Fish THEME
echo ""
echo "-----------------------------------------"
echo "------ Setting up Oh-My-Fish theme ------"
echo "-----------------------------------------"
echo ""
fish -v -c 'omf install ocean'