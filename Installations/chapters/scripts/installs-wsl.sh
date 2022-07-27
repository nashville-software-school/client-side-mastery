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
echo -e "\n\nCreating some directories that you will need..."
mkdir -p $HOME/workspace
mkdir -p $HOME/.ssh
mkdir -p $HOME/.config
mkdir -p $HOME/.npm-packages


# Create SSH key
echo -e "\n\nGenerating an SSH key so you can backup your code to Github..."
echo "yes" | ssh-keygen -t rsa -f ~/.ssh/id_nss -N "" -b 4096 -C $emailAddress
eval `ssh-agent`
ssh-add ~/.ssh/id_nss
echo -e "Host *\n\tAddKeysToAgent yes\n\tIdentityFile ~/.ssh/id_nss" >> ~/.ssh/config

# Get latest updates
echo -e "\n\nUpdating the Ubuntu operating system..."
sudo apt-get update && sudo apt-get dist-upgrade -y
sudo apt install -y curl file build-essential libssl-dev libgtk2.0-0 libgtk-3-0 libgbm-dev libnotify-dev libgconf-2-4 libnss3 libxss1 libasound2 libxtst6 xauth xvfb

# Install Node
echo -e "\n\n\n\n"
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
echo "@@                                                             @@"
echo "@@   Installation Needed: Node.js                              @@"
echo "@@   This installation might require your Ubuntu password.     @@"
echo "@@                                                             @@"
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"

curl -sL https://deb.nodesource.com/setup_17.x | sudo -E bash -
sudo apt-get install -y nodejs

# Install global dependencies
echo -e "\n\nInstalling a web server and a simple API server..."
npm config set prefix $HOME/.npm-packages
echo 'export PATH="$HOME/.npm-packages/bin:$PATH"' >> $HOME/.profile
source $HOME/.profile &>profile-reload.log
npm i -g serve json-server

# Add SSH key to Github account
echo -e "\n\nAdding your SSH key to your Github account..."
PUBLIC_KEY=$(cat $HOME/.ssh/id_nss.pub)
curl \
  -X POST \
  -H "Content-Type: application/json" \
  -H "Accept: application/vnd.github.v3+json" \
  -u "$githubUsername:$githubPassword" \
  https://api.github.com/user/keys \
  -d "{\"key\":\"$PUBLIC_KEY\",\"title\":\"NSS Automated Key\"}"

echo -e "\n\nInstalling git and terminal customization tools..."
sudo apt install -y zsh git fonts-powerline

# User settings for git
echo -e "\n\nConfigurating git settings..."
git config --global user.name "$studentName"
git config --global user.email $emailAddress

# Check if zsh is default shell. Switch if not.
current_shell=$(echo $SHELL)
if [ $current_shell == "/bin/bash" ];
then
    echo -e "\n\n\n\n"
    echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
    echo "@@                                                        @@"
    echo "@@   Change Needed: Switch to zsh                         @@"
    echo "@@   This change might require your Ubuntu password.      @@"
    echo "@@                                                        @@"
    echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
    chsh -s /bin/zsh
else
    echo "Already using zsh as default shell"
fi

# Install ohmyzsh
echo -e "\n\nInstalling more terminal customization tools..."
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"


echo -e "\n\n\n\n"
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
echo "@@                                                             @@"
echo "@@                   S U C C E S S !!!                         @@"
echo "@@                                                             @@"
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
