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
echo -e "\nEnter github password for user $githubuser:"
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

# Install Homebrew
echo -e "\n\n\n\n"
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
echo "@@                                                            @@"
echo "@@   Installation Needed: Homebrew                            @@"
echo "@@   This installation will require your computer password.   @@"
echo "@@                                                            @@"
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install required package from Brew
echo -e "\n\nInstalling Visual Studio Code..."
brew install -q --cask visual-studio-code

echo -e "\n\nInstalling git and terminal customization tools..."
brew install -q git tig zsh zsh-completions

# Check if zsh is default shell. Switch if not.
current_shell=$(echo $SHELL)
if [ $current_shell == "/bin/bash" ];
then
    echo -e "\n\n\n\n"
    echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
    echo "@@                                                        @@"
    echo "@@   Change Needed: Switch to zsh                         @@"
    echo "@@   This change might require your computer password.    @@"
    echo "@@                                                        @@"
    echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
    chsh -s /bin/zsh
else
    echo "Already using zsh as default shell"
fi

# User settings for git
git config --global user.name $studentName
git config --global user.email $emailAddress

# Install ohmyzsh
echo -e "\n\nInstalling more terminal customization tools..."
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Show hidden file by default in Finder
echo -e "\n\nConfiguring the Finder application to show hidden files..."
defaults write com.apple.finder AppleShowAllFiles YES
killall Finder

# Install Node
echo -e "\n\n\n\n"
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
echo "@@                                                             @@"
echo "@@   Installation Needed: Node.js                              @@"
echo "@@   This installation might require your computer password.   @@"
echo "@@                                                             @@"
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"

NODE_VERSION=$(wget -qO- https://nodejs.org/dist/latest/ | sed -nE 's|.*>node-(.*)\.pkg</a>.*|\1|p')
curl "https://nodejs.org/dist/latest/node-$NODE_VERSION.pkg" > "$HOME/Downloads/node-latest.pkg" && sudo installer -store -pkg "$HOME/Downloads/node-latest.pkg" -target "/"


# Install global dependencies
echo -e "\n\nInstalling a web server and a simple API server..."
npm config set prefix $HOME/.npm-packages
echo 'export PATH="$PATH:$HOME/.npm-packages/bin"' >> ~/.zshrc
source ~/.zshrc &>zsh-reload.log
npm i -g serve json-server

# Get latest Xcode
echo -e "\n\nMaking sure you have the latest Xcode compiler..."
xcode-select --install

echo -e "\n\n\n\n"
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
echo "@@                                                             @@"
echo "@@                   S U C C E S S !!!                         @@"
echo "@@                                                             @@"
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"

