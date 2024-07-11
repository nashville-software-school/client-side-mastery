# Installations

## Install XCode

This process will take some time, and it is needed for future steps, so you get it out of the way first. If you have an older or slower computer, it may appear as if nothing is happening, but it is. Just wait until the process is complete.

```sh
xcode-select --install
```

## Security Token for Installations

In order to automate the installation of the tools you need, you need to create a Github Personal Access Token.

1. Open a new tab in your browser.
2. Go to this site [https://github.com/settings/profile](https://github.com/settings/profile)
3. In the menu options on the left, scroll down to and click the item labeled **Developer Settings**.
4. Click **Personal access tokens**
5. Click **Tokens (classic)**
6. Click **Generate new token** button
7. Choose **Generate new token (classic)**
8. Complete 2-factor authentication if you set that up

You will now see the screen to generate a token.

1. In the **Note** field, enter _NSS Installs Token_.
2. Make it expire in 7 days.
3. Scroll down into the permissions and check the `admin:public_key` checkbox and click it.
4. Scroll all the way down and click **Generate token**.
5. Your new token will then be displayed to you with a green background color, and will start with `ghp_`.
6. Click the copy icon next to it to copy it to your clipboard.
7. Open the **Terminal** application on your Mac.
8. Enter the following text into the Terminal but don't press the return key.
   ```sh
   export PERSONAL_ACCESS_TOKEN=
   ```
9. Press **Command+V** to paste your personal access token at the end. If nothing happened, go back to the browser and copy your access token again.
10. Press the return key.
11. Copy and paste the following command into the terminal. It will ask you to enter in some information about your Github account.
    ```sh
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/nashville-software-school/course-bash-scripts/main/client/create-key.sh)"
    ```
12. Once that process is complete, you should see the following output. If you see anything different contact an mentor.
    ```txt
    POST for SSH key returned status code 200
    ```

## Install Homebrew

Run the following command in your Terminal. You will be prompted for your computer password. It will not display the characters as you type them for security reasons.

```sh
/bin/bash -c "$(curl -fsSL https://github.com/nashville-software-school/course-bash-scripts/blob/main/client/install-homebrew.sh)"
```

Once the process is complete, run the `brew` command in your terminal. If you see the output `command not found: brew` then contact an mentor.

## Install Modern Shell

Run the following command in your Terminal.

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/nashville-software-school/course-bash-scripts/main/client/configure-zsh.sh)"
```

Once complete, run the following command in your Terminal.

```sh
echo $SHELL
```

You should see either `/usr/local/bin/zsh` or `/bin/zsh` as the output of that command. If you don't, contact an mentor.

## Install Node

Run the following command in your Terminal.

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/nashville-software-school/course-bash-scripts/main/client/install-nvm-node.sh)"
```

Once the process is complete, quit your Terminal application completely, and then open it again immediately.

Run the `node -v` command in your Terminal. If you see the output `command not found: node` then contact an mentor.

## Verify Developer Installations

Run the following command to verify all developer installations are complete. If you see any error message that something isn't installed, contact an mentor.

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/nashville-software-school/course-bash-scripts/main/client/verify-installs.sh)"
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

## Troubleshooting for mentors

<details>
<summary>Expand if you are an mentor troubleshooting an issue</summary>
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
