The command line is something every developer should learn and implement into their daily routine. It has become a Swiss Army knife of features behind deceptively simple commands, which allow you to gain greater control of your system, become more productive, and much more. For example, you can write scripts to automate daily, time-consuming tasks, and even quickly commit and push code to a Git repository with just a few simple commands.

In this post we’ll look at the Bash Shell (**B**ourne **A**gain **SH**ell), which is a command-line interface (CLI) and is currently the most widely used shell. This is a light introduction into the most popular commands, when you’re most likely to use them, and how to extend them with options. Later on in this article, you’ll learn how to create your own custom commands (aliases), allowing you to create shortcuts for a single command or a group of commands.

When it comes down to it, if you don’t know the command line, you’re not using your computer to its full potential.

**ls — List directory contents**

`ls` is probably the most common command. A lot of times, you’ll be working in a directory and you’ll need to know what files are located there. The ls command allows you to quickly view all files within the specified directory.

- Syntax: `ls` [option(s)] [file(s)]
- Common options: -a, -l

**echo — Prints text to the terminal window**

`echo` prints text to the terminal window and is typically used in shell scripts and batch files to output status text to the screen or a computer file. Echo is also particularly useful for showing the values of environmental variables, which tell the shell how to behave as a user works at the command line or in scripts.

- Syntax: `echo` [option(s)] [string(s)]
- Common options: -e, -n

**touch — Creates a file**

`touch` is going to be the easiest way to create new files, but it can also be used to change timestamps on files and/or directories. You can create as many files as you want in a single command without worrying about overwriting files with the same name.

- Syntax: `touch` [option(s)] file_name(s)
- Common options: -a, -m, -r, -d

**mkdir — Create a directory**

`mkdir` is a useful command you can use to create directories. Any number of directories can be created simultaneously which can greatly speed up the process.

- Syntax: `mkdir` [option(s)] directory_name(s)
- Common options: -m, -p, -v

**pwd — Print working directory**

`pwd` is used to print the current directory you’re in. As an example, if you have multiple terminals going and you need to remember the exact directory you’re working within, then pwd will tell you.

- Syntax: `pwd` [option(s)]
- Common options: options aren’t typically used with pwd

**cd — Change directory**

`cd` will change the directory you’re in so that you can get info, manipulate, read, etc. the different files and directories in your system.

- Syntax: `cd` [option(s)] directory
- Common options: options aren’t typically used with cd

**mv — Move or rename directory**

`mv` is used to move or rename directories. Without this command, you would have to individually rename each file which is tedious. `mv` allows you to do batch file renaming which can save you loads of time.

- Syntax: `mv` [option(s)] argument(s)
- Common options: -i, -b

**cat — Read a file, create a file, and concatenate files**

`cat` is one of the more versatile commands and serves three main functions: displaying them, combining copies of them, and creating new ones.

- Syntax: `cat` [option(s)] [file_name(s)] [-] [file_name(s)]
- Common options: -n

**cp — copy files and directories**

Use this command when you need to back up your files.

- Syntax: `cp` [option(s)] current_name new_name
- Common options: -r, -i, -b