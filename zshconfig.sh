#!/bin/bash

# Install ZSH and make it default
echo ""
echo "[-][-] Installing Zsh and make it default Shell [-][-]"
echo ""
sudo apt install zsh && 
chsh -s $(which zsh)


# Install Oh-My-Zsh
echo ""
echo "[-][-] Installing Oh-My-Zsh and updating [-][-]"
echo ""
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Update Oh-My-Zsh
zsh -c 'omz update'

# Set ZSH config
echo ""
echo "[-][-] Copying Zsh .dotfiles [-][-]"
echo ""
sed -i 's+plugins=(git)+plugins=(git ssh-agent z tmux themes)+g' ~/.zshrc
cat "${MYDOTFILES_PATH}/.myzshrc" >> ~/.zshrc