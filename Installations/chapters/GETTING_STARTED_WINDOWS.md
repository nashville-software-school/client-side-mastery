# Installations

## Visual Studio Code

Visit the [Visual Studio Code](https://code.visualstudio.com/) website to download and install the code editor. This is the code editor you will be using for the next 3 months.

## Install the Windows Subsystem for Linux

This process will install a new operating system _inside_ your Windows operating system. I know it sounds intimidating, but it's not.

1. Go to the `Start` menu (windows key) and search for `PowerShell`.
1. Run PowerShell as an Administrator. To do this, find the PowerShell application, then right-click on it and choose "Open as administrator".
1. Think of a username and password for this new operating system now. You will need it in the next step.
1. Copy and paste this command into your PowerShell.

    ```sh
    wsl --install -d ubuntu
    ```

1. After the installation is done, a new window will come up and you will be prompted for your username and password. Your password won't appear as you type it. That's normal.
1. Keep this window open for now.




## Security Token for Installations

In order to automate the installation of the tools you need _(which happens in the next section)_, you need to create a Github Personal Access Token.

1. Go to your Github account, and access your settings by clicking on your profile avatar at the top-right of the screen.

    <img src="./images/github-token-access-settings.gif" alt="Access Github settings" width="600px" />

1. In the menu options on the left, scroll to, and click, the last item labeled **Developer Settings**. Then click on **Personal access tokens**.

    <img src="./images/github-token-developer-settings.gif" alt="Access Github settings" width="300px" />

1. Then generate a Personal Access Token with a name of **NSS Installs Token**. Make it expire in 7 days. Scroll down into the permissions and check the `admin:public_key` checkbox and click it. Then scroll all the way down and save the token. **It is important you do not close, or refresh the browser tab until you complete the automated installs in the next section.**

    <img src="./images/github-token-creating-token.gif" alt="Access Github settings" width="600px" />

## Basic Installations (automated)

1. Copy pasta the following command into the Ubuntu terminal from the last section and hit enter to run it. It will attempt to install some of the basic tools you need for NSS.

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/nashville-software-school/client-side-mastery/master/book-0-installations/chapters/scripts/installs-wsl.sh)"
```

## Windows Terminal

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

<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>

## Troubleshooting for Instructors

<details>
<summary>
Instructors: Expand for help
</summary>
If you run into problems during installation, someone on the instruction team will use the following info to help you. You can ignore this section.

For reference, here's the [Microsoft Install WSL instructions](https://docs.microsoft.com/en-us/windows/wsl/install).

### Enable Virtualization

If someone gets the `Please enable the Virtual Machine Platform Windows feature and ensure virtualization is enabled in the BIOS.` message when installing Ubuntu, try the following steps.

1. Open Powershell as admin
1. Run the following commands.
    ```sh
    Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
    dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
    dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
    ```
1. Have student visit https://aka.ms/wsl2kernel to download and install the Linux kernel update package.
1. Reboot the machine.
1. Uninstall Ubuntu.
1. Install again and see if it fixes it.
</details>