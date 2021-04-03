# Getting Started

## Journal

Get a nice journal and a comfortable pen, and start keeping a daily journal of what you are learning every day. Writing your thoughts on a regular basis [increases your ability to remember it](https://www.lifehack.org/articles/featured/writing-and-remembering-why-we-remember-what-we-write.html). There are even studies that found writing is [beneficial for your health](https://www.apa.org/monitor/sep01/keepdiary.aspx).

## Hardware

Up until now, you didn't have the power to destroy your machine, but within the first two weeks of attending Nashville Software School you will have that power. Go buy a backup drive _**RIGHT NOW**_ and start backing up your entire hard drive.

**Seriously, _right now!_**

## Browser - Google Chrome

Google Chrome is the most popular browser for web developers because of the powerful tools it provides to test code, manipulate documents, and measure performance.

Download [Google Chrome](https://www.google.com/chrome/browser/desktop/index.html), and then [make it your default browser](https://support.google.com/chrome/answer/95417?co=GENIE.Platform%3DDesktop&hl=en).

# Online Services

<a id="github"></a>

## GitHub

GitHub is the primary site that software developers throughout the world use to store their code, and share it with other developers. Visit the [sign up page](https://github.com/join) and create your own, free account.

##### _NOTE: When creating your GitHub account, be mindful of the fact that potential employers will be viewing your profile when you apply for jobs, so keep it professional._

## dbdiagram.io

Sign up on [dbdiagram.io](https://dbdiagram.io) and bookmark the site.

## devdocs.io

Bookmark the [devdocs.io](https://devdocs.io/) site. It contains documentation for nearly everything you will be learning during your time here at NSS.

# Installations

## Visual Studio Code

Visit the [Visual Studio Code](https://code.visualstudio.com/) website to download and install the code editor. This is the editor you will be using for the next 6 months.

## Git Bash (i.e. the terminal)

Later in the instructions, we will ask you to type a command into your terminal. For Windows, this is the **Git Bash** application.

Visit the [Git Bash](http://www.git-scm.com/downloads) download page click the "Download for Windows" button, and once complete, install the software.

## Windows Terminal Preview

Visit the [Windows Terminal Preview](https://www.microsoft.com/en-us/p/windows-terminal-preview/9n8g5rfz9xk3?cid=msft_web_chart&activetab=pivot:overviewtab) download page and open it in the Microsoft Store App. This will be your default terminal which you will use to navigate your file system, and run development tools throughout the course.

Once Windows Terminal Preview is installed:

1. Go to the `Start` menu (Windows key)
2. Search for `Windows Terminal Preview`
3. Open `Windows Terminal Preview`
4. By default, this will open a new PowerShell terminal window. _Do **not** use the PowerShell terminal window._
5. Click the down arrow <kbd>﹀</kbd> located at the top of the terminal window.
6. Select **Git Bash** from the dropdown menu to start a new **Git Bash** terminal window.

>##### _NOTE: **Always** use Git Bash, not PowerShell._

## Node

Visit the [Node.js](https://www.nodejs.org) site and click on the install button that has **"LTS"** in it. Once you download the software, install it, accepting all of the defaults along the way.

## Node Packages - Web and API Servers

Open Windows Terminal Preview and start a new **Git Bash** terminal window.

Run the following command in the terminal to install both `serve` and `json-server`:

```sh
npm i -g serve json-server
```

You will be using `serve` and `json-server` to run simple servers for various purposes in this course.

## Configuring Git

> ##### _NOTE: This step requires your GitHub username and email._
> ##### _If you have not yet registered for a [GitHub](#github) account, do that first._

Watch the video on how to [set up global Git configuration](https://youtu.be/66EB9oxGMzQ) using your GitHub username and the email address associated with your GitHub account. This will allow you to successfully back up your code to GitHub in a few days... once we show you how to do it.

## SSH Key

SSH is a technology that allows you to create a very secure connection between your computer, and a computer located somewhere else in the world. It's an acronym for Secure SHell. When you create an SSH key on your computer, it actually creates two files:

1. A public key file that you share with other people and computers. It is usually named `id_rsa.pub`.
1. A private key file that you never, ever, ever, ever, ever share with anyone. It is usually named `id_rsa`.

## Creating Your SSH Key

Watch a short video for [creating an SSH key in the terminal](https://youtu.be/znRMcNG9_qQ) so that you an work with GitHub.

## Add SSH Key to GitHub Account

Now watch the video for [adding your SSH key to your GitHub account](https://youtu.be/8hlmIObpMd4).
