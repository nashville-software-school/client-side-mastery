# Github Team Workflow

This exercise is intended to be completed with your study group.  It cannot be completed alone.

As a software developer, you will be working on a team.  Teams use git to work together on a code base together where everyone is making changes on their own branches and then merging code together for a final version. In this exercise, we will mimic that workflow in a simple way to practice before starting your first group project.

To complete this exercise, you need to deliver a git repository where everyone in your group has created a PR and merged a piece of code.  As a group, it is your responsibility to support any teammate whom is having difficulties getting their code to merge.  This project is not finished until everyone has completed a PR.

## Instructions:

1. As a team, create one (and only one) repository in Github with index.html and main.css files included.
1. Give everyone in your group and ALL your instructors permission to edit and make PRs on the repository.
1. Share the repo link with your instructors and pin it to your Slack channel
1. Each team member needs to:
  - Pull down the repository
  - Create a branch for themselves (consider whether your team has a branch naming convention)
  - Create their own html and css pages (not named index.html).  Add minimal code to the files for git tracking.  
  - Push their code up to Github and create a PR (Pull Request) to merge into the main branch
  - Assist other team members getting their PRs completed until all PRs are up.
1. After every team member has made a PR, each team member needs to review a PR that is NOT their own code. Work with the author of the PR until you are able to Approve the PR.
1. As a team, work together to merge all the PRs into the main branch.  

Congratulations you have just worked together to complete a team project on Github!

You may rinse and repeat the above to practice git team workflow if you feel the need for practice.  Please note that github team workflow takes time and practice to get the hang of.  Have patience with yourself and your teammates.

## Challange 

Want a challange?  This does not require the whole team, but at least two members.  You will incude a merge conflict and work together to resolve it and merge 2 PRs into the main branch.

Merge Conflict:  When there are two changes to a file(s) that git are similar enough so git cannot automatically determine which change is desired.  Git creates a conflict for the developers to look closer at the code.  

A mergc conflict does not mean anyone messed up, only that humans are still smarter than machines and need to do some manual work to determine what code needs to be included.  Merge conflicts often need two or more developers to sort out what is and is not needed in the code base.  Always test your code by running it locally before saying a merge conflict is resolved.

1. In pairs of two create branches and make changes to the SAME file in your project. We are attempting to create a git conflict, so the close together the change, the better.
1. Push and create PRs for each code change.  Merge the first code change.
1. Try to merge the second PR.  
  - If there is a conflict, resolve the git conflict and merge the seconde PR.
  - If there is not a conflict, make another change and try to get a conflict.

The challange is completed once you created a merge conflict in git and resolved the issue.