# Command Line Interface - The Terminal

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

## Videos to Watch

1. [Bash Basics Part 1 of 8 | Access and Navigation](https://youtu.be/eH8Z9zeywq0?t=885)
1. [Beginner's Guide to the Bash Terminal](https://www.youtube.com/watch?v=oxuRxtrO2Ag)
1. [The Most Important Thing You'll Learn in the Command Line](https://www.youtube.com/watch?v=q7-aEspwwEI)
1. Go through the CodeAcademy [command line course](https://www.codecademy.com/learn/learn-the-command-line).
1. [Shell Scripting Tutorial](https://www.youtube.com/watch?v=hwrnmQumtPw)

## Practice

1. Create the following directory structure in your `workspace` directory.
   ```sh
   workspace
   +-- cli
       +-- practice
           +-- create
   ```
1. `cd` to the `create` directory with one command `cd ~/workspace/cli/practice/create`. Remember to use tab completion.
1. While in this directory, create a new file named `foo` in the `cli` directory. Do not `cd` to `cli`, but rather use your navigation abilities.
   ```sh
   touch ../../foo
   ```
1. Put some simple content in the file using the `echo` command.
   ```sh
   echo 'Foo, I am your father' > ../../foo
   ```
1. Now use the `cat` command to read those contents.
   ```sh
   cat ../../foo
   ```
1. Do not change directories, and create a file named `bar` in the `practice` directory.
1. Remove the `foo` file you created earlier with the `rm` command.
1. `cd` back up to the `cli` directory.
1. Remove the `practice` directory and all of its contents.



## Advanced Challenge: Terminal Welcome Message

> **NOTE:** Advanced challenges are only to be attempted once the practice exercises are complete and you feel you both (a) a solid grasp on the basic knowledge of the current topic, and (b) you have adequate time to devote to them. They are intended to be difficult to solve and you must spend time researching it before any instructor will offer guidance.

The terminal can do everything that all of your other applications you have, or ever will have, can do. There's just not a visual interface for doing it. It's all just text.

In this advanced challenge, you should research bash variables, bash aliases, and find out how to customize your `zsh` _(.zshrc)_ or `bash` _(.bashrc)_ intialization script to have a welcome message show up every time your launch a terminal session.

![welcome message in the terminal](./images/terminal-welcome.gif)

Helpful searches to get you started:

1. https://duckduckgo.com/?q=bash+my+username&ia=web
1. https://duckduckgo.com/?q=bash+current+day&ia=web
1. https://duckduckgo.com/?q=bash+display+calendar&ia=web
1. https://duckduckgo.com/?q=bash+script+for+beginners&ia=web
1. https://github.com/robbyrussell/oh-my-zsh