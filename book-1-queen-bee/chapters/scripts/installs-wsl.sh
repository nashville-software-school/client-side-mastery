#!/bin/bash

clear
echo -e "\n   ************************************************"
echo -e "\n\tWELCOME TO NASHVILLE SOFTWARE SCHOOL\n"
echo -e "   ************************************************"
echo -e "\nWe are going to try to install as much software, and make as many"
echo -e "configurations as we possibly can in an automated script. If this"
echo -e "If this stops at any point, and you don't see a 'SUCCESS' message"
echo -e "please notify an mentor for assistance.\n\n"
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
DIRS=("$HOME/workspace" "$HOME/.ssh" "$HOME/.config" "$HOME/.npm-packages")
for DIR in "${DIRS[@]}"; do
  if [ -d "$DIR" ]; then
    echo "$DIR already exists"
  else
    mkdir -p $DIR
  fi
done

# Create SSH key
echo -e "\n\nGenerating an SSH key so you can backup your code to Github..."
echo "yes" | ssh-keygen -t ed25519 -f ~/.ssh/id_nss -N "" -b 4096 -C $emailAddress
eval `ssh-agent`
ssh-add ~/.ssh/id_nss
echo -e "Host *\n\tAddKeysToAgent yes\n\tIdentityFile ~/.ssh/id_nss" >> ~/.ssh/config

# Get latest updates
echo -e "\n\nUpdating the Ubuntu operating system..."
sudo apt-get update -y >>/dev/null 2>>error.log
sudo apt-get dist-upgrade -y >>/dev/null 2>>error.log
sudo apt install -y curl file build-essential libssl-dev libgtk2.0-0 libgtk-3-0 libgbm-dev libnotify-dev libgconf-2-4 libnss3 libxss1 libasound2 libxtst6 xauth xvfb  >>/dev/null 2>>error.log

# Switch to Zsh
ZSH_FOLDER=$HOME/.oh-my-zsh
if [ ! -d "$FOLDER" ]; then
  sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

curl -sL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt-get install -y nodejs

# Install global dependencies
echo -e "\n\nInstalling a web server and a simple API server..."
npm config set prefix $HOME/.npm-packages
echo 'export PATH="$PATH:$HOME/.npm-packages/bin"' >> $HOME/.profile
source $HOME/.profile &>profile-reload.log
npm i -g serve json-server >>progress.log 2>>error.log

# Add SSH key to Github account
echo -e "\n\nAdding your SSH key to your Github account..."
PUBLIC_KEY=$(cat $HOME/.ssh/id_nss.pub)

STATUS_CODE=$(curl \
  -s \
  --write-out %{http_code} \
  -X POST \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer $GH_PWD" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/user/keys \
  -d "{\"key\":\"$PUBLIC_KEY_CONTENT\",\"title\":\"NSS Automated Key\"}" >>progress.log 2>>error.log)

if [ ! $STATUS_CODE == 200 ]; then
  echo -e "POST for SSH key returned status code $STATUS_CODE" >>error.log
fi

echo -e "\n\nInstalling git and terminal customization tools..."
sudo apt install -y zsh git fonts-powerline 2>>error.log

# User settings for git
echo -e "\n\nConfigurating git settings..."
git config --global user.name "$studentName"
git config --global user.email $emailAddress

# Check if zsh is default shell. Switch if not.
current_shell=$(echo $SHELL)
if [ $current_shell == "/bin/bash" ]; then
  echo -e "\n\n\n"
  echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
  echo "@@                                                        @@"
  echo "@@   Change Needed: Switch to zsh                         @@"
  echo "@@   This change might require your Ubuntu password.      @@"
  echo "@@                                                        @@"
  echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
  ZSH_PATH=$(which zsh)
  if [ $? != 0 ]; then
    echo "FAILED: zsh not found. Skipping chsh" >>error.log
  else
    echo "zsh found... switching to $ZSH_PATH"
    SWITCHED=$(sudo chsh -s $ZSH_PATH 2>>error.log)
    if [ $? != 0 ]; then
      echo "FAILED: Could not chsh to zsh" >>error.log
    else
      source ~/.zshrc &>zsh-reload.log
      echo "Current shell is $(echo $SHELL)"
      new_shell=$(echo $SHELL)
      if [ $new_shell != "$ZSH_PATH" ]; then
        # The rest of the installs will not work if zsh is not the default shell
        echo "FAILED: Shell did not change to zsh." >>error.log
      fi
    fi
  fi
else
  echo "Already using zsh as default shell"
fi
# End zsh set up

# Install ohmyzsh
ZSH_FOLDER=$HOME/.oh-my-zsh
if [ ! -d "$FOLDER" ]; then
  echo "Installing oh-my-zsh"
  yes "yes" | sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh )"
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
# End Git set


echo "Installing VS Code Extensions"
code --install-extension streetsidesoftware.code-spell-checker --force
code --install-extension ms-python.black-formatter --force
code --install-extension formulahendry.auto-close-tag --force
code --install-extension fosshaas.fontsize-shortcuts --force
code --install-extension ecmel.vscode-html-css --force
code --install-extension ms-vsliveshare.vsliveshare --force
code --install-extension cardinal90.multi-cursor-case-preserve --force
code --install-extension ms-vscode-remote.vscode-remote-extensionpack --force
code --install-extension laurenttreguier.vscode-simple-icons --force


# BEGIN verification
echo -e "\n\n\n\n"
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
echo "@@                                                             @@"
echo "@@                   VERIFYING INSTALLS                        @@"
echo "@@                                                             @@"
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
echo ""

VERIFIED=1

if ! type brew &>/dev/null; then
  echo "Brew not installed"
  VERIFIED=0
else
  echo "Brew installed"
fi

if ! type node &>/dev/null; then
  echo "Node not installed"
  VERIFIED=0
else
  echo "Node installed"
fi

if ! type nvm &>/dev/null; then
  echo "nvm not installed"
  VERIFIED=0
else
  echo "nvm installed"
fi

if ! type serve &>/dev/null; then
  echo "serve not installed"
  VERIFIED=0
else
  echo "serve installed"
fi

if ! type json-server &>/dev/null; then
  echo "json-server not installed"
  VERIFIED=0
else
  echo "json-server installed"
fi
#END verification

echo -e "\n\n\n\n"
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
echo "@@                                                             @@"
echo "@@                   S U C C E S S !!!                         @@"
echo "@@                                                             @@"
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
echo -e "\n\nRun the following command to finalize the installation"
echo -e "\nsource ~/.zshrc"
