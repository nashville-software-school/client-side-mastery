# The Github Workflow

Your instruction team will show you the Github workflow interactively on their own aquarium repository. They will demonstrate how to work on an independent branch of code, push the code to Github for a teammate to review, and then get the code merged into the main branch - almost always called the `main` branch.

The checklist below is for you. You will use it during the practice exercise, and you will use it for your first few group projects until you learn it by heart.

## Group Project Github Workflow

> **Tip:** Remember that the curly braces below should not be typed by you. They indicate that you should place your own value there.

1. Everyone clone the same repository
1. Each person create a branch
    ```sh
    git checkout -b {your initials}-fish
    ```
1. Add your fish component to the HTML
1. Add, commit, push branch
    ```sh
    git add index.html
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
1. Teammates pull `main` when they feel like it but before they submit their PR
    ```sh
    git checkout main
    git pull origin main
    git checkout {their initials}-fish
    ```
1. When another teammate is ready to submit a pull request, they merge main into their branch, and push.
    ```sh
    git merge main
    # Fix merge conflicts, if any
    ```
1. Repeat steps 4-9

## Specific Workflows

### Your Feature Branch is Ready for Review

1. Make sure all your code is committed
    ```sh
    git commit -m "A good commit message"
    ```
1. Make sure you have the latest code on the `main` branch.
    ```sh
    git merge main
    ```
1. Push the code in your branch to Github
    ```sh
    git push origin <branch name here without brackets>
    ```
1. Create a Pull Request on Github.
    1. Informative title
    1. A description that explains how your teammate can test your code
1. Tell your teammates that your pull request is ready to be reviewed

### Reviewing a Teammates Branch

1. Get reference to teammate's branch
    ```sh
    git fetch --all
    ```
1. Switch to teammates's branch
    ```sh
    git checkout <branch name>
    ```
1. Review and test the code as described in the pull request
1. If the code all works and the syntax is good, then go to Github and approve the pull request.
1. If the code does not work or has lazy/incorrect syntax, then go to Github and leave a respectful and descriptive command on the pull request and request that the teammate make changes.

### Teammate has Reviewed Code and Approved the Pull Request

1. Go to your pull request on Github and press the button to merge your branch.
1. When the merge is complete, click the button to delete the branch.
1. Tell your teammates that there is a new, updated `main` branch.

### The `main` Branch is Updated

1. Do you need the new code for your branch?
    1. If yes, continue with the following steps
    1. If no, keep working until you are ready for a pull request on your branch.
1. Make sure all of your code is committed
    ```sh
    git add --all
    git commit -m "Good commit message"
1. Switch to the main branch
    ```sh
    git checkout main
    ```
1. Get the latest code pulled to your machine
    ```sh
    git pull origin main
    ```
1. Switch back to your branch
    ```sh
    git checkout <your branch>
    ```
1. Merge the latest code into your branch
    ```sh
    git merge main
    ```
## Visual of Github Workflow

![](./images/github-workflow.png)