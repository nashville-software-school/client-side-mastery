# 5. Git Setup for Martin's

## Why Are You Learning This?

***LOUDER FOR THE PEOPLE IN THE BACK:***

As a professional developer, you **will** be working on a team. Modern software development is a team sport, not an individual one. Team members need the ability to write code independently, but then merge their individual code together when it's time to release a version of the software.

Git is the tool to allow a developer to work on an independent branch of the code base, and then merge in the work of others.

Github is a tool which allows you to easily share your code with other people, regardless of where they are located.

## Creating a Git Repository for Aquarium

1. Navigate to your project directory
    ```sh
    cd ~/workspace/martins-aquarium
    ```
1. Type in the `git init` command
1. You now have a git repository

The magic is the `.git` directory that gets created when the `git init` command is executed. To see this directory you can use `ls -la`, which shows hidden files and directories.

> Operating systems will not show files and directories that begin with a period by default. They are considered hidden, or system assets.

