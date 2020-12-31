# Bash Functions

Open your shell's initialization file with the following command.

If you're using Windows/bash

```sh
code ~/.bashrc
```

If you're using MacOS/zsh

```sh
code ~/.zshrc
```

## Make a Directory and Immediately Navigate to It

Add the following function to the file.

```sh
mg () {
  mkdir -p "$1" && cd $_
}
```

This function combines `mkdir` and `cd`. If you are in workspace, you can type in the command `mg practice` and it will make the `practice` directory and immediately place you in it.

## Boilerplate Project Code

Then place this content at the bottom of the file and save it.

```sh
simplehtml () {
    mkdir styles
    mkdir scripts
    echo '<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Nashville Software School</title>
        <link rel="stylesheet" href="./styles/main.css">
    </head>

    <body>
        <main id="container">

        </main>

        <script type="module" src="./scripts/main.js"></script>
    </body>
</html>' >> index.html

    echo '@import url("https://fonts.googleapis.com/css?family=Comfortaa|Patua+One");

/*Typography
--------------------------------------------------------------*/
body,
button,
input,
select,
textarea {
	color: #404040;
	font-family: "Comfortaa", Arial, sans-serif;
	font-size: 14px;
	line-height: 1.5;
}

h1,h2,h3,h4,h5,h6 {
  font-family: "Patua One", serif;
  letter-spacing: 2px;
}' >> styles/main.css

    echo 'console.log("Welcome to the main module")' >> scripts/main.js
  }
```

Back in your terminal, reload the initialization file with the `source` command.

```sh
source ~/.bashrc
```

or

```sh
source ~/.zshrc
```

Now in your terminal, you can create a new directory and type `simplehtml` and it will create the boilerplate files for you.
