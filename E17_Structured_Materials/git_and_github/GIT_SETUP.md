# Setting up Git

## Why Are You Learning This?

As a professional developer, you **will** be working on a team. Modern software development is a team sport, not an individual one. Team members need the ability to write code independently, but then merge their individual code together when it's time to release a version of the software.

Git is the tool to allow a developer to work on an independent branch of the code base, and then merge in the work of others.

Github is a tool which allows you to easily share your code with other people, regardless of where they are located.

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

Any version greater than `2.27` is sufficient. If you have a lesser version, you will need to upgrade. If you need to upgrade git, click [here](./GIT_UPGRADE.md).

### Configuring Git

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

## Creating a Git Repository for Aquarium

1. Navigate to your project directory
    ```sh
    cd ~/workspace/martins-aquarium
    ```
1. Type in the `git init` command
1. You now have a git repository

The magic is the `.git` directory that gets created when the `git init` command is executed. To see this directory you can use `ls -la`, which shows hidden files and directories.

> Operating systems will not show files and directories that begin with a period by default. They are considered hidden, or system assets.

