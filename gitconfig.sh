#!/bin/bash

echo ""
echo "[-][-] Configuring Git global variables [-][-]"
echo ""
git config --global user.name "Matias Esteban"
git config --global user.email estebanmatias92@gmail.com
git config --global init.defaultBranch main

# Auth Login with Github CLI and set up the SSH credentials for Git
echo ""
echo "[-][-] Adding ssh key [-][-]"
echo ""
ssh-keygen -t ed25519 -C "estebanmatias92@gmail.com"

echo ""
echo "[-][-] Starting the SSH-AGENT [-][-]"
echo ""
eval "$(ssh-agent -s)"

echo ""
echo "[-][-] Adding private ssh key to the SSH-AGENT [-][-]"
echo ""
ssh-add ~/.ssh/id_ed25519

echo ""
echo "[-][-] Adding public ssh key to GITHUB [-][-]"
echo ""
gh ssh-key add ~/.ssh/id_ed25519.pub --title "$(lsb_release -ds)"

# Not needed with the above line
#echo ""
#echo "[-][-] Authenticate and Login on my Github Account [-][-]"
#echo ""
#gh auth login