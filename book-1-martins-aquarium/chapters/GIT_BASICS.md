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

### Configuring Git

First we'll configure git to use `main` as the default branch instead of `master`.

```sh
git config --global init.defaultBranch main
```

Second, we'll tell git who you are. You'll need to set a name and email in your global git `config` file. This makes it easy to know who committed those changes!

![username and email](./images/git-username-email.png)

Third, use the following command, but instead of typing `Your Github User Name`, enter your Github username for your account.

```sh
git config --global user.name "Your Github User Name"
```

Fourth, use the following command, but instead of typing `email@example.com`, enter the email address you used when you created your Github account.

```sh
git config --global user.email "email@example.com"
```

Finally, we will tell git which _merge strategy_ to use when we do a `git pull`.

```sh
git config --global pull.rebase false
```

> **NOTE:** We don't expect you to understand the above. Don't worry.

## Creating a Git Repository for Aquarium

1. Navigate to your project directory
    ```sh
    cd ~/workspace/martins-aquarium
    ```
1. Type in the `git init` command
1. You now have an empty git repository - meaning nothing has been tracked yet.

The magic is the `.git` directory that gets create when the `git init` command is executed. To see this directory you can use `ls -la`, which shows hidden files and directories. Operating systems will not show files and directories that begin with a period by default. They are considered hidden, or system assets.


## Making Your First Commit

### Workflow to Remember

This is the process you will be following thousands of times while you are here at NSS. First you tell git which files to track and then you commit them with a message and finally push the changes to gitHub. 

Kinda like: "Hey git, add files A, B, and C to to this specific commit and this is why..."

```sh
git add --all
git commit -m "Message about commit"
git push origin main
```

### Commit Aquarium

Time to make your first commit on your aquarium project. Make sure you are in `~/workspace/martins-aquarium` and then tell git that you want to track all of your files.

```sh
git add --all
```

```sh
git status
```

Then tell git that you are ready to commit all of your code to the historical records that it keeps about your project.

```sh
git commit -m "My first version of my aquarium code"
```

 > _Beginner Hint!_ If you accidentally type `git commit` and hit enter without the `-m` and the message, you'll be taken to a screen that will make you feel like Alice through the looking glass. If this happens, for now just come see an instructor and we'll get you back to reality safely.


```sh
git status
```

Now you can create a Github repository where you will upload your code.

## Backing Up and Sharing Code on Github

Github is a _software as a service_ (SAAS) that allows you to back up your repository to the cloud and share it with other software developers. Note that it is not the same thing as git, which is an application you are running locally on your machine. Github and git are made to talk to each other, but they are separate entities.

## Pushing to Github

When you are ready to share your code with your teammates, or the general public, you can push your repository to Github. Think of Github as an external drive you plug into your laptop to use as backup. Instead of it backing up the entire hard drive, you will back things up, one project at a time, only when you want to.

The first thing you need to do is create a new repository on Github's platform that you will use to backup the code on your laptop.

### Create Github Repo

1. Log into your Github account.
1. Click the `+` sign in the top right corner.
1. Choose "New repository".
1. In the "Repository name" field, enter in `nss-aquarium`.
1. Scroll down and click the green "Create Repository" button.
1. From the on-screen instructions, copy the repository's connection string.
    ![](./images/copy-github-connection-string.gif)
1. From the on-screen instructions, follow the second set of instructions.
    ![](./images/add-origin.png)

Now that the code has successfully been backed up, go back to your browser, and refresh the page. You will see that your remote repository now has your aquarium HTML, JavaScript and CSS files in it.


## Practice: Backup Exercise

* Create a Github repository for the Congressional Representative exercise, and push up that code.
* Create a Github repository for the Coffee Houses exercise, and push up that code.
* Create a Github repository for the Journal and push up the code.

When you are done, you should have new repositories in your Github account including:

1. Aquarium
1. Coffee Houses
1. Congressional Representative

> **Tip:** If you have any issues getting your code onto Github, see a member of your instructional team immediately so that you have a backup of your code. **Pushing your code to Github is not optional. It's a required part of this program.**
