## Installations

### Rectangle

[Download and install Rectangle](https://www.rectangleapp.com/) and after it is installed, open the application to try it out.

This application will allow you to use certain combinations of keys on your keyboard to move and resize applications while you are developing.

<a id="homebrew"></a>

## Homebrew

Visit the [Homebrew](http://brew.sh/) website and follow the single instruction there to get it installed.

<details>
    <summary>This section is for instructors who may need to troubleshoot problems</summary>

After installing Homebrew, you may get the following warning:

`/opt/homebrew/bin is not in your PATH`

This may be fixed with this command:

```
export PATH=/opt/homebrew/bin:$PATH
```

#### Troubleshooting for instructors (don't try this yourself)

After installing Homebrew, you may get the following warning:

```
/opt/homebrew/bin is not in your PATH
```

This may be fixed with this command:

```
export PATH=/opt/homebrew/bin:$PATH
```
</details>

## Visual Studio Code

Visual Studio Code is the editor we will all be working on to start the course.

##### _Run the following command in the terminal to install Visual Studio Code:_

```sh
brew install --cask visual-studio-code
```

### Launch Visual Studio Code From Command Line

[Follow these steps](https://code.visualstudio.com/docs/setup/mac) to set up Visual Studio Code to be launched from the command line.


<details>
    <summary>This section is for instructors who may need to troubleshoot problems</summary>

If the `code` command doesn't work...

Try updating the PATH by following these steps:

1. ##### _Run the following command in the terminal to open the `.zshrc` file:_

```sh
open ~/.zshrc
```

2. ##### _Copy the following code and paste it at the end of the file_
```sh
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
```

3. ##### _Save your changes_ (<kwd>⌘S</kwd>), _but keep the file open._

4. ##### _In the terminal, open a new window (<kwd>⌘N</kwd>) _and run the `code` command._

```sh
code
```

If the `code` command is still not found...

Try creating a bash function by following these steps:

1. ##### _Remove the exported PATH from the bottom of the `.zshrc` file, and save._ (<kwd>⌘S</kwd>)

##### _Copy the following code and paste it at the end of the file._

```sh
code () {
    if [[ $# = 0 ]]
    then
        open -a "Visual Studio Code"
    else
        [[ $1 = /* ]] && F="$1" || F="$PWD/${1#./}"
        open -a "Visual Studio Code" --args "$F"
    fi
}
```

3. ##### _Save your changes_ (<kwd>⌘S</kwd>).

4. ##### _In the terminal, open a new window (<kwd>⌘N</kwd>) _and run the `code` command._

```sh
code
```

</details>

## Node

Visit the [Node.js](https://www.nodejs.org) site and install the **"LTS"** release.

## Node Packages - Web and API Servers

Now that you have Node installed, you can install some open source software that you will need in the course.

#### _Run the following command in the terminal to install `serve` and `json-server`:_
```sh
sudo npm i -g serve json-server
```

#### _To confirm `serve` was installed successfully, run the following in the terminal:_
```sh
serve -v
```

If you see no error message hit the `Ctrl+C` keyboard combination to stop the service from running.

If you see the message `command not found` :

#### _Run the following command in the terminal to install `serve`:_

```sh
sudo npm i -g serve
```

#### _To confirm `json-server` was installed successfully, run the following in the terminal:_

```sh
json-server -v
```

If you see no error message hit the `Ctrl+C` keyboard combination to stop the service from running.

If you see the message `command not found` :
#### _Run the following command in the terminal to install `json-server`:_
```sh
sudo npm i -g json-server
```

## Xcode - Command Line Tools

Since you are going to be learning how to be a professional software developer, you will be using your computer terminal heavily. Mac users need to install some baseline tools to use more advanced things later in the course.

#### _Run the following command in the terminal to install Command Line Tools:_

```sh
xcode-select --install
```

## Git

Git is how you and your teammates will work on a shard codebase during your time at NSS.

#### _Run the following commands in the terminal:_

```sh
brew install git tig
```

## Configuring Git

> ##### _NOTE: This step requires your GitHub username and email. If you have not yet registered for a [GitHub](#github) account, do that first._

Watch the video on how to [set up global Git configuration](https://youtu.be/66EB9oxGMzQ) using your GitHub username and the email address associated with your GitHub account. This will allow you to successfully back up your code to GitHub in a few days... once we show you how to do it.

### Handling Permission Issues After Setup

Sometimes, a student has permission issues after installing and configuring Git. To ensure that this doesn't happen to you, watch the [Owning Your Git Config Directory](https://youtu.be/exva3J_jojc) video and follow the steps.

## Z-shell

Z-shell, or _"zsh"_, is a powerful replacement for the standard Bash terminal.

##### _Run the following command in the terminal to install `zsh`:_

```sh
brew install zsh zsh-completions
```

## Oh My Zsh

[Oh My Zsh](http://ohmyz.sh/) is a framework for Z-shell which makes the terminal a pleasure to work in.

##### _Run the following command in the terminal to install `oh-my-zsh`:_

```sh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

## Show Hidden Files

Your computer has a lot of files that are intentionally hidden to prevent everyday users from accidentally changing really important stuff. As a software developer, you will be interacting with these important files on a regular basis, so let's make sure you can see them in your Finder Application as well as your terminal.

##### _Run the following command in the terminal:_

```sh
defaults write com.apple.finder AppleShowAllFiles YES
killall Finder
```

Open your Finder application again. Now you should be able to see all the files that are normally hidden.

## SSH Key

SSH is a technology that allows you to create a very secure connection between your computer and a computer located somewhere else in the world. It's an acronym for Secure SHell. When you create an SSH key on your computer, it actually creates two files:

1. A public key file that you share with other people and computers. It is usually named `id_rsa.pub`.
1. A private key file that you never, ever, ever, ever, ever share with anyone. It is usually named `id_rsa`.

### Creating Your SSH Key

Watch a short video for [creating an SSH key in the terminal](https://youtu.be/znRMcNG9_qQ) so that you an work with GitHub.

### Add SSH Key to GitHub Account

Now watch the video for [adding your SSH key to your GitHub account](https://youtu.be/8hlmIObpMd4).
