# Functional Math

### Setup

```sh
cd
cd workspace
mkdir functions-math
cd functions-math
touch main.js
code .
```

Once VS Code starts, open the `main.js` file and follow the instructions below.

Any time you want to run your code, go to the terminal _(make sure you are in the `functions-math` directory)_ and type `node main.js`. You will only see output if you have a `console.log()` statement somewhere.

### Instructions

You won't be doing much, if any, math while in class, but basic math functions are simple to write, so you will be doing that in this exercise.

* The plus sign (+) is used to add numbers in JavaScript
* The asterisk (*) is used to multiply numbers in JavaScript

You need to write two functions.

1. A function to add two values together. This function needs to define two parameters - the two numbers that you want to add together.
2. A function to multiply a single number by 2. This function takes one parameter - the number you want to multiply by 2.
3. In the adding function, add the values of the two parameters and return the result
4. In the multiplication function, multiply the value of the single parameter by 2 and return the result.

## Running the Tasks

After the functions are defined, invoke them in the correct order.

1. Invoke the adding function, provide two values as arguments, and the store what gets returned into a variable.
2. Then invoke the multiplication function and provide the variable from the previous step as the argument. Store the result into a variable.
3. Use `console.log()` to output the end result of the multiplication function.

As an example, if you pass 4 and 14 to the first function, then the final output should be 56.