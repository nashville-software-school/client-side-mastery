# Things You Need

## Journal

Get a nice journal and a comfortable pen, and start keeping a daily journal of what you are learning every day. Writing you thoughts on a regular basis [increases your ability to remember it](https://www.lifehack.org/articles/featured/writing-and-remembering-why-we-remember-what-we-write.html). There are even studies that found writing is [beneficial for your health](https://www.apa.org/monitor/sep01/keepdiary.aspx).

## Hardware

Up until now, you didn't have the power to destroy your machine, but within the first two weeks of attending Nashville Software School you will have that power. Go buy a backup drive RIGHT NOW and start backing up your entire hard drive.

**Seriously, right now!**

## Online Services

### Github

Github is the primary site that software developers throughout the world use to store their code, and share it with other developers. Visit the [sign up page](https://github.com/join) and create your own, free account.

### AWS Free Tier account

You will be learning how to use several services provided on the [Amazon Web Services](https://portal.aws.amazon.com/gp/aws/developer/registration/index.html) platform. The free tier provides you with one year of all the resources you will need to deploy your finished products to a custom domain name for future employers to see.

### Jobtrack

Create an account at [Jobtrack](https://jobtrack.io/) so that you can keep track of contacts you make throughout the next 6 months. In about 4.5 months, you will also use this to track jobs that you've applied to, and other information about interviews, hiring managers, etc.

## Software

### Node

Visit the [Node.js](https://www.nodejs.org) site and install the LTS release.

### Install Slack

Do not use the browser-based interface for Slack. Download and use the client. Let us know if you did not get an invitation to the Nashville Software School Slack organization, and we'll send you one immediately.

### Google Chrome

[Google Chrome](https://www.google.com/chrome/browser/desktop/index.html) is the most popular browser for web developers because of the powerful tools it provides to test code, manipulate documents, and measure performance.

### Visual Studio Code

Visual Studio Code is the editor we will all be working on to start the course.

Mac users can run this command from the terminal app to install it.

```sh
brew cask install visual-studio-code
```

Windows users must visit the [Visual Studio Code](https://code.visualstudio.com/) website to download and install the code editor.

Suggested extensions to install

1. [ESlint](https://marketplace.visualstudio.com/items?itemName=dbaeumer.vscode-eslint)
1. [FontSize Shortcuts](https://marketplace.visualstudio.com/items?itemName=fosshaas.fontsize-shortcuts)
1. [Git Lens](https://marketplace.visualstudio.com/items?itemName=eamodio.gitlens)
1. [Quokka.js](https://marketplace.visualstudio.com/items?itemName=WallabyJs.quokka-vscode)
1. [REST Client](https://marketplace.visualstudio.com/items?itemName=humao.rest-client)

---

## For OSX Users Only

### Xcode Command Line Tools

Since you are going to be learning how to be a professional software developer, you will be using your computer terminal heavily. OSX users need to install some baseline tools to use more advanced things later in the course.

Type this command into your terminal, and then wait a while.

```sh
xcode-select --install
```

### Command Line Launcher

Set up VS Code to be [launched from the command line](https://code.visualstudio.com/docs/setup/mac).

### Homebrew

Visit the [homebrew home page](http://brew.sh/) and follow the single instruction there to get it installed.

### Oh My Zsh

1. If you haven't install Homebrew from the previous step, please complete that first.
1. Install zsh which is a powerful replacement for the standard bash terminal by typing the following command into the terminal
    ```sh
    brew install zsh zsh-completions
    ```
1. Install [Oh My Zsh](http://ohmyz.sh/) which is a framework for Z shell which makes the terminal a pleasure to work in. Use the following command.
    ```sh
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    ```

### Show Hidden Files

While you have your terminal open, enter in the following command.

```sh
defaults write com.apple.finder AppleShowAllFiles YES
```

This will allow you to view hidden files in the Finder app.

### Create SSH key

SSH is a technology that allows you to create a very secure connection between your computer, and a computer located somewhere else in the world. It's an acronym for Secure SHell. When you create an SSH key on your computer, it actually creates two files

1. A public key file that you share with other people and computers. It is usually named `id_rsa.pub`.
1. A private key file that you never, ever, ever, ever, ever share with anyone. It is usually named `id_rsa`.

Follow the [Github instructions](https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/#platform-mac) for creating a new SSH key, and providing your public key to Github, so that you can establish a secure connection between your computer and Github's computers.

---

## For Windows Users Only

### Install Git Bash

Visit the [Git powershell](http://www.git-scm.com/downloads) download page click the "Download for Windows" button, and once complete, install the software. Powershell is a command line utility that allows you to run most Unix command inside a Windows environment. This will help you have the same vernacular as the rest of the class, since having a *nix environment is preferred and is how the class is taught.

### Chocolatey Package Manager

Windows, like OSX, does not have a built in package manager (a fancy term for a piece of software that lets you easily install other software that you need as a developer). There will be times, many weeks into class, as you gain confidence and skill, that you will want to use a package manager. Therefore, if you feel up to the task - meaning, you were able to install all the required software easily - you may want to install Chocolately.

Here's the [official page](https://chocolatey.org/), but it's instructions are written to an audience of existing software developers and may be confusing for a layperson. Here's the basic instructions.

1. Press your Windows key.
1. Type `cmd` into the search box.
1. You'll see a black box as the first search result named `cmd`.
1. Right click that icon and select the "Run as administrator" option. This opens up the _**Windows Command Line**_.
1. When that starts, copy the following command with Ctrl+C, and once that's done paste it into the command line by right-clicking anywhere in that window.
  `@powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin`

### Create SSH key

SSH is a technology that allows you to create a very secure connection between your computer, and a computer located somewhere else in the world. It's an acronym for Secure SHell. When you create an SSH key on your computer, it actually creates two files

1. A public key file that you share with other people and computers. It is usually named `id_rsa.pub`.
1. A private key file that you never, ever, ever, ever, ever share with anyone. It is usually named `id_rsa`.

Follow the [Github instructions](https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/#platform-windows) for creating a new SSH key, and providing your public key to Github, so that you can establish a secure connection between your computer and Github's computers.
