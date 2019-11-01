# Getting Started

## Journal

Get a nice journal and a comfortable pen, and start keeping a daily journal of what you are learning every day. Writing your thoughts on a regular basis [increases your ability to remember it](https://www.lifehack.org/articles/featured/writing-and-remembering-why-we-remember-what-we-write.html). There are even studies that found writing is [beneficial for your health](https://www.apa.org/monitor/sep01/keepdiary.aspx).

## Hardware

Up until now, you didn't have the power to destroy your machine, but within the first two weeks of attending Nashville Software School you will have that power. Go buy a backup drive RIGHT NOW and start backing up your entire hard drive.

**Seriously, right now!**

## Online Services

### Github

Github is the primary site that software developers throughout the world use to store their code, and share it with other developers. Visit the [sign up page](https://github.com/join) and create your own, free account.

### dbdiagram.io

Sign up on [dbdiagram.io](https://dbdiagram.io) and bookmark the site.

### devdocs.io

Bookmark the [devdocs.io](https://devdocs.io/) site. It contains documentation for nearly everything you will be learning during your time here at NSS.

## Software

### Install Git Bash (i.e. Terminal)

Later in the instructions, we will ask you to type a command into your terminal. For Windows, this is the **Git Bash** application.

Visit the [Git Bash](http://www.git-scm.com/downloads) download page click the "Download for Windows" button, and once complete, install the software. This will be your default terminal which you will use to navigate your file system, and run development tools throughout the course.

### Git Bash Initialization File

Once Git Bash is installed, run it. Once it is running, type in the following command.

```sh
echo 'alias gs="git status"' >> ~/.bashrc
```

### Google Chrome

[Google Chrome](https://www.google.com/chrome/browser/desktop/index.html) is the most popular browser for web developers because of the powerful tools it provides to test code, manipulate documents, and measure performance.

### Visual Studio Code

Visit the [Visual Studio Code](https://code.visualstudio.com/) website to download and install the code editor. This is the editor you will be using for the next 6 months.

### Node

Visit the [Node.js](https://www.nodejs.org) site and install the LTS release.

### Web Server

`http-server` is what you will use to make your web sites work in the browser. Open Git Bash if you haven't yet, and type in the following command.

```sh
npm i -g http-server
```

### Create SSH key

SSH is a technology that allows you to create a very secure connection between your computer, and a computer located somewhere else in the world. It's an acronym for Secure SHell. When you create an SSH key on your computer, it actually creates two files

1. A public key file that you share with other people and computers. It is usually named `id_rsa.pub`.
1. A private key file that you never, ever, ever, ever, ever share with anyone. It is usually named `id_rsa`.

Follow the [Github instructions](https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/#platform-windows) for creating a new SSH key, and providing your public key to Github, so that you can establish a secure connection between your computer and Github's computers.
