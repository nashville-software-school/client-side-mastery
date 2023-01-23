#!/bin/bash

clear
echo -e "\n   ************************************************"
echo -e "\n\tWELCOME TO NASHVILLE SOFTWARE SCHOOL\n"
echo -e "   ************************************************"
echo -e "\nWe are going to try to install as much software, and make as many"
echo -e "configurations as we possibly can in an automated script. If this"
echo -e "If this stops at any point, and you don't see a 'SUCCESS' message"
echo -e "please notify an instructor for assistance.\n\n"
echo "Enter your full name exactly as you entered it on Github settings:"
read -p "> " studentName
echo -e "\nEnter email address you used for Github:"
read -p "> " emailAddress
echo -e "\nEnter your Github account name:"
read -p "> " githubUsername
echo -e "\nPaste personal access token for Github (you won't see it because security):"
read -s -p "> " githubPassword

# Set up workspace directory
sh directory_script.sh

# WSL Specific: Get latest updates and install packages - May take awhile but needs to run first
echo -e "\n\nUpdating the Ubuntu operating system..."
sudo apt-get update && sudo apt-get dist-upgrade -y
sudo apt install -y curl file build-essential libssl-dev libgtk2.0-0 libgtk-3-0 libgbm-dev libnotify-dev libgconf-2-4 libnss3 libxss1 libasound2 libxtst6 xauth xvfb zsh git fonts-powerline

# Switch to Zsh
sh zsh_script.sh

# Install Node - Needs to run after zsh setup
sh node_script.sh

# Add SSH key to Github account - Needs to run after apt installs
sh github.sh

echo -e "\n\n\n\n"
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
echo "@@                                                             @@"
echo "@@                   S U C C E S S !!!                         @@"
echo "@@                                                             @@"
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
