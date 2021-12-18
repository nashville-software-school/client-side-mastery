# Funtional Math

## Function with Parameter Examples

Here is an example of a function with a parameter. A function can be invoked as many times as needed. If there is a parameter defined, then a value _(a.k.a argument)_ must be provided when the function runs.

```js
/*
    Define a function with a parameter. This means the
    function needs a value to be provided.
*/
const createFancyName = (name) => {
    return `Her Majesty, ${name}.`
}

/*
    Invoke the function multiple times. Each time, a
    different input is provided.

    The technical terms for the values provided when
    you invoke a function is the argument.
*/


const athena = createFancyName("Athena Perez") // Argument value is "Athena Perez"
// output: "Her Majesty, Athena Perez."


const charisse = createFancyName("Charisse Ford") // Argument value is "Charisse Ford"
// output: "Her Majesty, Charisse Ford."


const jenna = createFancyName("Jenna Solis") // Argument value is "Jenna Solis"
// output: "Her Majesty, Jenna Solis."
```

## Math Function Flow

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


### Helpful hints

You can expand the hints below if you are stuck and don't know what to do. Make sure you try a few times and fail, and then talk with your teammates before looking at the hints.

<details>
    <summary>Hint: Initial Definitions</summary>

    const add = (firstNumber, secondNumber) => {

    }

    const multiplyByTwo = (numberToMultiply) => {

    }
</details>


<details>
    <summary>Hint: Adding function</summary>

    const add = (firstNumber, secondNumber) => {
        const sum = firstNumber + secondNumber

        return sum
    }
</details>

<details>
    <summary>Hint: Multiplication function</summary>

    const multiplyByTwo = (numberToMultiply) => {
        const product = numberToMultiply * 2

        return product
    }
</details>

<details>
    <summary>Hint: Invoking addition function</summary>

    const addedNumbers = add(10, 51)
</details>

<details>
    <summary>Hint: Invoking multiplication function</summary>

    const doubledNumber = multiplyByTwo(addedNumbers)
</details>

<details>
    <summary>Hint: Final output</summary>

    console.log(doubledNumber)
</details>
