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
