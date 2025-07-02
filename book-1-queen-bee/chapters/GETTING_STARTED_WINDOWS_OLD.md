# Installations

## Visual Studio Code

Visit the [Visual Studio Code](https://code.visualstudio.com/) website to download and install the code editor. This is the code editor you will be using for the next 3 months.

## Enable the Windows Subsystem for Linux


You'll need to install and enable the Windows Subsystem for Linux. You can follow the instructions below, or you can watch the [Enabling WSL in Powershell](https://youtu.be/Mzv6Pxppwoo) video to see how to enable the Linux subsystem.

1. Go to the `Start` menu (windows key) and search for `PowerShell`.
1. Run PowerShell as an Administrator. To do this, find the PowerShell application, then right-click on it and choose "Open as administrator".
1. Copy and paste this command into your PowerShell:

```sh
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
```

1. Restart your computer when prompted to.

## Ubuntu

Once you've completed the above steps **and** restarted your computer, you will [install Ubuntu from the Microsoft Store](https://www.microsoft.com/en-us/p/ubuntu/9nblggh4msv6?activetab=pivot:overviewtab).

This is needed ***before*** you install the Windows Terminal below.

## Windows Terminal

Later in the instructions, we will ask you to type a command into your terminal. For Windows, this is the **Windows Terminal** application using **Ubuntu**.

Visit the [Windows Terminal](https://www.microsoft.com/en-us/p/windows-terminal/9n0dx20hk701?activetab=pivot:overviewtab) download page and open it in the Microsoft Store App. This will be your default terminal (using Ubuntu) which you will use to navigate your file system, and run development tools throughout the course.

Once Windows Terminal is installed:

1. Go to the `Start` menu (windows key)
1. search for `Windows Terminal`
1. Open `Windows Terminal`
1. By default, this will open a new PowerShell terminal window. _Do **not** use the PowerShell terminal window._
1. Click the down arrow <kbd>﹀</kbd> located at the top of the terminal window.
1. Select **Ubuntu** to open a new **Ubuntu Tab**.

    > _Ubuntu will begin to install and you'll be asked to wait for a minute or two for the installation to complete._
    >
    > **IMPORTANT:** It is very important that you remember both the username and password that you create in the next step. If you need to write them down to remember them, that's a great strategy.

1. Once Ubuntu is done installing, you'll be prompted to create a new user (and its password).


## Ubuntu Starting Directory

By default, when you start the Ubuntu shell in Windows Terminal, your starting directory is your Windows user directory. You need to change it so that it starts in your Linux user directory.

1. In the terminal type `cd` and press enter.
1. Type `pwd` and press enter. The path that outputs is called the **home directory** for Ubuntu.

Watch the [WSL Ubuntu Starting Directory](https://www.youtube.com/watch?v=n1YSFT5VK-Y) video to ensure that when you run Ubuntu, you start in the correct directory.

## Required Linux (WSL) Commands

Once you are done installing and configuring Ubuntu, open a new Ubuntu shell in Windows Terminal and run the following commands. If something doesn't work, or you see error messages, call an mentor immediately.

```sh
sudo apt-get install build-essential
sudo apt-get install build-essential --fix-missing
sudo apt-get update --fix-missing
```

## Security Token for Installations

In order to automate the installation of the tools you need _(which happens in the next section)_, you need to create a Github Personal Access Token.

1. Go to your Github account, and access your settings by clicking on your profile avatar at the top-right of the screen.

    <img src="./images/github-token-access-settings.gif" alt="Access Github settings" width="600px" />

1. In the menu options on the left, scroll to, and click, the last item labeled **Developer Settings**. Then click on **Personal access tokens**.

    <img src="./images/github-token-developer-settings.gif" alt="Access Github settings" width="300px" />

1. Then generate a Personal Access Token with a name of **NSS Installs Token**. Make it expire in 7 days. Scroll down into the permissions and check the `admin:public_key` checkbox and click it. Then scroll all the way down and save the token. **It is important you do not close, or refresh the browser tab until you complete the automated installs in the next section.**

    <img src="./images/github-token-creating-token.gif" alt="Access Github settings" width="600px" />

## Basic Installations (automated)

1. Copy pasta the following command into the terminal and hit enter to run it. It will attempt to install some of the basic tools you need for NSS.

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/nashville-software-school/client-side-mastery/master/book-1-queen-bee/chapters/scripts/installs-wsl.sh)"
```




## Troubleshooting for mentors

1. Open Powershell as admin
1. Run `dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart`
1. Visit https://aka.ms/wsl2kernel to download the virtualization update
