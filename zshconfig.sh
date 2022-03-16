#!/bin/bash

# Install ZSH and make it default
echo ""
echo "------------------------------------------------------"
echo "------ Installing Zsh and make it default Shell ------"
echo "------------------------------------------------------"
echo ""
yes | sudo apt install zsh && 
chsh -s $(which zsh)
sleep 1


# Install Oh-My-Zsh
echo ""
echo "-----------------------------------------------"
echo "------ Installing Oh-My-Zsh and updating ------"
echo "-----------------------------------------------"
echo ""
# unattended mode install
printf 'y\nexit\n' | sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# Update Oh-My-Zsh
zsh -i -c 'omz update'
sleep 2


# Set ZSH config
echo ""
echo "-----------------------------------"
echo "------ Copying Zsh .dotfiles ------"
echo "-----------------------------------"
echo ""
sed -i 's+ZSH_THEME="robbyrussell"+ZSH_THEME="agnoster"+g' ~/.zshrc
sed -i 's+plugins=(git)+plugins=(git ssh-agent z tmux themes)+g' ~/.zshrc
cat -v "${MYSETUP_DOTFILES_PATH}/.myzshrc" >> ~/.zshrc
