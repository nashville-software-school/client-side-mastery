# Learning Moments
> You love to help your fellow classmates, and they love to help you! You've decided to build a social app for sharing those _"Aha!"_ moments of learning how to become a developer.

You are going to build your own React application based off everything you've learned in Honey Rae's. This is a rather complex project with many possible solutions and many edge cases. It's designed to challenge you and put what you've learned to the test. The goal of this project is not to write a flawless, enterprise-level application. That is not even the desired outcome. The goal is to develop your analytical thinking, algorithmic thinking, and learning efficiency. The desired outcome is a deeper understanding of React and the ability to build a capstone! Revisit previous chapters, rewatch videos, reference the Honey Rae's code, and of course reach out to your peers to help you build this application.

### Project Setup
```shell
cd ~/workspace
npm create vite@latest learning-moments -- --template react
cd learning-moments
npm install
```

Run the following command in your terminal to receive the boilerplate code:
```shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/nashville-software-school/course-bash-scripts/main/client/learning-setup.sh)"
```


## The Data
The first step of planning this application is to design the ERD and build the database.
```shell
cd ~/workspace
mkdir learning-api
cd learning-api
touch database.json
```

### The Resources
Below are the resources for this application. _(You will need to connect the relationships)_ Use these requirements to build your ERD. Once you are finished, if you would like to run your ERD by an mentor, they would be more than happy to review it with you. Once you are confident you have an accurate ERD, seed your database.

| Resource | Description |
| -- | -- |
|**`users`** | Where basic user information for all users is stored. A user can create many posts. A user can like many posts. _(name, email, cohort)_ |
|**`posts`** | A post created by a user to share what they've learned. A post can belong to a single topic. A post can be liked by many users. _(title, body, date)_ |
|**`topics`** | A topic of learning. _(e.g. Functions, Asynchronous Programming, etc...)_ Many posts can be written about a single topic. _(name)_  |

Up Next: [Building the wireframe](./LEARN_WIREFRAME.md)