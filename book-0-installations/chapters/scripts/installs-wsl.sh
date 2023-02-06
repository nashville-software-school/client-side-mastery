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
FOLDER=$HOME/workspace
if [ ! -d "$FOLDER" ]; then    
  echo -e "\n\nCreating some directories that you will need..."
  mkdir -p $HOME/workspace
  mkdir -p $HOME/.ssh
  mkdir -p $HOME/.config
  mkdir -p $HOME/.npm-packages
else
  echo "Skipping directory creation"
fi

# WSL Specific: Get latest updates and install packages - May take awhile but needs to run first
echo -e "\n\nUpdating the Ubuntu operating system..."
sudo apt-get update && sudo apt-get dist-upgrade -y
sudo apt install -y curl file build-essential libssl-dev libgtk2.0-0 libgtk-3-0 libgbm-dev libnotify-dev libgconf-2-4 libnss3 libxss1 libasound2 libxtst6 xauth xvfb zsh git fonts-powerline

# Switch to Zsh
ZSH_FOLDER=$HOME/.oh-my-zsh
if [ ! -d "$FOLDER" ]; then    
  sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

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
    ZSH_PATH=$(which zsh) 
    chsh -s $ZSH_PATH

    new_shell=$(echo $SHELL)
    if [ $new_shell != "$ZSH_PATH" ]; then
      # The rest of the installs will not work if zsh is not the default shell
      echo "Shell did not change to zsh. Reach out to an instructor before continuing"
      exit
    fi
else
    echo "Already using zsh as default shell"
fi

# Install Node - Needs to run after zsh setup
if ! command -v nvm &> /dev/null; then
  echo -e "Installing Node Version Manager..."

  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
  source ~/.zshrc &>zsh-reload.log
fi

nvm install --lts
nvm use --lts

echo -e "\n\nInstalling a web server and a simple API server..."
npm config set prefix $HOME/.npm-packages
echo 'export PATH="$PATH:$HOME/.npm-packages/bin"' >> ~/.zshrc
source ~/.zshrc &>zsh-reload.log
npm i -g serve json-server cypress
# End Node Set up

# Add SSH key to Github account - Needs to run after apt installs
PUBLIC_KEY=$HOME/.ssh/id_nss.pub
if [ ! -f "$PUBLIC_KEY" ]; then
  echo -e "\n\nGenerating an SSH key so you can backup your code to Github..."
  echo "yes" | ssh-keygen -t rsa -f ~/.ssh/id_nss -N "" -b 4096 -C $emailAddress
  eval `ssh-agent`
  ssh-add ~/.ssh/id_nss
  echo -e "Host *\n\tAddKeysToAgent yes\n\tIdentityFile ~/.ssh/id_nss" >> ~/.ssh/config
fi

echo -e "\n\nAdding your SSH key to your Github account..."
PUBLIC_KEY_CONTENT=$(cat $HOME/.ssh/id_nss.pub)
curl \
  -X POST \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer $githubPassword"\
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/user/keys \
  -d "{\"key\":\"$PUBLIC_KEY_CONTENT\",\"title\":\"NSS Automated Key\"}"

git config --global user.name "$studentName"
git config --global user.email $emailAddress
# End Git set up

echo -e "\n\n\n\n"
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
echo "@@                                                             @@"
echo "@@                   S U C C E S S !!!                         @@"
echo "@@                                                             @@"
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
