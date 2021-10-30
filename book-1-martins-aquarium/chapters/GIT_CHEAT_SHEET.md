#Git and Github Cheat Sheet

### I want to start tracking my project in git (local machine only)

1. `git init` -- starts a new repository.  

    -- You will then need to commit your code (see below).

### I'm working locally and want to commit
 
1. `git status`  -- shows which files have been changed
1. `git add <filename>` -- stages the file for commiting.  Repeat this until all files are added
1. `git commit -m "<YOUR COMMIT MESSAGE HERE>"` -- commits your changes that were added (green when you do a git status). 

### I want to track my code on Github

1. Make a new repository locally (`git init` then commit your code.)
1. Make a new repository in Github.
1. In your terminal:
  ```
  git remote add origin <Your repo link>
  git branch -M main
  git push -u origin main
  ```
  -- This adds the Github repository to your local repository.  Changes the name of your default branch from `master` to `main`.  Then pushes the code on your local machine to the Github repository you just made.

### I've commited and want to put my code on Github (Github is alread connected)

1. `git push` -- if your branch is already on Github, this is all you need to do.
1. `git push --set-upstream origin <branch name>` -- if your branch is not yet on Github

## What information should you provide in a pull request?

- what your changes are
- why you made those changes
- any information a test will need to test the code.
- any reference number/link to a task that will provide more information.

## Gotchas


