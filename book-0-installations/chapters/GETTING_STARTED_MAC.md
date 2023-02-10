# Installations

## Security Token for Installations

In order to automate the installation of the tools you need _(which happens in the next section)_, you need to create a Github Personal Access Token.

1. Go to your Github account, and access your settings by clicking on your profile avatar at the top-right of the screen.

    <img src="./images/github-token-access-settings.gif" alt="Access Github settings" width="600px" />

1. In the menu options on the left, scroll to, and click, the last item labeled **Developer Settings**. Then click on **Personal access tokens**.

    <img src="./images/github-token-developer-settings.gif" alt="Access Github settings" width="300px" />

1. Then generate a Personal Access Token with a name of **NSS Installs Token**. Make it expire in 7 days. Scroll down into the permissions and check the `admin:public_key` checkbox and click it. Then scroll all the way down and save the token. **It is important you do not close, or refresh the browser tab until you complete the automated installs in the next section.**

    <img src="./images/github-token-creating-token.gif" alt="Access Github settings" width="600px" />

## Basic Installations (automated)

1. Open the Terminal application on your Mac.
1. Copy pasta the following command into the terminal and hit enter to run it. It will attempt to install some of the basic tools you need for NSS.

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/nashville-software-school/client-side-mastery/master/book-0-installations/chapters/scripts/installs-all-mac-users.sh)"
```

## Rectangle

[Download and install Rectangle](https://www.rectangleapp.com/). This application will allow you to use certain combinations of keys on your keyboard to move and resize applications while you are developing.

Invest 9 minutes of your time to watch the [Using Rectangle to Manage macOS Windows](https://www.youtube.com/watch?v=tFeDyqZG4z4) video now to learn how to use Rectangle. If you start using it **today**, then you will save yourself hours upon hours of headache and lost productivity as you learn to become a professional software developer.

## Launch Visual Studio Code From Command Line

[Follow these steps](https://code.visualstudio.com/docs/setup/mac) to set up Visual Studio Code to be launched from the command line.


---

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

## Troubleshooting

<details>
<summary>Expand if you are an instructor troubleshooting an issue</summary>
<h2>Visual Studio Code</h2>

Follow the [Troubleshooting Visual Studio Code](./TROUBLESHOOT_VSCODE.md) steps to resolve student issues


<h2>Homebrew Troubleshooting</h2>

After installing Homebrew, you may get the following warning:

`/opt/homebrew/bin is not in your PATH`

This may be fixed with this command:

```
export PATH=/opt/homebrew/bin:$PATH
```

After installing Homebrew, you may get the following warning:

```
/opt/homebrew/bin is not in your PATH
```

This may be fixed with this command:

```
export PATH=/opt/homebrew/bin:$PATH
```

<h2>Handling Permission Issues After Setup</h2>

Sometimes, a student has permission issues after installing and configuring Git. To ensure that this doesn't happen to you, watch the [Owning Your Git Config Directory](https://youtu.be/exva3J_jojc) video and follow the steps.
</details>