# Using Aliases and Functions to Accelerate your Git Workflow

## Pushing to Github

When working with the Git/Github workflow, there are several commands that you type over, and over, and over again. One of those is `git push origin myBranchName`. It becomes tedious to constantly type `git push origin`. Let's create an alias for it.

Open the `.zshrc` initialization file in your favorite code editor, and enter in the following alias.

`alias gpo="git push origin "`

> **Pro tip:** Make sure there are no spaces before, or after, the equals sign in an alias.

Save the file, and reload your init file with the `source` command.

`source ~/.zshrc`

The next time you need to push a local branch to Github, you can use this alias to save yourself a lot of typing.

`gpo myBranchName`

## Pulling from Github

You also need to pull branches, including master, quite often. Consider creating two aliases for those operations.

`alias glo="git pull origin "`

That will let you pull any branch name with `glo teammate-branch`

`alias glom="git checkout master && git pull origin master"`

A nice, fast way to switch the master branch and pull it when a teammates has merged a PR.

## Test a Teammate's Branch

Here's a bash function that will fetch all remote branches, checkout to the one you want to text, and make sure you are up to date.

```sh
# Short for (T)est (T)eammate's (B)ranch
ttb () {
    git fetch --all
    git checkout $1
    git pull origin $1
}
```

Now, when a teammate submits a PR, and the branch name is, for example, `hbr-adding-navbar`, you can quickly jump to that branch. Just make sure you have added and committed any files that you are currently working on first.

`ttb hbr-adding-navbar`

## Other Helpful Aliases and Functions

```sh
# Add all modified file for commit
alias gaa="git add --all"

# Committing code:
#    gcm "Completed main navigation bar"
alias gcm="git commit -m "

# Create a new branch:
#    gb new-feature-branch
alias gb="git checkout -b "

# Change the remote repository URL. This is useful when you
# clone an instructors, or one of NSS's boilerate, repositories
# and want to then have the code on your account and you don't
# want to fork.
#
#    changeorigin git@github.com:githubhandle/reponame.git
changeorigin () {
    git remote remove origin
    git remote add origin $1
}
```

## Adding to your Help Function

Open `~/.zshrc` and add some git commands to your help manual.

```sh
help () {
    clear
    echo "gohome                    Takes me to my home directory"
    echo "cat [filename]            Outputs the contents of a file right in the terminal"
    echo "touch [filename]          Creates a new file"
    echo "mkdir [directory]         Creates a new directory"
    echo "mg [directory]            Creates a new directory and goes into it"
    echo "git add --all             Stages all modified files to be committed"
    echo "gaa                       Stages all modified files to be committed"
    echo "git commit -m [message]   Commits all staged files"
    echo "gcm [message]             Commits all staged files"
    echo "git push origin [branch]  Uploads your branch to Github"
    echo "gpo [branch]              Uploads your branch to Github"
    echo "changeorigin              Changes where you push your code"
}
```

As you learn more commands, and add more aliases and functions, make sure you update your `help()` function so that you can quickly reference them as your progress through the course and the rest of your career.

Trust me, you'll forget some of them when you don't use them very often.
