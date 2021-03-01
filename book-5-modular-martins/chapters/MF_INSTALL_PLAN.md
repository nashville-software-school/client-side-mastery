# Modern Farm Management

In this project, you will be practicing the following skills.

1. Declaring variables with `let` and `const`.
1. Writing functions.
1. Function parameters and arguments.
1. Iteration with `for` loops and/or `forEach` array methods.
1. Modular development to enforce the Single Responsibiity Principle to your code.
1. Using `import` and `export` keywords between modules.
1. Conditional logic using `if` and `else`.

## Setup

Open a new terminal window, copy pasta the following command into the terminal and hit enter to run it. It will create a basic file structure for you and create some starter code in the `~/workspace/modern-farm` directory.

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/nashville-software-school/client-side-mastery/master/book-1-martins-aquarium/chapters/scripts/modern-farm-install.sh)"
```

Then run the following command in your terminal to change directory to the project directory.

```sh
cd ~/workspace/modern-farm
```

After that runs, you can use the `code .` command to view the code, and then move on to the next section.

## Repository Setup

The install script also ran the `git init` command for you in the `~/workspace/modern-farm` directory.

> **Note:** If you need help with these steps, please talk to your instructors. It's important that they are done in the exact order specified and use the exact values specified.

1. Log into your Github account.
1. Create a new repository named `modern-farm`.
1. Once the repo is created, click the "Clone or download" button. Make sure the "Clone with SSH" option is chosen, not HTTPS.
1. Copy the URL.
1. Then use the following command to connect your local repository to the Github repository.

```sh
git remote add origin paste_your_github_repo_url_here
```

For example, it would look like this. Make sure you use the SSH version when you copy the URL from your Github repository.

```sh
git remote add origin git@github.com:yourusername/modern-farm.git
```

## Automated Tests

The next step is to get some tools installed. In your terminal, run the following command.

```sh
npm install
```

You will then see some required software to start getting installed. If you don't see this happening, or see an error, visit one of your instructors.

![](./images/modern-farm-npm-install.gif)

Once the process completes, then run the following command to start the automated tests.

```sh
npm run test
```

You should see the following output. Again, if you don't visit an instructor.

![](./images/modern-farm-automated-tests.gif)

As you start to create the files, and then write the correct JavaScript code for this application, tests will start to pass. Make sure you come back to the terminal as you write code to see if your code works the way it is expected.

## Start Your Web Server

1. Keep your current terminal running, and open a new one so that you have two active terminals open.
1. In the new terminal session you created, make sure you navigate back to the `~/workspace/modern-farm` directory
1. Then use `cd` to navigate to the `src` sub-directory and start your web server.

![](./images/modern-farm-web-server.gif)

## Creating a Harvest Plan

There is an existing `plan.js` module in this application that is reponsible for defining 3 rows of crops to be planted. In each row, there are 6 plots of land. Each plot is randomly assigned one of the following types of food to grow.

1. Corn
1. Asparagus
1. Potato
1. Wheat
1. Sunflower
1. Soybean

In the `plan.js` module, there is a `createPlan()` function that is exported. In the `main.js` module, import that function and invoke it. Since that function returns a value, you need to store that value in a variable named `yearlyPlan`.

Remember that to assign what a function returns as a value of a variable, the syntax is...

```js
const appropriatelyNamedVariable = theFunctionThatReturnsAValue()
```

Then use `console.log()` to output the value of `yearlyPlan` to the developer console in Chrome.