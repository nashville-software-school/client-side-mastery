# 4. Git

## Why Are You Learning This?
---
As a professional developer, you **will** be working on a team. Modern software development is a team sport, not an individual one. Team members need the ability to write code independently, but then merge their individual code together when it's time to release a version of the software.

Git is the tool to allow a developer to work on an independent branch of the code base, and then merge in the work of others.

Github is a tool which allows you to easily share your code with other people, regardless of where they are located.

## Configure Git on Your Machine
---
### Git Version
Before we configure git, let's make sure your computer is up-to-date with a modern version. Run the following command.

```sh
git --version
```

You should see something like the following:

```sh
git version 2.29.2
```

Any version greater than `2.27` is sufficient. If you have a lesser version, you will need to upgrade. If you need to upgrade git, click [here](./GIT_UPGRADE.md).

# Configuring Git

Follow these instructions carefully. Do not skip any steps. It will make no sense for now, but that's ok. It's a necessary process.

## Basic Configuration Settings

You don't need to understand these. Just run them. You can be in any directory for these commands.

```sh
git config --global init.defaultBranch main
git config --global pull.rebase false
```

## Personal Configuration Settings

You can be in any directory for these commands.

First use the following command, but instead of typing `Mary Williams`, enter your name.

```sh
git config --global user.name "Mary Williams"
```

Then use the following command, but instead of typing `mary.williams@gmail.com`, enter the email address you used when you created your Github account.

```sh
git config --global user.email "mary.williams@gmail.com"
```

## Creating a Git Repository 
---
- Navigate to your project directory
 ```sh
cd ~/workspace/objects-intro
```
- Type in the git init command
```sh
git init
```
- Congratulations you now have a git repository


The magic is the `.git` directory that gets created when the `git init` command is executed. To see this directory you can use `ls -la`, which shows hidden files and directories.

> Operating systems will not show files and directories that begin with a period by default. They are considered hidden, or system assets.

## Status
---
The `git status` command is your BFF when working with git. It will always tell you the current status of your code. There is no such thing as typing `git status` too many times.

As a professional developer, I use `git status` nearly 100% of the time when I'm working through the process of changing and committing code to history.

## Staging a Commit
---
As you work on your files, git will immediately mark them as changed. Remember, the main purpose of git is to track changes to your code.

#### Check the current status of your files.

```sh
git status
```

Since git tracks all changes - unless you tell it to ignore some files, which we will cover later - your file will be recognized as a new, untracked file by git.

Next, tell git that you want to start tracking those files with `git add .` command. The period means "add all untracked files from this directory, and any sub-directories". But be careful! Using the add . command means you're adding all untracked files. It's a good habit, at least for the time being, to type git status after using this command to make sure you're not adding something you didn't expect.

So, go ahead and type `git status` again and git will have a new messages that you file is ready to be committed.

Next, you need to commit your changes. Every time you make a commit, git will keep track of how the code looked at that moment in time, in case you ever need to go back to a previous version. You commit your changes with the following command.

```sh
git commit -m "A descriptive message about what changes you made in this commit"
```

> <u> **Beginner  hint!** </u> *If you accidentally type git commit and hit enter without the -m and the message, you'll be taken to a screen that will make you feel like Alice through the looking glass. If this happens, for now just come see an instructor and we'll get you back to reality safely.*

Once you make your commit, do a git status one more time, and git will tell you that there's nothing left to commit.

## Push It (To The Limit) to Github 
---
Github is a _software as a service_ (SAAS) that allows you to back up your repository to the cloud and share it with other software developers. Note that it is not the same thing as git, which is an application you are running locally on your machine. Github and git are made to talk to each other, but they are separate entities.

When you are ready to share your code with your teammates, or the general public, you can push your repository to Github. Think of Github as an external drive you plug into your laptop to use as backup. Instead of it backing up the entire hard drive, you will back things up, one project at a time, only when you want to.

The first thing you need to do is create a new repository on Github's platform that you will use to backup the code on your laptop.

### Create a Github Repo
---
1. Log into your Github account.
1. Click the `+` sign in the top right corner.
1. Choose "New repository".
1. In the "Repository name" field, enter in `objects-intro`.
1. Scroll down and click the green "Create Repository" button.
1. You will be directed towards a quick set up page. Please copy the commands in the ***…or push an existing repository from the command line block of code.***
1. In your terminal, paste the commands you copied. You can either right click and select paste or hit `shift + insert`

Now that the code has successfully been backed up, go back to your browser, and refresh the page. You will see that your remote repository backup now has your JavaScript file in it.

> **Tip:** If you have any issues getting your code onto Github, see a member of your instructional team immediately so that you have a backup of your code. Pushing your code to Github is not optional. It's a required part of this program.
---
> Here is a handy reference. *PLEASE* bookmark this. Bookmarks are the best way to stay organized. Keeping multiple tabs open in multiple browsers is not just confusing and hard to navigate, it also makes Sarah's chest hurt. 
[Git Solo Workflow ](./GITHUB_FLOW.md)
