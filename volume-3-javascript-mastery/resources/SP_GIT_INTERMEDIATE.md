# Intermediate Git usage

## Review of the basics

1. `git clone {url}` allows you to copy an existing Github project to your local machine.
1. `git branch` shows current, local branches and highlights the one you are working on.
2. `git branch -r` shows remote origin (i.e. Github) branches that you may, or may not, have pulled down to your local machine.
3. `git branch {label}` creates a new branch that is a snapshot of the current branch.
4. `git checkout {branch}` switches between branches.
3. `git fetch` pulls down the current branch from the remote origin, but *does not modify* your current working copy.
4. `git merge {branch}` merges the code from the target branch into the one you are currently on.
5. `git pull origin {branch}` is a combination of a *fetch* and a *merge*.
6. `git add .` adds any new files, or modified files, to a staging state so that it will be included in the next commit.
7. `git commit -m {message}` commits all staged files as the most current snapshot of your project.
8. `git push origin {branch}` sends your code to the corresponding branch on Github.

## Amending a commit

So you already committed your code, but a few seconds later, you see that there's a typo, so instead of doing another add/commit/push cycle, you can quickly amend the previous commit.

```bash
git commit -m "Added feature to save music to the database"
git add music.js # Oops, there was a typo you had to fix
git commit --amend # This replaces the previous commit
```

You can also use amend to update the message of the commit.

```bash
git commit --amend -m "Added feature to save music to Firebase"
```

## Unstage/revert file(s)

If you've added a file to the staging area, but change your mind, you can reset.

```bash
git add script.js
git status # This will show the file staged for commit
git reset HEAD script.js # Removes the file from staging area
```

If you made a series of changes to your working copy, but, for any reason, need to completely revert all your changes back to the most recent commit.

```bash
git reset --hard
```

This is destructive, so use with care and be sure that you want to completely revert **all** your local changes.

## Tagging commits

You can add a lightweight tag at any time that serves as a kind of milestone in your commit history. It also allows you to roll back in your git history more easily to see how the code looked at a particular milestone.

```bash
git commit -m "Final commit for version 2.2 of the product with all branches merged"
git tag version-2.2
```

As you tag your commit history, you can easily move between tags.

```bash
git checkout tags/version-1.0
git checkout tags/version-2.2
```

## Deleting a branch

```bash
git branch -d version2  # For a local branch
git push origin :version2  # For a remote branch
```

## Stashing changes

Ever need to pull down someone else's changes from remote, but git complains that you have uncommitted changes and won't complete the pull? Well, you can stash your changes, pull down the remote changes, and then reapply your stashed code.

```bash
git pull origin version2
# git complains that you have uncommitted changes
git stash
git pull origin version2 # no complaints!
git stash pop
```
