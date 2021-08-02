# Git and Github Basics

## Why Are You Learning This?

As a professional developer, you **will** be working on a team. Modern software development is a team sport, not an individual one. Teams members need the ability to write code independently, but then merge their individual code together when it's time to release a version of the software.

**Git** is the local tool on your computer that tracks the changes you make to files, allows a developer to work on an independent branch of the code base, and makes collaboration easier by allowing changes by multiple people to all be merged into one source.

**Github** is a code hosting platform for version control and collaboration, which allows you to easily share your code with other people, regardless of where they are located.

## Configure Git on Your Machine

### Git Version

Before we configure git, let's make sure your computer is up-to-date with a modern version. Run the following command.

```sh
git --version
```

You should see something like the following:

```sh
git version 2.29.2
```

Any version greater than `2.27` is sufficient. If you have a lesser version, you will need to upgrade. Let your instructor know and they will help you.

### Configure Git
> **Note** We don't expect you to understand the following steps but we do need them all complete.

First configure git to use `main` as the default branch name.

```sh
git config --global init.defaultBranch main
```

Second, tell git who you are. You'll need to set a name and email in your global git `config` file. This makes it easy to know who committed changes!

![username and email](./images/git-username-email.png)

Third, use the following command, but instead of typing `Your Github User Name`, enter your Github account username.

```sh
git config --global user.name "Your Github User Name"
```

Fourth, use the following command, but instead of typing `email@example.com`, enter the email address you used when you created your Github account.

```sh
git config --global user.email "email@example.com"
```

Finally, tell git which _merge strategy_ to use when we do a `git pull`.

```sh
git config --global pull.rebase false
```


## Create a Git Repository

1. With terminal, navigate to your coffee-houses project directory
    ```sh
    cd ~/workspace/coffee-houses
    ```
1. Type in the `git init` command
1. You now have an empty git repository - meaning nothing has been tracked yet.

The magic is the `.git` directory that gets created when the `git init` command is executed. To see this directory you can use `ls -la`, which shows hidden files and directories. Operating systems will not show files and directories that begin with a period by default. They are considered hidden, or system assets.

> **Special Note** Most often you will want to ignore certain files within a directory and not track them with git. This can be accomplished by creating a .gitignore file and listing the items that should not be tracked. For example, anyone working with a Mac or collaborating with Mac users should ignore a file called `.DS_Store`.

> 👉 **Mac Users** Make a global .gitignore file and let git know that you want to use this file for all of your repositories

```sh
echo .DS_Store >> ~/.gitignore_global

git config --global core.excludesfile ~/.gitignore_global
```


## Make Your First Commit

### Workflow to Remember

This is the process you will be following thousands of times while you are here at NSS. First you tell git which files to track and then you commit them with a message. 

Kinda like: "Hey git, add files A, B, and C to to this specific commit and this is why..."

```sh
git add --all
git commit -m "Message about commit"

```

### Commit Coffee Houses

Time to make your first commit on your coffee houses project. Make sure you are in `~/workspace/coffee-houses` and then tell git that you want to track all of your files.

```sh
git add --all
```

```sh
git status
```

Next commit the changes with a message. This adds to the historical record of your project.

```sh
git commit -m "Version 1 of the coffee houses project."
```

 > _Hint!_ If you accidentally type `git commit` and hit enter without the `-m` and the message, you'll be taken to a screen that will make you feel helpless. We have all done it. Get out of VIM with the following command.

 ```sh
 :q!
 ```
> And then commit again

```sh
git status
```

Now create a Github repository where you will upload your code.

## Back-Up and Share Code on Github

Github is a _software as a service_ (SAAS) that allows you to back-up your repository to the cloud and share it with other software developers. Note that it is not the same thing as git, which is an application you are running locally on your machine. Github and git are made to talk to each other, but they are separate entities.

## Push to Github

When you are ready to share your code with your teammates, or the general public, you can push your repository to Github. Think of Github as an external drive you plug into your laptop to use as back-up. Instead of it backing-up the entire hard drive, you will back things up, one project at a time, only when you want to.

The first thing you need to do is create a new repository on Github's platform.

### Create Github Repo

1. Log into your Github account.
1. Click the `+` sign in the top right corner.
1. Choose "New repository".
1. In the "Repository name" field, enter in `coffee-houses`.
1. Scroll down and click the green "Create Repository" button.
1. From the on-screen instructions, copy the repository's connection string.
    ![](./images/copy-github-connection-string.gif)
1. From the on-screen instructions, follow the second set of instructions.
    ![](./images/add-origin.png)

Now that the code has successfully been uploaded, go back to your browser, and refresh the page. You will see your remote repository with the coffee house files.


## Practice: Create Repos and Back-up Your Exercises

* Create a Github repository for the Congressional Representative exercise, and push up that code.
* Create a Github repository for the in class demo, and push up that code.
* Create a Github repository for your Journal and push up the code.

When you are done, you should have new repositories in your Github account including:

1. Coffee Houses
1. Congressional Representative
1. In class demo

> **Tip:** If you have any issues getting your code onto Github, see a member of the instruction team immediately. **Pushing your code to Github is not optional. It's a required part of this program.**
