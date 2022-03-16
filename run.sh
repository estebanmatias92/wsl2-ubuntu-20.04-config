#!/bin/bash

clear

MYSCRIPT_PATH=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
MYDOTFILES_PATH="${MYSCRIPT_PATH}/mydotfiles"

cd ~ 

# Update and upgrade the distro
echo ""
echo ""
echo "[-] Update the system [-]"
echo ""
sudo apt update
sudo apt upgrade

# Installing/Updating dependencies
echo ""
echo ""
echo "[-] Installing/Updating dependencies [-]"
echo ""
chmod +x ${MYSCRIPT_PATH}/libraries.sh && ${MYSCRIPT_PATH}/libraries.sh
clear

# Install Git Credential Manager (Avoid this, make the VM huge)
#echo "[-] Installing Git Credential Manager [-]"
#curl -LO https://raw.githubusercontent.com/GitCredentialManager/git-credential-manager/main/src/linux/Packaging.Linux/install-from-source.sh &&
#sh ./install-from-source.sh &&
#git-credential-manager-core configure

# Install Github CLI
echo ""
echo ""
echo "[-] Installing Github CLI [-]"
echo ""
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg &&
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null &&
sudo apt update &&
sudo apt install gh

# Auth Login with Github CLI and set up the SSH credentials for Git
echo ""
echo ""
echo "[-] Configuring SSH credentials and Github SSH credentials [-]"
echo ""
chmod +x ${MYSCRIPT_PATH}/gitconfig.sh && ${MYSCRIPT_PATH}/gitconfig.sh
clear

# Install FISH
#echo "[-] Installing FISH and Oh-My-Fish [-]"
#chmod +x ${MYDOTFILES_PATH}/fishconfig.sh && ${MYDOTFILES_PATH}/fishconfig.sh

# Install ZSH
echo ""
echo ""
echo "[-] Installing ZSH and Oh-My-Zsh [-]"
echo ""
chmod +x ${MYSCRIPT_PATH}/zshconfig.sh && ${MYSCRIPT_PATH}/zshconfig.sh

# Autoremove unnecesary libraries
echo ""
echo ""
echo "[-] Autoremove unnecesary libraries [-]"
echo ""
sudo apt autoremove
clear

# Copy TMUX config
echo ""
echo ""
echo "[-] Copying config files [-]"
echo ""
cat "${MYDOTFILES_PATH}/myTmux.config" >> "~/Tmux.config"
clear

echo ""
echo ""
echo "[-] The configuration is done, please restart. [-]"
echo ""
