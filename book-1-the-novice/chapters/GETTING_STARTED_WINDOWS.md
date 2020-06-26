# Getting Started

## Journal

Get a nice journal and a comfortable pen, and start keeping a daily journal of what you are learning every day. Writing your thoughts on a regular basis [increases your ability to remember it](https://www.lifehack.org/articles/featured/writing-and-remembering-why-we-remember-what-we-write.html). There are even studies that found writing is [beneficial for your health](https://www.apa.org/monitor/sep01/keepdiary.aspx).

## Hardware

Up until now, you didn't have the power to destroy your machine, but within the first two weeks of attending Nashville Software School you will have that power. Go buy a backup drive RIGHT NOW and start backing up your entire hard drive.

**Seriously, right now!**

## Github

Github is the primary site that software developers throughout the world use to store their code, and share it with other developers. Visit the [sign up page](https://github.com/join) and create your own, free account.

## dbdiagram.io

Sign up on [dbdiagram.io](https://dbdiagram.io) and bookmark the site.

## devdocs.io

Bookmark the [devdocs.io](https://devdocs.io/) site. It contains documentation for nearly everything you will be learning during your time here at NSS.

## Google Chrome

[Google Chrome](https://www.google.com/chrome/browser/desktop/index.html) is the most popular browser for web developers because of the powerful tools it provides to test code, manipulate documents, and measure performance.

## Visual Studio Code

Visit the [Visual Studio Code](https://code.visualstudio.com/) website to download and install the code editor. This is the editor you will be using for the next 6 months.

## Enable the Windows Subsystem for Linux

You'll need to install and enable the Windows Subsystem for Linux. You can follow the instructions below, or you can watch the [Enabling WSL in Powershell](https://youtu.be/Mzv6Pxppwoo) video to see how to enable the Linux subsystem.

1. Go to the `Start` menu (windows key) and search for `PowerShell`.
1. Run PowerShell as an Administrator. To do this, find the PowerShell application, then right-click on it and choose "Open as administrator".
1. Copy and paste this command into your PowerShell:

        Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux

1. Restart your computer when prompted to

## Install Ubuntu

Once you've completed the above steps **and** restarted your computer, you will [install Ubuntu from the Microsoft Store](https://www.microsoft.com/en-us/p/ubuntu-1804-lts/9n9tngvndl3q?activetab=pivot:overviewtab).

This is needed before you instal the Windows Terminal below.

## Install Windows Terminal

Later in the instructions, we will ask you to type a command into your terminal. For Windows, this is the **Windows Terminal (Preview)** application using **Ubuntu**.

Visit the [Windows Terminal (Preview)](https://www.microsoft.com/en-us/p/windows-terminal-preview/9n0dx20hk701?activetab=pivot:overviewtab) download page and open it in the Microsoft Store App. This will be your default terminal (using Ubuntu) which you will use to navigate your file system, and run development tools throughout the course.

Once Windows Terminal is installed:
1. Go to the `Start` menu (windows key) and search for `Windows Terminal`
2. Open `Windows Terminal (Preview)`
3. This will open up a new PowerShell Tab by default. In the top left corner of the terminal click the `Down Arrow`, and select **Ubuntu** to open a new Ubuntu Tab.

    > Ubuntu will begin to install and you'll be asked to wait for a minute or two for the installation to complete.

4. Once Ubuntu is done installing, you'll be prompted to create a new user (and its password).

## Ubuntu Starting Directory

By default, when you start the Ubuntu shell in Windows Terminal, your starting directory is your Windows user directory. You need to change it so that it starts in your Linux user directory.

Watch the [WSL Ubuntu Starting Directory](https://youtu.be/1hk6bWD8_5I) video to make that change.

## Node

You will install Node.js using the Windows Terminal. Open Windows Terminal, and in a **new Ubuntu Tab**, copy and paste the following lines:
```
curl -sL https://deb.nodesource.com/setup_13.x | sudo -E bash -
sudo apt-get install -y nodejs
```
After a while, you will be prompted with a message asking for permissions. Using the arrow keys on your keyboard, select **Yes** and hit the enter key to continue installing Node.js.

Make sure that Node was installed successfully by typing in your terminal:
```
node -v
```

- If you see the message `command not found`, go through the node installation again.

## Web Server

`serve` is what you will use to make your web sites work in the browser. Open Windows Terminal, (in a new Ubuntu Tab), if you haven't yet, and type in the following command:

```sh
sudo npm i -g serve json-server
```
### Did it work?

Make sure that `serve` was installed successfully by typing in your terminal:
```
serve -v
```

If you see the message `command not found`, type in `sudo npm i -g serve` again.

Make sure that `json-server` was installed successfully by typing in your terminal:
```
json-server -v
```

If you see the message `command not found`, type in `sudo npm i -g json-server` again.

## Homebrew

Visit the [homebrew home page](http://brew.sh/) and follow the single instruction there to get it installed. You will put the command they show you in your Windows Terminal with the Ubuntu shell running.

If you want, you can watch the [Installing Homebrew](https://youtu.be/fz80EW8MnKQ) video which shows the process.

### Did it work?

Make sure that homebrew was installed successfully by typing this in your terminal:
```
brew help
```

If you see the message `command not found`, go through the homebrew instructions again.

## Git

Git is how you and your teammates will work on a shard codebase during your time at NSS. Type in the following command to install. You can install the required software using Homebrew, which you just installed in the step above.

```sh
brew install git
brew install tig
```

### Did it work?

Make sure that Git was installed successfully by typing in your terminal: 
```
git --version
```

If you see the message `command not found`, go through the git installation again.


### Configuring Git

Once Git is done being installed, watch the video on how to [set up global Git configuration](https://youtu.be/66EB9oxGMzQ) so that you can successfully back up your code to Github in a few days... once we show you how to do it.

### Handling Permission Issues After Setup

Sometimes, a student has permission issues after installing and configuring Git. To ensure that this doesn't happen to you, watch the [Owning Your Git Config Directory](https://youtu.be/exva3J_jojc) video and follow the steps.


### Create SSH key

SSH is a technology that allows you to create a very secure connection between your computer, and a computer located somewhere else in the world. It's an acronym for Secure SHell. When you create an SSH key on your computer, it actually creates two files

1. A public key file that you share with other people and computers. It is usually named `id_rsa.pub`.
1. A private key file that you never, ever, ever, ever, ever share with anyone. It is usually named `id_rsa`.

### Creating Your SSH Key

Watch a short video for [creating an SSH key in the terminal](https://youtu.be/znRMcNG9_qQ) so that you an work with Github.

### Add SSH Key to Github Account

Now watch the video for [adding your SSH key to your Github account](https://youtu.be/8hlmIObpMd4).
