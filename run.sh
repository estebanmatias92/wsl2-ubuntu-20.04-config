#!/bin/bash

clear

# Make the script path available fot the whole script
MYSCRIPT_PATH=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
MYDOTFILES_PATH="${MYSCRIPT_PATH}/mydotfiles"

cd ~ 

# Update and upgrade the distro
echo "========================="
echo "=== Update the system ==="
echo "========================="
echo ""
yes | sudo apt update
yes | sudo apt upgrade
sleep 1


# Installing/Updating dependencies
echo ""
echo ""
echo "========================================"
echo "=== Installing/Updating dependencies ==="
echo "========================================"
echo ""
chmod +x ${MYSCRIPT_PATH}/libraries.sh && ${MYSCRIPT_PATH}/libraries.sh
sleep 2

# Install Git Credential Manager (Avoid this, make the VM huge)
#echo "[-] Installing Git Credential Manager [-]"
#curl -LO https://raw.githubusercontent.com/GitCredentialManager/git-credential-manager/main/src/linux/Packaging.Linux/install-from-source.sh &&
#sh ./install-from-source.sh &&
#git-credential-manager-core configure


# Install Github CLI
echo ""
echo ""
echo "============================="
echo "=== Installing Github CLI ==="
echo "============================="
echo ""
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg &&
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null &&
yes | sudo apt update &&
sudo apt install gh
sleep 1


# Auth Login with Github CLI and set up the SSH credentials for Git
echo ""
echo ""
echo "=============================================================="
echo "=== Configuring SSH credentials and Github SSH credentials ==="
echo "=============================================================="
echo ""
chmod +x ${MYSCRIPT_PATH}/gitconfig.sh && ${MYSCRIPT_PATH}/gitconfig.sh
sleep 2

# Install FISH
#echo ""
#echo ""
#echo "======================================"
#echo "=== Installing FISH and Oh-My-Fish ==="
#echo "======================================"
#echo ""
#chmod +x ${MYDOTFILES_PATH}/fishconfig.sh && ${MYDOTFILES_PATH}/fishconfig.sh
#sleep 2

# Install ZSH
echo ""
echo ""
echo "===================================="
echo "=== Installing ZSH and Oh-My-Zsh ==="
echo "===================================="
echo ""
chmod +x ${MYSCRIPT_PATH}/zshconfig.sh && ${MYSCRIPT_PATH}/zshconfig.sh
sleep 2


# Autoremove unnecesary libraries
echo ""
echo ""
echo "======================================="
echo "=== Autoremove unnecesary libraries ==="
echo "======================================="
echo ""
printf 'y\n' | sudo apt autoremove
sleep 1

# Copy TMUX config
echo ""
echo ""
echo "============================"
echo "=== Copying config files ==="
echo "============================"
echo ""
cat -v "${MYDOTFILES_PATH}/myTmux.config" >> ~/Tmux.config
sleep 2


echo ""
echo "=========================================="
echo "=== The setup is done, please restart. ==="
echo "=========================================="
echo ""
echo ""
