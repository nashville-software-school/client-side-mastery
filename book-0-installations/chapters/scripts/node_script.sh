if ! command -v node &> /dev/null; then
  echo -e "\n\n\n\n"
  echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
  echo "@@                                                             @@"
  echo "@@   Installation Needed: Node.js                              @@"
  echo "@@                                                             @@"
  echo "@@                                                             @@"
  echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"

  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
  source ~/.zshrc &>zsh-reload.log
  nvm install --lts
  nvm use --lts
fi

# Install global dependencies
echo -e "\n\nInstalling a web server and a simple API server..."
npm config set prefix $HOME/.npm-packages
echo 'export PATH="$PATH:$HOME/.npm-packages/bin"' >> ~/.zshrc
source ~/.zshrc &>zsh-reload.log
npm i -g serve json-server cypress
