# The Github Workflow

Your instruction team will show you the Github workflow. They will demonstrate how to work on an independent branch of code, push the code to Github for a teammate to review, and then get the code merged into the main branch - almost always called the `main` branch (sometimes called `master` branch).

The checklist below is for you. You will use it during the practice exercise, and you will use it for your first few group projects until you learn it by heart.

## Vocabulary To Know
* GitHub vs. Git
* VCS (version control software)
* Clone vs. Fork
* Branch
* Git actions: init, checkout, status, add, commit, push, pull, merge
* GitHub PR

## Group Project Github Workflow

> **Tip:** The curly braces below should not be typed by you. They indicate where to place your own value.

Everyone will create a fish for the aquarium website.
1. Everyone clone the same repository
1. Each person create a branch
    ```sh
    git checkout -b {your initials}-fish
    ```
1. Add your fish component to the HTML
1. Check status of your branch
```sh
    git status
```
1. Add, commit, push branch
    ```sh
    git add --all
    git commit -m "Added Herbert the goldfish"
    git push origin {your initials}-fish
    ```
1. When you feel your work is complete, go to Github and create a Pull Request (PR)
1. Teammate decides to verify your PR and fetches your branch
    ```sh
    git fetch --all
    git checkout {your initials}-fish
    ```
1. Teammate runs code in browser to verify it works
1. Teammate approves PR by giving you a thumb's up
1. Your merge your branch on Github by visiting your Pull Request page and clicking the big, green button.
1. Teammates pull `master` when they feel like it but before they submit their PR
    ```sh
    git checkout master
    git pull origin master
    git checkout {their initials}-fish
    ```
1. When another teammate is ready to submit a pull request, they merge master into their branch, and push.
    ```sh
    git merge master
    # Fix merge conflicts, if any
    ```
1. Repeat steps 4-9

## Visual Workflow of Github

![](./images/github-workflow.png)
![](./images/github-merge-mybranch.JPG)
![](./images/github-review-teammates-pr.JPG)
![](./images/github-teammate-code-merged.JPG)
