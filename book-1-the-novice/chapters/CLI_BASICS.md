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

## Advanced commands & options

1. Perform actions that affect the entire machine with `sudo`
1. Quickly edit files with vim `vim filename`
1. Use `mkdir -p` to automatically make every directory in a new path
1. Use wildcards when moving or copying files, e.g. `cp *.js ./`
1. Use the `-r` option with `mv` or `cp` to recursively perform the action on all sub-directories
1. Use double bang `!!` to repeat last command, or prefix it with `sudo`, for example.

## Aliases and Functions in Bash

### Aliases

Aliases are useful for accelerating your development workflow. You define aliases in your `.zshrc` file with the `alias` keyword. Let's look at an example.

You will often get lost in the command line, and going back to your home directory - where all your files live - can help you reset and find what you're looking for. You can create an alias named `gohome` which will take you there when you're lost.

Open the `.zshrc` initialization file - which is in your home directory - in your favorite code editor, and enter in the following alias.

`alias gohome="cd ~"`

> **Pro tip:** Make sure there are no spaces before, or after, the equals sign in an alias.

Save the file, and reload your init file with the `source` command in the terminal.

`source ~/.zshrc`

The command is now ready to use, and will be available now every time you open a new terminal.

### Bash Functions

A bash function let's you combine mutiple commands, and accept parameters for those commands. Let's look at an example.

During the course, you will often be creating directories on your file system, and then immediately navigating to that directory.

```sh
mkdir MyAwesomeApp
cd MyAwesomeApp
```

Let's create a bash function to accelerate that workflow. Open `.zshrc` and enter in the following function.

 ```sh
mg() {
  [ -n "$1" ] && mkdir -p "$@" && cd $_;
}
 ```

`mg` is shorthand for `make and goto`. Source your init file, and then try it out.

```sh
mg MyAwesomeApp
```

It will create the directory and then immeidate `cd` to it.

## What is a Shell?

At its base, a shell is simply a macro processor that executes commands. The term macro processor means functionality where text and symbols are expanded to create larger expressions.

A bash shell is both a command interpreter and a programming language. As a command interpreter, the shell provides the user interface to the rich set of utilities for your operating system. The programming language features allow these utilities to be combined. Files containing commands can be created, and become commands themselves. These new commands have the same status as system commands in directories such as /bin, allowing users or groups to establish custom environments to automate their common tasks.

Shells may be used interactively or non-interactively. In interactive mode, they accept input typed from the keyboard. When executing non-interactively, shells execute commands read from a file.

Shells also provide a small set of built-in commands (builtins) implementing functionality impossible or inconvenient to obtain via separate utilities. For example, cd, break, continue, and exec cannot be implemented outside of the shell because they directly manipulate the shell itself. The history, getopts, kill, or pwd builtins, among others, could be implemented in separate utilities, but they are more convenient to use as builtin commands. All of the shell builtins are described in subsequent sections.

While executing commands is essential, most of the power (and complexity) of shells is due to their embedded programming languages. Like any high-level language, the shell provides variables, flow control constructs, quoting, and functions.

Shells offer features geared specifically for interactive use rather than to augment the programming language. These interactive features include job control, command line editing, command history and aliases.

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

## Functions

You're going to make your own help manual for the terminal. Open your `~/.zshrc` file in your code editor and add the following lines to it.

```sh
help () {
    clear
    echo " - gohome                    Takes me to my home directory"
    echo " - cat [filename]            Outputs the contents of a file right in the terminal"
    echo " - touch [filename]          Creates a new file"
    echo " - mkdir [directory]         Creates a new directory"
    echo " - mg [directory]            Creates a new directory and goes into it"
}
```

Source your initialization file.

`source ~/.zshrc`

Then you can use your help function.

![help command example](./images/Bn6CSVqGxO.gif)

## Tree Command

The `tree` command lists all the files and directories, recursively. It can be useful to see the file structure of your applications. 

For OS X, you can install the tree command by typing this command in your terminal: `brew install tree`.

For PC, you will add an alias for the tree command to your `.bashrc`:

1. Type in `code ~/.bashrc` to open your bash file. 
1. Add in `alias tree="cmd //c tree/f"` to the file.
1. Make sure you save the file.
1. Reload `.bashrc` by running the following command: `source ~/.bashrc`.

Run the command by typing in `tree`.
