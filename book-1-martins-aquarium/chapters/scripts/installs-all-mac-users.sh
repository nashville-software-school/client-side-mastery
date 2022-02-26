#!/bin/bash
# set -u

clear
echo -e "\n   ************************************************"
echo -e "\n\tWELCOME TO NASHVILLE SOFTWARE SCHOOL\n"
echo -e "   ************************************************"
echo -e "\nWe are going to try to install as much software, and make as many"
echo -e "configurations as we possibly can in an automated script. If this"
echo -e "If this stops at any point, and you don't see a 'SUCCESS' message"
echo -e "please notify an instructor for assistance.\n\n"
read -p "Enter your full name (not an alias): " studentName
read -p "Enter email address you used for Github: " emailAddress


# Set up workspace directory
echo -e "\n\n Creating some directories that you will need..."
mkdir -p $HOME/workspace
mkdir -p $HOME/.ssh
mkdir -p $HOME/.config
mkdir -p $HOME/.npm-packages

# Create SSH key
echo -e "\n\n Generating an SSH key so you can backup your code to Github..."
ssh-keygen -t rsa -f ~/.ssh/id_nss -N "" -b 4096 -C $emailAddress
eval `ssh-agent`
ssh-add ~/.ssh/id_nss

# Install required package from Brew
echo -e "\n\n Installing Visual Studio Code..."
brew install -q --cask visual-studio-code

echo -e "\n\n Installing git and terminal customization tools..."
brew install -q git tig zsh zsh-completions

# User settings for git
git config --global user.name $studentName
git config --global user.email $emailAddress

# Install ohmyzsh
echo -e "\n\n Installing more terminal customization tools..."
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Show hidden file by default in Finder
echo -e "\n\n Configuring the Finder application to show hidden files..."
defaults write com.apple.finder AppleShowAllFiles YES
killall Finder

# Install global dependencies
echo -e "\n\n Installing a web server and a simple API server..."
npm config set prefix $HOME/.npm-packages
echo 'export PATH="$PATH:$HOME/.npm-packages/bin"' >> ~/.zshrc
echo -e "\n\n Reloading your newly configured terminal..."
source ~/.zshrc &>zsh-reload.log
npm i -g serve json-server serve

# Get latest Xcode
echo -e "\n\n Making sure you have the latest Xcode compiler..."
xcode-select --install
