#!/bin/bash

echo ""
echo "----------------------------------------------"
echo "------ Configuring Git global variables ------"
echo "----------------------------------------------"
echo ""
read -p "Enter your github user.name: " mygitusername
read -p "Enter your github user.email: " mygituseremail
git config --global user.name "${mygitusername}"
git config --global user.email "${mygituseremail}"
git config --global init.defaultBranch main
# Show the config
echo ""
echo "Showing the --global config data:"
echo ""
git config --list --show-origin
sleep 2


# Auth Login with Github CLI and set up the SSH credentials for Git
echo ""
echo "----------------------------"
echo "------ Adding ssh key ------"
echo "----------------------------"
echo ""
ssh-keygen -t ed25519 -C "${mygituseremail}"
sleep 1


echo ""
echo "------------------------------------"
echo "------ Starting the SSH-AGENT ------"
echo "------------------------------------"
echo ""
eval "$(ssh-agent -s)"
sleep 1


echo ""
echo "-----------------------------------------------------"
echo "------ Adding private ssh key to the SSH-AGENT ------"
echo "-----------------------------------------------------"
echo ""
ssh-add ~/.ssh/id_ed25519
sleep 1


# Not needed with the above line
echo ""
echo "-------------------------------------------------------------------"
echo "------ Authenticate, login and add public SSH Key to Github  ------"
echo "-------------------------------------------------------------------"
echo ""
gh auth login
sleep 1