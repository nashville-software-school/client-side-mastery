# Chapter 1: Terminal Basics

Becoming comfortable with your terminal will make you a master of the computer.

## Basic Commands

1. `cd` - change directory.
1. `pwd` - print working directory; show where you are.
1. `mkdir` - make directory.
1. `ls` - list contents of a directory.
1. `clear` - clear the view.
1. `touch` - create file.
1. `cat` - read the contents of a file.
1. `cp` - copy files and directories.
1. `mv` - move files and directories.
1. `rm` - remove a single file
1. `rm -rf` - remove a directory and all of its contents

Feel free to print out a [cheat sheet](https://drive.google.com/file/d/1j5ZtphlOuRe5kihL3fc3fy27mfnXVPV4/view?usp=sharing) or keep on on your desktop for quick reference. 

## Videos to Watch

1. [Bash Basics Part 1 of 8 | Access and Navigation](https://youtu.be/eH8Z9zeywq0?t=885)
    Quick intro to Bash (15 minutes)
3. [Beginner's Guide to the Bash Terminal](https://www.youtube.com/watch?v=oxuRxtrO2Ag)
    Take a deeper look at your terminal (1 hour 15 minutes)
5. [The Most Important Thing You'll Learn in the Command Line](https://www.youtube.com/watch?v=q7-aEspwwEI)
    Fun tips & tricks for your terminal (7 minutes)

## Practice: Aquarium Directory &amp; Files

Before you start writing code for any application, you want to set up the directory structure and create some initial files on the file system first. During this first book of the NSS course, you are going to build a web page to track the inventory of a rare fish aquarium.

You can watch the [Martin's Aquarium Directories and Files](https://www.youtube.com/watch?v=ogHzpf4Kelk) video that will also show you the basic terminal commands to use for this.

Since all of the work you will be doing at NSS will be contained in the `~/workspace` directory, you need to create a `martins-aquarium` subdirectory.

```sh
{home directory}
    +-- workspace
        +-- martins-aquarium
```

Once the directory is created, you need to create the HTML file and the CSS file. The standard name for the initial HTML for any web site is `index.html`. Go ahead and `cd` into the `~/workspace/martins-aquarium` directory if you aren't there already.

Create the file with the following command.

```sh
touch index.html
```

Next, create a `styles` subdirectory and create a file named `main.css` in it.

Then `cd ..` to go up one directory level. Create another subdirectory named `scripts` and create a file named `main.js` in it.

## Challenge: Creating Content in a File

> **NOTE:** Throughout the course, you will find Challenges and Advanced Challenges. These are completely optional exercises that you can choose to do. All we ask is that you complete all of the regular practice exercises before attempting to take on a challenge.
>
> If your instruction team has moved on to a new chapter or topics, it is far more important to work on the current practice exercises for that new topic than spending more time on a previous challenge.

During your career, you will be using powerful and extensible code editors like Visual Studio, IntelliJ, Webstorm, Eclipse, and many others to create your code. However, there are times that you want to put just a couple lines of code or a comment in a file and you don't want to fire up your powerful editor just to do that.

Read the will-written answer to a [question on the Stack Exchange website](https://unix.stackexchange.com/questions/77277/how-to-append-multiple-lines-to-a-file) and see if you can figure out how to get the following CSS code into the `main.css` file without using Visual Studio Code, but the `echo` command instead.

```css
#fishtank {}

.fish {}

.fish__name {}
```
