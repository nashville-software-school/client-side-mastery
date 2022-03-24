# Deconstructing a Large Task

One thing you will quickly be asked to do as a software developer is solve problems for people. The problems are often large, and seem intimidating. Your job, then, is to break that large task down into smaller, more achievable, tasks. Then, just as the saying "The longest journey begins with a single step" is true, once you have small tasks, you start completing those one at a time.

Once all the small tasks are complete, then so is the large one.

## Build Me a Calculator

This is often used to learn the purpose of functions because the whole goal may seem intimidating. How can I write software that does all of the complex functionality of a calculator?

However, each task is fairly easy to implement once you deconstruct the problem. Consider the most basic functions of a calculator.

1. It can add numbers
2. It can subtract numbers
3. It can divide numbers
4. It can multiply numbers
5. It can square numbers

You just deconstructed a problem into smaller tasks.

Each of those tasks are much easier to achieve than focusing on the larger, more daunting task of "Make a calculator".

How does a calculator add two numbers? As an example, a human being holds the calculator and types in a number, presses the plus symbol, types in another number, and then presses the equals symbol. The calculator then returns the sum of the numbers.

1. Input is two numbers _(i.e. arguments captured by parameters)_
2. Output is sum of numbers _(i.e. return value)_

**Reminder: When a function returns a value, you must store that value in a variable**

## Adding

Here is an implemtation of the addition function. The task needs two pieces of information, or input, to perform the task - the two numbers to add.

```js
const add = (firstNumber, secondNumber) => {

}
```

Then you need the code to perform the task.

```js
const add = (firstNumber, secondNumber) => {
    const sum = firstNumber + secondNumber
}
```

Lastly, you need to provide the answer.

```js
const add = (firstNumber, secondNumber) => {
    const sum = firstNumber + secondNumber

    return sum
}
```

Then you can invoke the function however many times you need to add two numbers together.

**Reminder: When a function returns a value, you must store that value in a variable**

```js
const add = (firstNumber, secondNumber) => {
    const sum = firstNumber + secondNumber
    return sum
}

let result = add(17, 9)
console.log(result)
> 26

result = add(-13, -7)
console.log(result)
> -20

result = add(4, 58)
console.log(result)
> 62
```

## Practice: Build the Calculator

You have been provided the `add()` function in the editor. Your job is to write the following functions to perform the other operations. Make sure each function has these **exact** names.

1. subtract
2. divide
3. multiply
4. square

Subtract, divide, and multiply take two parameters, but the square function only takes one.

Make sure that you invoke your functions, store the return value in a variable, and then `console.log()` the result to verify that your functions work as expected.

#### Solve This

See if you can solve this problem using your calculator.

> A quarter of the animals on a farm have four legs. The remaining three quarters of the animals have two legs. If there are 60 legs overall, how many animals are there on the farm?

#### Helpful hints

You can expand the hints below if you are stuck and don't know what to do. Make sure you try a few times and fail, and then talk with your teammates before looking at the hints.

<details>
    <summary>Hint: Subtract</summary>

    const subtract = (numberOne, numberTwo) => {
        const difference = numberOne - numberTwo

        return difference
    }
</details>

<details>
    <summary>Hint: Multiply</summary>

    const multiply = (numberOne, numberTwo) => {
        const product = numberOne * numberTwo

        return product
    }
</details>

<details>
    <summary>Hint: Divide</summary>

    const divide = (numberOne, numberTwo) => {
        const quotient = numberOne / numberTwo

        return quotient
    }
</details>

<details>
    <summary>Hint: Square</summary>

    const square = (originalNumber) => {
        const squared = originalNumber * originalNumber

        return squared
    }
</details>