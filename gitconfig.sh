#!/bin/bash

git config --global user.name "Matias Esteban"
git config --global user.email estebanmatias92@gmail.com
git config --global init.defaultBranch main

# Auth Login with Github CLI and set up the SSH credentials for Git
echo "[-] Adding ssh key [-]"
ssh-keygen -t ed25519 -C "estebanmatias92@gmail.com"

echo "[-] Starting the SSH-AGENT [-]"
eval "$(ssh-agent -s)"

echo "[-] Adding private ssh key to the SSH-AGENT [-]"
ssh-add ~/.ssh/id_ed25519

echo "[-] Adding public ssh key to GITHUB [-]"
gh ssh-key add ~/.ssh/id_ed25519.pub --title "$(lsb_release -ds)"

# Not needed with the above line
#echo "[-] Authenticate and Login on my Github Account [-]"
#gh auth login