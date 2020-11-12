## Aliases and Functions in Bash

### Aliases

Aliases are useful for accelerating your development workflow. You define aliases in your shell's initialization file (`.bashrc` or `.zshrc`) with the `alias` keyword. Let's look at an example.

```sh
alias gs="git status"
alias gc="git checkout"
alias gcb="git checkout -b"
alias gpom="git push origin master"
```

Save the file, and reload your init file with the `source` command in the terminal.

`source ~/.bashrc`

or

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

It will create the directory and then immediately `cd` to it.

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

`source ~/.bashrc`

or

`source ~/.zshrc`

Then you can use your help function.

![help command example](./images/Bn6CSVqGxO.gif)
