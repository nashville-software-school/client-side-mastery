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
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/nashville-software-school/client-side-mastery/cohort-39/book-2-glassdale-pd/chapters/scripts/basic-messages-install.sh)"
```

After that runs, you can use the `code .` command to view the code, and then start reading the instructions.

## Creating a Harvest Plan

There is an existing `plan.js` module in this application that is reponsible for defining 3 rows of crops to be planted. In each row, there are 6 plots of land. Each plot is randomly assigned one of the following types of food to grow.

1. Corn
1. Asparagus
1. Potato
1. Wheat
1. Sunflower
1. Soybean

Examine the `plan.js` module. Then, in the `main.js` module, execute the proper function to generate the plan. Store the output of that function into a variable named `yearlyPlan`.

Remember that to assign what a function returns as a value of a variable, the syntax is...

```js
const appropriatelyNamedVariable = theFunctionThatReturnsAValue()
```

Then use `console.log()` to output the value of `yearlyPlan` to the developer console in Chrome.