# Configuring Windows Subsystem for Linux

## WSL Installation

First - check the build on your version of Windows
1. Go to `Settings > System > About`
1. Scroll down  and check the OS Build. If you are 16215 or later, you're good to go. If not, check for updates and update your OS.


### Enable Developer mode.

Click the Windows icon and navigate to `Settings -> Update and Security -> For developers` and make sure the `Developer Mode` radio button is selected.

### Turn On Windows Subsystem for Linux

1. Press the Windows icon and start typing `Turn Windows Features On or Off`
1. Scroll to the bottom of the list and check the `Windows Subsystem For Linux` box.
1. When prompted, restart your computer.

### Download a Linux Distro

1. Click the Windows Icon and search for `Store` and open the Microsoft Store
1. In the search bar of the store, search for `Ubuntu`
1. Click on the `Ubuntu 18.04` icon and click `download`
   > If you are prompted to sign in, just click "skip"

### Create a Unix Login

1. Once WSL has been enabled, your system has been rebooted, and Ubuntu has been download, click the Windows icon and type `cmd` and launch the windows command prompt.
1. In the cmd prompt type `bash` to initiate the Ubuntu install.
1. You will be prompted to enter a username and password
   > Note, this username and password are different from your Windows login credentials. They are not synced together. Think of this a logging into an entirely different system.

You're done! You now have an instance of Linux running inside your CMD terminal on Windows.

# Customization

If you would like to add some custom themes to your terminal, I would recommend downloading and installing an app called [hyper](https://hyper.is/). Hyper is a customizable terminal emulator available on Windows that we can use to access our Linux system.

## Hyper Installation

### Download Hyper

1. Visit https://hyper.is/ and download the Windows (.exe) version of the app
1. (If you'd like) set up a [theme](https://hyper.is/themes)
   > Note - if for some reason you get an error like "hyper is not a known command" see Troubleshooting portion at the bottom of this document

### Hyper automatically opens in bash
1. Open up hyper and type `ctrl + ,`
1. Scroll down to the "Shell" setting and add `C:\\Windows\\System32\\bash.exe`


### Installing Zsh
1. Open hyper (which now should auto start in your linux bash shell) and run `sudo apt-get install zsh`
1. You will be prompted for your password and begin the install
>note that `sudo` in linux is the "super user. Basically it gives you elevated permission to do things otherwise not allowed. In this case it wants to make sure you are the owner of this device before 3rd party software is installed.
3. Open your bash config file by typing `nano ~/.bashrc` - this will open up the `.bashrc` file from your linux subsystem inside a text editor built in to the terminal.

1. Copy/paste this code at the top of the file
```
#set ZSH as default shell
if [ -t 1 ]; then
exec zsh
fi
```
This will start zsh up when bash is started (which gets started as soon as you open hyper)

### Install Oh-My-Zsh
Oh My Zsh is a wrapper for the zsh shell. Essentially it lest you do more customization for the appearance and allow you to take advantage of some plugins to make life in the terminal much easier.

1. Open your terminal and type `sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`
1. Read the [docs](https://github.com/robbyrussell/oh-my-zsh) for info on how to change themes and plugins.


# Accessing files
When you first start up your linux subsystem you will be put in the user directory for the linux account you just created. This is not where your Windows files live. You can access your windows files by typing `cd /mnt/c`.
WSL put all of your files coming from Windows in this `/mnt` directory. From there you can access all the files from your Windows computer.

>Note good rule of thumb to follow is: you can open windows files in linux but _never_ open linux files in windows. This has to do with how the files are stored. Make it a habit of only opening your linux config files inside the terminal and you'll be good.




# Troubleshooting

Here is a collection of stumbling blocks that you might run in to.

###  1. command not found: hyper

We are using Hyper, a Windows app, to access out Linux subsystem. Since Hyper is an app that ships with some native commands that will do things inside hyper (such as add a theme) we need a way to reference the hyper app from within hyper itself.

If you were to install this on a full blown linux or mac system (and even on windows if you were using the app to access the windows command prompt instead of this linux subsystem), the app is set up to recognize that the keyword `hyper` is a reference to the hyper app and everything following the key word is a command to do something in hyper.

However, we are using hyper in a slightly different manner. Instead of using the app to access you windows system, were using hyper to essentially look at another computer. And that other computer doesn't have hyper installed.

We need to tell the terminal "any time I type 'hyper' use the windows command prompt application to run whatever _follows_ the word hyper in the application hyper that lives in the /c drive"


TL; DR
1. open up your .zshrc file in an editor
1. toward the end of the file add this alias: `alias hyper="cmd.exe /c hyper"`
1. Back in your terminal run `source ~/.zshrc`


### 2. Git is making me login every time I want to push/pull from a repo

I initially had git bash installed and used that for months. As such, my windows system already had a `.gitconfig` file on my C/ drive. The `.gitconfig` file is a file that stores some basic configurations for your version of git to use. Additionally there is a git-credential-maneger.exe file that is created and used. This file stores your login username and password so you dont have to input it every time you want to push/pull from a repo.

If you have not downloaded git on windows, you should be good to configure everythign in linux, but if you have used Git Bash for Windows previously we need to add a line to the `.gitconfig`.

In your terminal type `git config --global credential.helper "/mnt/c/Program\\ Files/Git/mingw64/libexec/git-core/git-credential-manager.exe"`

This is telling git inside Linux to use the `git-credential-manager.exe` program that already exists on Windows as the credential manager in Linux.

TL; DR:
Having to input your username/password each push and pull from git? Type `git config --global credential.helper "/mnt/c/Program\\ Files/Git/mingw64/libexec/git-core/git-credential-manager.exe"` to fix it.

