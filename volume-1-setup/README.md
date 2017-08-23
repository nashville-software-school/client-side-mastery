# Hardware

Up until now, you didn't have the power to destroy your machine, but within the first two weeks of attending Nashville Software School you will have that power. Go buy a backup drive RIGHT NOW and start backing up your entire hard drive.

**Seriously, right now!**

# Things you need to install

## Everyone

### Install Slack

Do not use the browser-based interface for Slack. Download and use the client. Let us know if you did not get an invitation to the Nashville Software School Slack organization, and we'll send you one immediately.

### Google Chrome

[Google Chrome](https://www.google.com/chrome/browser/desktop/index.html) is the most popular browser for web developers because of the powerful tools it provides to test code, manipulate documents, and measure performance.

### Create a Github account

Github is the primary site that software developers throughout the world use to store their code, and share it with other developers. Visit the [sign up page](https://github.com/join) and create your own, free account.

### Visual Studio Code

Visit the [Visual Studio Code](https://code.visualstudio.com/) website to download and install the code editor.

Suggested extensions to install

1. ESlint
1. FontSize Shortcuts
1. Git History
1. join-lines
1. Quokka.js
1. Debugger for Chrome

## For OSX Users Only

Set up VS Code to be [launched from the command line](https://code.visualstudio.com/docs/setup/mac).

### Oh My Zsh

1. Install [Z shell](https://github.com/robbyrussell/oh-my-zsh/wiki/Installing-ZSH) which is a powerful replacement for the standard bash terminal
1. Install [Oh My Zsh](http://ohmyz.sh/) which is a framework for Z shell which makes the terminal a pleasure to work in

### Homebrew

Visit the [homebrew home page](http://brew.sh/) and follow the single instruction there to get it installed.

### Create SSH key

SSH is a technology that allows you to create a very secure connection between your computer, and a computer located somewhere else in the world. It's an acronym for Secure SHell. When you create an SSH key on your computer, it actually creates two files

1. A public key file that you share with other people and computers. It is usually named `id_rsa.pub`.
1. A private key file that you never, ever, ever, ever, ever share with anyone. It is usually named `id_rsa`.

Follow the [Github instructions](https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/#platform-mac) for creating a new SSH key, and providing your public key to Github, so that you can establish a secure connection between your computer and Github's computers.

## For Windows Users Only

### Git Bash

Visit the [Git Bash](http://www.git-scm.com/downloads) download page click the "Download for Windows" button, and once complete, install the software. Powershell is a command line utility that allows you to run most Unix command inside a Windows environment. This will help you have the same vernacular as the rest of the class, since having a *nix environment is preferred and is how the class is taught.

Git is a program that allows software developers to efficiently manage how their code is versioned, shared, and archived. You will be learning how to use it during class.

### Create SSH key

SSH is a technology that allows you to create a very secure connection between your computer, and a computer located somewhere else in the world. It's an acronym for Secure SHell. When you create an SSH key on your computer, it actually creates two files

1. A public key file that you share with other people and computers. It is usually named `id_rsa.pub`.
1. A private key file that you never, ever, ever, ever, ever share with anyone. It is usually named `id_rsa`.

Follow the [Github instructions](https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/#platform-windows) for creating a new SSH key, and providing your public key to Github, so that you can establish a secure connection between your computer and Github's computers.

### Chocolatey Package Manager

Windows, like OSX, does not have a built in package manager (a fancy term for a piece of software that lets you easily install other software that you need as a developer). There will be times, many weeks into class, as you gain confidence and skill, that you will want to use a package manager. Therefore, if you feel up to the task - meaning, you were able to install all the required software easily - you may want to install Chocolately.

Here's the [official page](https://chocolatey.org/), but it's instructions are written to an audience of existing software developers and may be confusing for a layperson. Here's the basic instructions.

1. Press your Windows key.
1. Type `cmd` into the search box.
1. You'll see a black box as the first search result named `cmd`.
1. Right click that icon and select the "Run as administrator" option. This opens up the _**Windows Command Line**_.
1. When that starts, copy the following command with Ctrl+C, and once that's done paste it into the command line by right-clicking anywhere in that window.
  `@powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin`

