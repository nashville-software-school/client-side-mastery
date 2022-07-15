## Coffee House Changes

The goal of this exersice ot to practice using git to track changes in a project. There are many different ways to complete this task. Below, we outline one way to complete it.  As you work more with git and github, you will start to use these building blocks in different orders to work on your personal projects and with your teams.  

If you get stuck or something doesn't look correct, reach out to an instructor with whatever details you have and screenshots.  Git is one of the most difficult things to learn when becoming a software developer.  It takes practice, making mistakes, more practice and patience (with yourself and others).


1. Create a new branch in your Coffee House project.
1. Make some changes to the code.
1. Commit the changes to the repository on your local computer.
1. Push changes to Github.
1. Merge changes into the main branch with a PR.
1. Update the main branch on your local computer.

## Create a new branch in your Coffee House project

1. In your terminal navigate to your coffee house project directory
1. Type `git status` to make sure there are no changes pending.
1. Type `git checkout -b <newBranchName>` where <newBranchName> is the name you would like to name your branch.  
```
```
<img src="../Images/NewGitBranch1.PNG" style="margin-left: 5%;" width=80% height=auto />
  
```
```
Note: Most teams use naming conventions to their branches.  Some elements you may find in the branches:
-    developers name/initials
-    a number or alphanumeric related to the work requirements (User Story, Ticket #) from the team's project board.
-    a short title for the work being completed.

## Make some changes to your code

In this step, make any changes you like.  It doesn't have to be a major change since we are practicing with Git and Github.  Some suggestions:
     -    Add/Remove a coffee house
     -    change a border of color
     -    add a background-color to you page or coffee house cards

Make sure you save the changes and preview them in the browser.

## Commit the changes to the repository on your local computer

-    In your terminal, navigate to the coffee house directory
-    Type `git status`.  You should see the files you made changes to listed in red in your terminal.
```
```  
<img src="../Images/NewGitBranch2.PNG" style="margin-left: 5%;" width=80%  />  

```
```  
-    Type `git add <file name>` where `<file name>` is the name of the file you want to add. Click enter. This stages your files for commit.  They are NOT commited yet.  Repeat for each file listed.  You may do a give status in between adding files and you will see that files added are green and those not are red.  Only the files that have been staged (are green) will be part of the commit.
```
```  
<img src="../Images/NewGitBranch3.PNG" style="margin-left: 5%;" width=80%  />

```
```
-    Commit your changes by typing `git commit -m "<commit message here>"` where <commit message here> is the message you want for that commit followed by a `git status` to confrim your changes were committed.
```
```    
<img src="../Images/NewGitBranch4.PNG" style="margin-left: 5%;" width=80%  />

```
```
## Push those changes to Github.

-    Try typing `git push` in your terminal like you did when you set-up the repo.  You will see a message say the branch does not exist upstream.  This is because Github does not yet know about the new branch you made.  Git gives you a helper command to push a new branch up to Github, example ` git push --set-upstream origin ls-practice-merging`. Use this command.
```
```
<img src="../Images/NewGitBranch5.PNG" style="margin-left: 5%;" width=80%  />

```
```
Congratualations, your new branch is now on Github!  Go to Github and check it out.  
```
```
<img src="../Images/NewGithubBranch1.PNG" style="margin-left: 5%;" width=80%  />

```
```
Navigate to you repo in Github. Notice that you have a yellow banner with a green button telling you of the recent pushes.  Remember, the code is not in your `main` branch yet.  It's still in it's own branch.  

Take a few minutes to click around on Github and prove to yourself:
-    The changes are not shown in the files on the screen (main branch)
-    There is a new branch on Github.  Look at the dropdown that says "main" on the left just under the yellow banner.
-    Use that dropdown to switch to the new branch.  Check that your code changes are in that branch.

## Merge changes into the main branch with a PR.

-    Click on the green button that says "Compare & pull request".  Notice that you can choose which branches to merge with the dropdowns, can add notes to the request for teammates (when working with others).
```
```
<img src="../Images/PRandMerge1.PNG" style="margin-left: 5%;" width=80%  />

```
```
-    Double check that your branch is merging into the main branch and then click the "Create Pull Request" button in the lower right.  This will create the PR and route you to it.
-    Github will check whether the code can be merged or if there are conflicts (more on this later).  Once confirmed that code can merge there will be a green button displayed to "Merge Pull Request".
```
```
<img src="../Images/PRandMerge2.PNG" style="margin-left: 5%;" width=80%  />

```
```
-    Before merging, explore the tabs of the PR.  In particular, look at the "Files changed" tab.  This tab allows users to review code, ask questions and raise issues before code is merged.  More on this later.
```
```
<img src="../Images/PRandMerge3.PNG" style="margin-left: 5%;" width=80%  />

```
```
-    When you are finished exploring, return to the "Conversation" tab and click the "Merge pull request" button then "Confirm merge" button.  The code will merge and you will see a success screen with the option to delete the branch.  It is generally good to delete a branch after it has been successfully merged.  This helps keep the repository organized.
```
```
<img src="../Images/PRandMerge4.PNG" style="margin-left: 5%;" width=80%  />

```
```
-    Delete the branch and navigate back to your code by clicking the "Code" tab in the upper left on the screen.  You should now see the code up-to-date on your Github main branch.  Your local main branch is not up-to-date yet.

## Update the main branch on your local computer

-    Navigate back to your terminal and checkout your main branch by typing `git checkout main`
```
```
<img src="../Images/UpdateRepoLocally1.PNG" style="margin-left: 5%;" width=80%  />

```
```
-    Pull the current version of main from Github by typing `git pull main`
```
```
<img src="../Images/UpdateRepoLocally2.PNG" style="margin-left: 5%;" width=80%  />

```
```

Congratulations, you've completed a Github merge cycle!


