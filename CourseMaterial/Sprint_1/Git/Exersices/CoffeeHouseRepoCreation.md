# Backup Coffee House Project With Git & GitHub

The goal of this and the coffee house changes exercise is to learn to use git to track changes in a project. There are many different ways to complete this task. Below, we outline one way to complete it. As you work more with git and github, you will start to use these building blocks in different orders to work on your personal projects and with your teams.

If you get stuck or something doesn't look correct, reach out to an instructor with whatever details you have and screenshots. Git is one of the most difficult things to learn when becoming a software developer. It takes practice, making mistakes, more practice and patience (with yourself and others).

Here are the steps we will take:

- Initialize your git repo
- Commit the work you've done so far
- Create a Github repo for your project

## Initialize your Git repo

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

## Make Your First Commit

When you first initialize a Git repo that already has code in it your code won't automatically be tracked. You have to make your first commit!

Let's go ahead and do that for our Coffee House project.

```sh
git add --all
git commit -m "First Commit"
```

> Please note this should be the **_ONLY_** time you ever use the `git add --all` command. When you commit changes as you are working you need to add each one of your files one by one. If you don't then you can't guarantee you aren't committing changes that you don't want to save. This can be disastrous later!

Now that you have your code committed you'll need to create a Github repository where you will push your code.

### Create Github Repo

1. Log into your Github account.
1. Click the `+` sign in the top right corner.
1. Choose "New repository".
1. In the "Repository name" field, enter in `coffee-house`.
1. Scroll down and click the green "Create Repository" button. You don't need to worry about the other options right now.
1. Find the _"…or push an existing repository from the command line"_ section in on the page and follow those instructions.

![Github Repo Instructions](../images/github-create-repo.png)

Go back to your browser where your Github instructions were, and refresh the page. You should see that your remote repository backup now has your coffee house project in it.
