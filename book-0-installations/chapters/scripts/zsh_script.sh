sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

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
else
    echo "Already using zsh as default shell"
fi

new_shell=$(echo $SHELL)

if [ $new_shell != "/bin/zsh" ]; then
  echo "Shell did not change to zsh. Reach out to an instructor before continueing"
  exit
