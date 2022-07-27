# Github Basics

## What is Git & Github ?

### Git

Git is a command-line tool for version control that allows users to keep track of different version of their source code.

Developers are always trying out new things and changing their code around. Git not only allows them to track their changes on a project over time, but also to create new versions to play with and throw away as needed.

### Github

Github is a _software as a service_ (SAAS) that allows you to back up your repository to the cloud and share it with other software developers. Note that it is not the same thing as git, which is an application you are running locally on your machine. Github and git are made to talk to each other, but they are separate entities.

## Terms To Know

**Repository**: Also called "Repo", it is a group of files that comprise a project. For example, I may code a project to make a cat website. All of the those files would be kept in a repository.

You already have a few repositories. The directory that holds your Congressional project could be considered a repo.

**Commit**: A commit saves all of the changes you've made to your files since your last commit.

**Branch**: Effectively, a pointer to a snapshot of your changes. When you want to add a new feature or fix a bug—no matter how big or how small—you spawn a new branch to encapsulate your changes. This will make more sense once you see it.

## Configure Git on Your Machine

First we have need to do a little set up in your terminal. **_You only need to do this once._**

Let's start with setting a name and email in your global git `config` file. This makes it easy to know who committed those changes when you create a commit! Eventually, when a teammate looks at the commit log, your set name/email will show up like this:

![username and email](../images/git-username-email.png)

First use the following command, but instead of typing `Your Github User Name`, enter your Github username for your Github account.

```sh
git config --global user.name "Your Github User Name"
```

Then use the following command, but instead of typing `email@example.com`, enter the email address you used when you created your Github account.

```sh
git config --global user.email "email@example.com"
```

## Common Git & Github Tasks

Every time you work on a project from now on you will be utilizing Git and Github to manage your code versioning. It's going to be confusing at first but the more you practice the more it will become second nature.

There's a lot you can do with Git & Github but for now we are only going to be talking about these main tasks:

- Initializing a Git repo
- Creating a new Github repo to push your code to
- Creating a new branch in Git
- Committing changes to your Git branch
- Backing up local code to Github

## Git Commands Cheat Sheet

`git status` - See what files have been changed and what files you have added to staging.

`git commit -m "You commit message"` - Save the changes you have made in the files you have staged.

`git add <file-name>` - Add a file to the files you are staging for a commit. Basically like designating what files changes you want to save.

`git checkout <branch-name>` - change the branch you're working on to an existing branch

`git checkout -b <new-branch-name>` - create a new branch to work on and change over to that one.

`git init` - initialize a git repo

`git push` - push the code you've committed to Github

## Tasks

### Initialize A Git Repo

In order to use Git in your project you will first have to initialize it. Repositories that you create don't automatically use Git, you have to set it up. You will need to do this on every project you want to be use git with but you only have to do it once.

1. Setting, or initializing, a git repo is easy and only involves on command. **_IMPORTANT_**: Always make sure you are in the top level directory!

   ```
   git init
   ```

1. That's it! You now have a Git repo.

When you first initialize a Git repo that already has code in it your code won't automatically be tracked. You have to make your first commit!

Here are the commands:

```sh
git add --all
git commit -m "First Commit"
```

> Please note this should be the **_ONLY_** time you ever use the `git add --all` command. When you commit changes as you are working you need to add each one of your files one by one. If you don't then you can't guarantee you aren't committing changes that you don't want to save. This can be disastrous later!

### Create Github Repo

For every project you make you will need to also create a corresponding Github repo to hold your project's code on Github. It's like a companion to your local Git repo!

Here's how you would create itL

1. Log into your Github account.
1. Click the `+` sign in the top right corner.
1. Choose "New repository".
1. In the "Repository name" field, enter you project's name.
1. Scroll down and click the green "Create Repository" button. You don't need to worry about the other options right now.
1. Find the instructional section on the page for what you need and follow the steps. For creating a repo for a project you already started you would use the _"…or push an existing repository from the command line"_ section.

![Github Repo Instructions](../images/github-create-repo.png)

Once you have finished your code should be backed up and on Github!! You can go back to your browser where your Github instructions were, and refresh the page. You will see that your remote repository backup now has your coffee house project in it!

#### What makes this a git directory?

The magic that is Git is in the `.git` directory that gets created when the `git init` command is executed. To see this directory you can use `ls -la`, which shows hidden files and directories (operating systems will not show files and directories that begin with a period by default, they are considered hidden, or system assets).

This file is what tracks your git history, meaning all the changes that have ever happened in this repo. This little file is essentially what makes up all of what git is. If you were to delete it then all of that history would be gone and your repo would no longer be a Git repo.

## Creating a new branch in Git

When you first create your repo there will only be one branch called "Main". This is your one source of the truth, all of the code that is in here should be your working code. You don't play with code here, its sacred ground. You wouldn't want to have a working app, then play with the code and break it, and then end up with a non-working app!

Instead you want to create what we call branches. They are like copies of our code that you can then safely make changes to without changing the code in the main branch.

Here is how we create a new branch. It's just one single command.

```
`git checkout -b <new-branch-name>`
```

## Committing changes to your Git branch

When we feel like that code in our branch looks good and we want to save it or "commit" it to our Git history. There are a few steps you have to go through before you push:

1. First see what files you have changed. This command will show a list of your changed files.
   ```
   git status
   ```
1. Now go through and add "stage" each file you want to commit. This is just designating what files are going to be part of your commit.
   ```
   git add <name-of-you-file>
   ```
1. Once all of the files are staged you can push
   ```
   git commit -m "your commit message"
   ```

## Backing Up Local Code to Github

Although you haven now committed your code that doesn't mean its in Github. When you are ready to push it to Github you can run:

```
git push
```

When you visit Github there will be a yellow banner at the top saying that new changes have been pushed asking if you want to create a PR. We will talk more about that later!
