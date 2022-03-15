#!/bin/bash

cd ~ 
MYDOTFILES_PATH="./mydotfiles"

# Update and upgrade the distro
sudo apt update
sudo apt upgrade

# Installing/Updating dependencies
chmod +x ${MYDOTFILES_PATH}/libraries.sh && ${MYDOTFILES_PATH}/libraries.sh

# Install Git Credential Manager
curl -LO https://raw.githubusercontent.com/GitCredentialManager/git-credential-manager/main/src/linux/Packaging.Linux/install-from-source.sh &&
sh ./install-from-source.sh &&
git-credential-manager-core configure

# Install Github CLI
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg &&
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null &&
sudo apt update &&
sudo apt install gh

# Auth Login with Github CLI and set up the SSH credentials for Git
gh auth login

# Install FISH
chmod +x ${MYDOTFILES_PATH}/setup-fish.sh && ${MYDOTFILES_PATH}/setup-fish.sh

# Install ZSH
#chmod +x ${MYDOTFILES_PATH}/setup-zsh.sh && ${MYDOTFILES_PATH}/setup-zsh.sh

# Copy TMUX config
cat "${MYDOTFILES_PATH}/myTmux.config" >> "~/Tmux.config"
