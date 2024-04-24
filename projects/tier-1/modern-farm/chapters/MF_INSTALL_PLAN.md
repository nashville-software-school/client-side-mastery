# Modern Farm Management

In this project, you will be practicing the following skills.

1. Declaring variables with `let` and `const`.
1. Writing functions.
1. Function parameters and arguments.
2. Iteration with `for` loops.
3. Modular development to enforce the Single Responsibiity Principle to your code.
4. Using `import` and `export` keywords between modules.
5. Conditional logic using `if` and `else`.

## Setup

Ask an mentor for the link that will create your self-assessment repository. Once the repo is created, click the green **Code** button at the top and copy the SSH connection string provided in the window that appears.

Make sure you are in your workspace directory.

```sh
cd ~/workspace
```

Then clone the repository as a child of **workspace** and then **cd** to the new directory created by the clone. Then use the `code .` command to view the code, and then move on to the next section.

All of the source code for this project will be in the directory of `src`.

## Automated Tests

The next step is to get some tools installed. In your terminal, run the following command.

```sh
npm install
```

You will then see some required software to start getting installed. If you don't see this happening, or see an error, visit one of your mentors.

![](./images/modern-farm-npm-install.gif)

Once the process completes, then run the following command to start the automated tests.

```sh
npm run test
```

You should see the following output. Again, if you don't visit an mentor.

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