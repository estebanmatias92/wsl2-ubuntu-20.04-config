#!/bin/bash

clear

# Make the script path available fot the whole script
MYSETUP_SCRIPT_PATH=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
MYSETUP_DOTFILES_PATH="${MYSETUP_SCRIPT_PATH}/mydotfiles"
export MYSETUP_SCRIPT_PATH MYSETUP_DOTFILES_PATH

cd ~ 

# Update and upgrade the distro
echo "==============================="
echo "====== Update the system ======"
echo "==============================="
echo ""
yes | sudo apt update
yes | sudo apt upgrade
sleep 1


# Installing/Updating dependencies
echo ""
echo ""
echo "=============================================="
echo "====== Installing/Updating dependencies ======"
echo "=============================================="
echo ""
chmod +x "${MYSETUP_SCRIPT_PATH}/libraries.sh" && "${MYSETUP_SCRIPT_PATH}/libraries.sh"
sleep 2

# Install Git Credential Manager (Avoid this, make the VM huge)
#echo "[-] Installing Git Credential Manager [-]"
#curl -LO https://raw.githubusercontent.com/GitCredentialManager/git-credential-manager/main/src/linux/Packaging.Linux/install-from-source.sh &&
#sh ./install-from-source.sh &&
#git-credential-manager-core configure


# Install Github CLI
echo ""
echo ""
echo "==================================="
echo "====== Installing Github CLI ======"
echo "==================================="
echo ""
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg &&
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null &&
yes | sudo apt update &&
sudo apt install gh
sleep 1


# Auth Login with Github CLI and set up the SSH credentials for Git
echo ""
echo ""
echo "===================================================================="
echo "====== Configuring SSH credentials and Github SSH credentials ======"
echo "===================================================================="
echo ""
chmod +x "${MYSETUP_SCRIPT_PATH}/gitconfig.sh" && "${MYSETUP_SCRIPT_PATH}/gitconfig.sh"
sleep 2

# Install FISH
#echo ""
#echo ""
#echo "============================================"
#echo "====== Installing FISH and Oh-My-Fish ======"
#echo "============================================"
#echo ""
#chmod +x ${MYSETUP_DOTFILES_PATH}/fishconfig.sh && ${MYSETUP_DOTFILES_PATH}/fishconfig.sh
#sleep 2

# Install ZSH
echo ""
echo ""
echo "=========================================="
echo "====== Installing ZSH and Oh-My-Zsh ======"
echo "=========================================="
echo ""
chmod +x "${MYSETUP_SCRIPT_PATH}/zshconfig.sh" && "${MYSETUP_SCRIPT_PATH}/zshconfig.sh"
sleep 2


# Autoremove unnecesary libraries
echo ""
echo ""
echo "============================================="
echo "====== Autoremove unnecesary libraries ======"
echo "============================================="
echo ""
printf 'y\n' | sudo apt autoremove
sleep 1

# Copy TMUX config
echo ""
echo ""
echo "=================================="
echo "====== Copying config files ======"
echo "=================================="
echo ""
cat -v "${MYSETUP_DOTFILES_PATH}/myTmux.config" >> ~/Tmux.config
sleep 1


# Now install VS Code Server and open .zshrc file
echo ""
echo ""
echo "==============================================================="
echo "====== Installing VS Code Server and opening .zshrc file ======"
echo "==============================================================="
echo ""
code .zshrc
sleep 2


# Now unset my exported variables
unset MYSETUP_SCRIPT_PATH MYSETUP_DOTFILES_PATH


# Finish message
echo ""
echo ""
echo "======================================================="
echo "====== The setup is done, please restart the VM. ======"
echo "======================================================="
echo ""
echo ""
sleep 1


# Start Zsh shell
exec zsh