#!/bin/bash
MYDOTFILES_PATH="(pwd)/mydotfiles"

cd ~ 

# Update and upgrade the distro
echo "[-] Update the system [-]"
sudo apt update
sudo apt upgrade

# Installing/Updating dependencies
echo "[-] Installing/Updating dependencies [-]"
chmod +x ${MYDOTFILES_PATH}/libraries.sh && ${MYDOTFILES_PATH}/libraries.sh

# Install Git Credential Manager (Avoid this, make the VM huge)
#echo "[-] Installing Git Credential Manager [-]"
#curl -LO https://raw.githubusercontent.com/GitCredentialManager/git-credential-manager/main/src/linux/Packaging.Linux/install-from-source.sh &&
#sh ./install-from-source.sh &&
#git-credential-manager-core configure

# Install Github CLI
echo "[-] Installing Github CLI [-]"
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg &&
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null &&
sudo apt update &&
sudo apt install gh

# Auth Login with Github CLI and set up the SSH credentials for Git
echo "[-] Adding ssh key [-]"
ssh-keygen -t ed25519 -C "estebanmatias92@gmail.com"

echo "[-] Starting the SSH-AGENT [-]"
eval "$(ssh-agent -s)"

echo "[-] Adding private ssh key to the SSH-AGENT [-]"
ssh-add ~/.ssh/id_ed25519

echo "[-] Adding public ssh key to GITHUB [-]"
gh ssh-key add ~/.ssh/id_ed25519.pub --title $(lsb_release -ds)

# Not needed with the above line
#echo "[-] Authenticate and Login on my Github Account [-]"
#gh auth login

# Install FISH
echo "[-] Installing FISH and Oh-My-Fish [-]"
chmod +x ${MYDOTFILES_PATH}/setup-fish.sh && ${MYDOTFILES_PATH}/setup-fish.sh

# Install ZSH
#chmod +x ${MYDOTFILES_PATH}/setup-zsh.sh && ${MYDOTFILES_PATH}/setup-zsh.sh

# Copy TMUX config
echo "[-] Copying config files [-]"
cat "${MYDOTFILES_PATH}/myTmux.config" >> "~/Tmux.config"
