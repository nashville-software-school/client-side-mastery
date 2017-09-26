# Git

A distributed version control system for keeping a history of your code.

## Creating a Repository

1. Create a directory to store your application's code
1. `cd` to that directory
1. Type in the `git init` command
1. You now have a git repository

The magic is the `.git` directory that gets create when the `git init` command is executed. To see this directory you can use `ls -la`, which shows hidden files and directories. Operating systems will not show files and directories that begin with a period by default. They are considered hidden, or system assets.

## Making your First Commit

1. Create an HTML file with `touch index.html`
1. Create a CSS file with `styles.css`

Since git tracks all changes - unless you tell it to ignore some files, which we will cover later - your two new files will be recognized as new, untracked files by git.

Type `git status` to see the status of all files in your new repository.

![untracked](./images/wnuN3k9WiB.gif)

Next, Tell git that you want to start tracking those files with `git add .` command. The period means "add all untracked files from this directory, and any sub-directories".

Then type `git status` again and git will have a new messages that those two files are ready to be committed.

![staged](./images/fLHGYPTJZ6.gif)

Next, you need to commit your changes. Every time you make a commit, git will keep track of how the code looked at that moment in time, in case you ever need to go back to a previous version. You commit your changes with the following command.

```
git commit -m "A descriptive message about what changes you made in this commit"
```

Once you make your commit, do a `git status` one more time, and git will tell you that there's nothing left to commit.

![committed](./images/MubF1SNxS2.gif)


+ `git push -u origin master` to push the latest commit(s) to your repo on GitHub. After this longhand command, you can use just `git push`  
+ `git log` to see all of your commits for this repo. `q` to quit git log (if log is long enough)

# Backing Up and Sharing Code on Github

A software as a service (SASS) that allows your to back up your repository to the cloud and share it with other software developers.

## Pushing to Github

When you are ready to share your code with your teammates, or the general public, you can push your repository to Github. Think of Github as an external drive you plug into your laptop to use as backup. Instead of it backing up the entire hard drive, you will back things up, one project at a time, only when you want to.

### Create Github Repository

The first thing you need to do is create a new repository on Github's platform that you will use to backup the code on your laptop. Once the repository is created, you will need to copy the connection string for it.

![new github repo](./images/mtm0VF02LH.gif)

### Add the Connection String Locally

Now you tell your local repository where you would like it to send the code when you're ready to back it up.

```
git remote add origin add-connection-string-here
```

Now it's time to do the backup. You use the `git push origin master` command to do that.

```
git push origin master
```

![new github repo](./images/izVubW1Z3Z.gif)

Now that the code has successfully been backed up, go back to your browser, and refresh the page. You will see that your remote repository backup now has your two files in it.


![new github repo](./images/oVUMivLlIM.gif)

## Additional Reading

* [git - the simple guide](http://rogerdudler.github.io/git-guide/)
