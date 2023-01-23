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
echo -e "\nEnter personal access token for Github:"
read -s -p "> " githubPassword

# Set up workspace directory
sh directory_script.sh

# Mac Specific installs
if ! command -v brew &> /dev/null; then
  echo -e "\n\n\n\n Installing Homebrew..."
  
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  echo 'eval $(/opt/homebrew/bin/brew shellenv)' >> /Users/$USER/.zprofile
  eval $(/opt/homebrew/bin/brew shellenv)
fi

echo -e "\n\nInstalling git and terminal customization tools..."
brew install -q git tig zsh zsh-completions

# Show hidden file by default in Finder
echo -e "\n\nConfiguring the Finder application to show hidden files..."
defaults write com.apple.finder AppleShowAllFiles YES
killall Finder
# End Mac Specific

# Set up Zsh
sh zsh_scripts.sh

# Set up git and github - Needs to be below the brew install
sh github_script.sh 

# Install Node - Needs to be below zsh set up because of the shell environment
sh node_script.sh

# Install XCode Command line tools - May take awhile so run this one last
echo -e "\n\nMaking sure you have Command line tools installed"
xcode-select --install

echo -e "\n\n\n\n"
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
echo "@@                                                             @@"
echo "@@                   S U C C E S S !!!                         @@"
echo "@@                                                             @@"
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
