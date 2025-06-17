# Troubleshooting Visual Studio Code

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

