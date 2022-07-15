# Initializing A Git Repository

## Making Coffee House Into A Git Repo

The purpose of this exercise is to walk you through how to make any project directory you make into a Git repo that can track your changes and be pushed up to Github. Without first initializing it, your projects aren't capable of using Git!

Here are the steps we will be taking:

1. Initialize your projects as a git repo
1. Make your first commit
1. Create a GitHub repo to push you code to

## Terms To Know

**Repository**: Also called "Repo", it is a group of files that comprise a project. For example, I may code a project to make a cat website. All of the those files would be kept in a repository.

You already have a few repositories. The directory that holds your Congressional project could be considered a repo.

**Commit**: A commit saves all of the changes you've made to your files since your last commit.

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

## Git Repo Creation

### Initialize your Git repo

Okay now that our global setup is done we can get to work on initializing your first Git repo. You will have to do this on every project you want to be use git with but you only have to do it once.

1. Navigate to your project directory for Coffee House. It may be named differently than what we have below.
   ```sh
   cd ~/workspace/coffee-house
   ```
1. **_IMPORTANT_**: Always make sure you are in the top level directory! For us that would be coffee-house. We don't want to be in any sub-directories inside of that, like our styles directory for example. That would only make our styles folder a git repo and not our whole project.
1. Type in the following command

   ```
   git init
   ```

1. You now have a git repository!

### What makes this a git directory?

The magic that is Git is in the `.git` directory that gets created when the `git init` command is executed. To see this directory you can use `ls -la`, which shows hidden files and directories (operating systems will not show files and directories that begin with a period by default, they are considered hidden, or system assets).

This file is what tracks your git history, meaning all the changes that have ever happened in this repo. This little file is essentially what makes up all of what git is. If you were to delete it then all of that history would be gone and your repo would no longer be a Git repo.

## Making Your First Commit

When you first initialize a Git repo that already has code in it your code won't automatically be tracked. You have to make your first commit!

Let's go ahead and do that for our Coffee House project.

```sh
git add --all
git commit -m "First Commit"
```

> Please note this should be the **_ONLY_** time you ever use the `git add --all` command. When you commit changes as you are working you need to add each one of your files one by one. If you don't then you can't guarantee you aren't committing changes that you don't want to save. This can be disastrous later!

Now that you have your code committed you'll need to create a Github repository where you will push your code.

## Backing Up and Sharing Code on Github

Github is a _software as a service_ (SAAS) that allows you to back up your repository to the cloud and share it with other software developers. Note that it is not the same thing as git, which is an application you are running locally on your machine. Github and git are made to talk to each other, but they are separate entities.

### Create Github Repo

1. Log into your Github account.
1. Click the `+` sign in the top right corner.
1. Choose "New repository".
1. In the "Repository name" field, enter in `coffee-house`.
1. Scroll down and click the green "Create Repository" button. You don't need to worry about the other options right now.
1. Find the _"…or push an existing repository from the command line"_ section in on the page and follow those instructions.

![Github Repo Instructions](../images/github-create-repo.png)

Once you have finished your code should be backed up and on Github!! Go back to your browser where your Github instructions were, and refresh the page. You will see that your remote repository backup now has your coffee house project in it!
