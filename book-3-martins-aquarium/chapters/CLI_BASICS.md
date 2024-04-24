# Setting Up Your Project

## Learning Objectives

* You should be able to create new directories in the terminal with the `mkdir` command.
* You should be able to create new files in the terminal with the `touch` command.
* You should be able to navigate directories in the terminal with the `cd` command.


## Getting Started

1. Make a new project directory in workspace
    ```sh
    cd ~/workspace
    mkdir martins-aquarium
    ```
2. Navigate to your project directory
    ```sh
    cd martins-aquarium
    ```
3. Type in the `git init` command
4. You now have a git repository for tracking your progress

### Configure Auto Import in Visual Studio Code

1. In VS Code, press ctrl+, on Windows, or cmd+, on Mac to open settings
2. Search for the word "import"
3. Scroll down to the setting **JavaScript > Preference > Import module specifier ending** and change it to `.js/.ts`.

## Project Files

Once the directory is created, you need to create the HTML file and the CSS file. The standard name for the initial HTML for any web site is `index.html`.

Create the file with the following command.

```sh
touch index.html
```

Next, create a `styles` sub-directory and create a file named `main.css` in it.

```sh
mkdir styles
touch styles/main.css
```

Create another sub-directory named `scripts` and create a file named `main.js` in it.

```sh
mkdir scripts
touch scripts/main.js
```

Once all of the files are created, make sure you add and commit them before pushing them to Github.

```sh
git add index.html styles/main.css scripts/main.js
git commit -m "First commit for Martin"
```

## Create Github Repo

1. Log into your Github account.
1. Click the `+` sign in the top right corner.
1. Choose "New repository".
1. In the "Repository name" field, enter in `martins-aquarium`.
1. Scroll down and click the green "Create Repository" button.
1. Copy the repository's connection string.
    ![](./images/copy-github-connection-string.gif)
2. Follow the instructions for pushing an existing repository from the command line.
    ![](./images/add-origin.png)

Now that the code has successfully been backed up, go back to your browser, and refresh the page. You will see that your remote repository backup now has your aquarium HTML, JavaScript and CSS files in it.
