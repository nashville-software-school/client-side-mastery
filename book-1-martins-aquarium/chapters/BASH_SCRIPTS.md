# Aliases and Functions in Bash

### Aliases

Aliases are useful for accelerating your development workflow. You define aliases in your `.bashrc` file with the `alias` keyword. Let's look at an example.

You will often get lost in the command line, and going back to your home directory - where all your files live - can help you reset and find what you're looking for. You can create an alias named `gohome` which will take you there when you're lost.

Open the `.bashrc` initialization file in your favorite code editor, and enter in the following alias.

`alias gohome="cd ~"`

> **Pro tip:** Make sure there are no spaces before, or after, the equals sign in an alias.

Save the file, and reload your init file with the `source` command in the terminal.

`source ~/.bashrc`

The command is now ready to use, and will be available now every time you open a new terminal.

### Bash Functions

A bash function let's you combine mutiple commands, and accept parameters for those commands. Let's look at an example.

During the course, you will often be creating directories on your file system, and then immediately navigating to that directory.

```sh
mkdir MyAwesomeApp
cd MyAwesomeApp
```

Let's create a bash function to accelerate that workflow. Open `.bashrc` and enter in the following function.

```sh
mg(){
    mkdir -p "$1"
    cd "$1"
}
```

`mg` is shorthand for `make and goto`. Source your init file, and then try it out.

```sh
mg MyAwesomeApp
```

It will create the directory and then immeidate `cd` to it.

### Function to make a basic project

Copy and paste the following function into your `.bashrc` file. Then type the command `source ~/.bashrc`. This function will create a new directory, go into it, create a local git repo, and create all the files you need with just one command.

```
# make a new directory, cd into it, create js/html/css files, and link them up
basicProj(){
    mkdir -p "$1"
    cd "$1"
    git init
    touch index.html
    touch script.js
    touch style.css
    echo "<!DOCTYPE html>
<html lang=\"en\">
  <head>
    <meta charset=\"UTF-8\" />
    <meta name=\"viewport" content="width=device-width, initial-scale=1.0\" />
    <meta http-equiv=\"X-UA-Compatible\" content=\"ie=edge\" />
    <link rel=\"stylesheet\" href=\"style.css\" />
    <title>Document</title>
  </head>
  <body>
    <script src=\"script.js\"></script>
  </body>
</html>" > index.html
}
```

## What is a Shell?

At its base, a shell is simply a macro processor that executes commands. The term macro processor means functionality where text and symbols are expanded to create larger expressions.

A bash shell is both a command interpreter and a programming language. As a command interpreter, the shell provides the user interface to the rich set of utilities for your operating system. The programming language features allow these utilities to be combined. Files containing commands can be created, and become commands themselves. These new commands have the same status as system commands in directories such as /bin, allowing users or groups to establish custom environments to automate their common tasks.

Shells may be used interactively or non-interactively. In interactive mode, they accept input typed from the keyboard. When executing non-interactively, shells execute commands read from a file.

Shells also provide a small set of built-in commands (builtins) implementing functionality impossible or inconvenient to obtain via separate utilities. For example, cd, break, continue, and exec cannot be implemented outside of the shell because they directly manipulate the shell itself. The history, getopts, kill, or pwd builtins, among others, could be implemented in separate utilities, but they are more convenient to use as builtin commands. All of the shell builtins are described in subsequent sections.

While executing commands is essential, most of the power (and complexity) of shells is due to their embedded programming languages. Like any high-level language, the shell provides variables, flow control constructs, quoting, and functions.

Shells offer features geared specifically for interactive use rather than to augment the programming language. These interactive features include job control, command line editing, command history and aliases.

## Practice

### Help Function

You're going to make your own help manual for the terminal. Open your `~/.bashrc` file in your code editor and add the following lines to it.

```sh
help () {
    clear
    echo " - gohome                    Takes me to my home directory"
    echo " - cat [filename]            Outputs the contents of a file right in the terminal"
    echo " - touch [filename]          Creates a new file"
    echo " - mkdir [directory]         Creates a new directory"
    echo " - mg [directory]            Creates a new directory and goes into it"
    echo " - basicProj [directory]     Creates a new directory with HTML, CSS, and JS files"
}
```

Source your initialization file.

`source ~/.bashrc`

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