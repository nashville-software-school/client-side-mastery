# Setting Up Your Project

## Learning Objectives

* You should be able to create new directories in the terminal with the `mkdir` command.
* You should be able to create new files in the terminal with the `touch` command.
* You should be able to navigate directories in the terminal with the `cd` command.


## Getting Started

1. Make a new project directory in workspace
    ```sh
    cd ~/workspace
    mkdir dynamite-duo
    ```
2. Navigate to your project directory
    ```sh
    cd dynamite-duo
    ```
3. Type in the `git init` command
4. You now have a git repository for tracking your progress

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
touch scripts/main.js scripts/database.js
```

## Add and Commit the Files

Time to start tracking the changes you will be making to these three files as you build the project.

First, stage these three files to be committed.

```sh
git add .
```

Then commit these files to your repository. Even though you don't any content in these files yet, you can still commit the fact that they were created.

```sh
git commit -m "Initial commit"
```

## Create Github Repo

Follow the official documentation from Github on <a href="https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-new-repository" target="_blank">Creating a new repository</a>. You are not going to be doing any of the optional items.

Now that you have a place to backup your code, make sure the SSH options is chosen and copy the repository's connection string.


Then copy the second set of command, paste them into your terminal, and run them.

Now that the code has successfully been backed up, go back to your browser, and refresh the Github page. You will see that your remote repository backup now has files uploaded.

![](./images/first-repo-steps.gif)

