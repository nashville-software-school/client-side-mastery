# Functions

Functions are discrete units of work. They should perform one task, and do it well. Sometimes a function needs some input from you to do its job. Functions are difficult to understand for most beginners. This chapter lets you practice writing and using functions to help your knowledge of the syntax and understanding their behavior.

## Setup

Create a new directory in your workspace. Add make an HTML page and a JavaScript file.

```sh
mkdir ~/workspace/functions
cd $_
touch index.html practice.js
```

Add boilerplate HTML and create a `<script type="module" src="./practice.js">` before the closing body tag.

## Introduction: Age in Dog Years

Imagine you want to build an application that lets people see what their age in dog years is. For this application, a calculation needs to be performed. You will take a person's age and divide it by 7. For this unit of work, you would create a function.

You would name the function for exactly what its purpose is.

```js
const calculateAgeInDogYears = () => {

}
```

That's the syntax and structure for most simple functions.

Now, the next question you ask yourself is: In order for this function to do its job, does it require any input? Can it perform its unit of work without any external data?

In this case, the answer is no. It needs to know what the age of the person is. That's input. If a function needs input, then you define a parameter. A parameter is a fancy name for a variable that will hold the value of the input.

It's just a variable.

You should name the variable to reflect what value it is referencing. In this case, it's the person's age.

```js
const calculateAgeInDogYears = (ageOfPerson) => {

}
```

The next thing is to write the instructions for its unit of work. For this function, you will divide the age of the person by 7. You need another variable to reference - or store - the calculated value.

```js
const calculateAgeInDogYears = (ageOfPerson) => {
    const ageInDogYears = ageOfPerson / 7
}
```

At this point, all you have done is write some instructions. Those instructions haven't been followed yet. Defining a function does not run the instructions.

To run the instructions, you need to type the name of the function somewhere else in your code.

```js
const calculateAgeInDogYears = (ageOfPerson) => {
    const ageInDogYears = ageOfPerson / 7
}

calculateAgeInDogYears()
```

Make sure your code is the same as above and run your code in the browser. Make sure you have your developer console open.

You'll see nothing, because you don't have any `console.log()` instructions. You want to see the result of the unit of work. So what should we log? First, log the variable that holds the result of the calculation.

```js
const calculateAgeInDogYears = (ageOfPerson) => {
    const ageInDogYears = ageOfPerson / 7
    console.log(ageInDogYears)
}

calculateAgeInDogYears()
```

When you run that code, you will see `NaN` (_meaning "not a number"_) in the console. Why? Well, it is because you did not provide a value for the `ageOfPerson` parameter that you defined for the function. Again, a parameter's purpose is to store the value of any inputs.

You provide input when you invoke the function. More specifically, you put the value in the parenthesis. Calculate the age in dog years for someone who is 56.

```js
const calculateAgeInDogYears = (ageOfPerson) => {
    const ageInDogYears = ageOfPerson / 7
    console.log(ageInDogYears)
}

calculateAgeInDogYears(56)
```

Refresh the browser, and now will see the number 8 in the developer console.

Now, to see the importance of function parameters, delete the parameter you defined.

```js
const calculateAgeInDogYears = () => {
    const ageInDogYears = ageOfPerson / 7
    console.log(ageInDogYears)
}

calculateAgeInDogYears(56)
```

Refresh the browser and now you will see an error, or "exception" as developers call them, in the console.

```html
Uncaught ReferenceError: ageOfPerson is not defined
    at calculateAgeInDogYears (main.js:2)
    at main.js:6
```

Without the parameter defined, you can't use the value of 56 in the function. Now put the parameter back in place.

The next step is to make sure the function is pure. A pure function means that a function does its job and **returns** a value. Right now, your function performs the calculation and logs the result. This is not pure. To make it pure, you will use the keyword of `return`.

```js
const calculateAgeInDogYears = (ageOfPerson) => {
    const ageInDogYears = ageOfPerson / 7

    return ageInDogYears
}

calculateAgeInDogYears(56)
```

Refresh your browser. Again, you'll see nothing because you got rid of the `console.log()`. Ok, so when a function returns some value, the instructions to run the function **becomes the return value**. In this case, here how JavaScript sees the code after it runs.

```js
const calculateAgeInDogYears = (ageOfPerson) => {
    const ageInDogYears = ageOfPerson / 7

    return ageInDogYears
}

8
```

Your instructions of `calculateAgeInDogYears(56)` evaluated to the value of `8` since the function returned a value. The next step is to reference that value with a variable.

```js
const calculateAgeInDogYears = (ageOfPerson) => {
    const ageInDogYears = ageOfPerson / 7

    return ageInDogYears
}

const dogAge = calculateAgeInDogYears(56)
```

Again, after the code runs, this is what the evaluated code looks like to JavaScript when the input to the function is 56.

```js
const calculateAgeInDogYears = (ageOfPerson) => {
    const ageInDogYears = ageOfPerson / 7

    return ageInDogYears
}

const dogAge = 8
```

Change the input value to 45. What would `calculateAgeInDogYears(45)` evaluate to?

```js
const calculateAgeInDogYears = (ageOfPerson) => {
    const ageInDogYears = ageOfPerson / 7

    return ageInDogYears
}

const dogAge = calculateAgeInDogYears(45)
```

No need to guess, or do the math yourself, just log the value of `dogAge`.

```js
const calculateAgeInDogYears = (ageOfPerson) => {
    const ageInDogYears = ageOfPerson / 7

    return ageInDogYears
}

const dogAge = calculateAgeInDogYears(45)
console.log(dogAge)
```

Refresh your browser and you will see `6.428571428571429` in the console. Therefore, after the code ran, JavaScript sees the following instructions.

```js
const calculateAgeInDogYears = (ageOfPerson) => {
    const ageInDogYears = ageOfPerson / 7

    return ageInDogYears
}

const dogAge = 6.428571428571429
console.log(dogAge)
```

#### Exploration Tasks

* Remove the `return` statement and see what happens.
* Specify the number 22 as input to the function and see what the output is.
* Change the parameter to `age` instead of `ageOfPerson` and see what happens. Then see if you can resolve any issues that it causes.
* Remove `const dogAge =` so that you just invoke the function, but don't store what it returns and see what happens.

## Practice: Best in Show

1. Write a function that takes a string of a dog breed as an argument (like 'border collie')
1. Have the function return the value of `"My favorite dog breed is schnauzer"` if an argument of `"schnauzer"` is provided.
1. Store the return value of the function into a variable. (e.g. `const myFavorite = someFunction()`)
1. Log the string of "When it comes to pets," plus the returned value of the function.
1. If, and only if, an argument value of `"meow"` is provided to the function, it should return the string `"I like cats"`.

#### Questions to Ask

* Does the function require input to do its job?
* Does the function need to return a value?
* Am I referencing the return value with a variable?
* What should I do with the return value?
* What happens if I don't provide an argument at all?
* What happens when I remove the parameter from the definition of the function?

## Practice: Addition

In this exercise, you are going to define more than one parameter for functions.

1. Write a function named `add` that returns the sum of two numbers.
1. Log the result of the add function.
1. Modify the function to return the sum of three numbers.
1. If the values of 17, 4, and 11 are provided as arguments, then the function must evaluate to 32.

#### Exploration Tasks

* Switch the order of your parameters. For example, if your parameters are `(first, second, third)`, then change it to `(second, first, third)`. What effect does that have on the unit of work?
* Remove one parameter, but not the others. Does the function still work?
* Change the order of the variables when you add them together in the function. Does that affect the output of the function?

## Practice: Self-Driving Cars

1. Create a function named `go` that takes 2 arguments:
    1. direction (forwards, backwards, etc.)
    1. speed (mph).
1. The function, when invoked, will log out the following message format in the console:
    * `The car is moving forwards at 45 mph.`
    * `The car is moving backwards at 8 mph.`
    * `The car is moving in circles at 12 mph.`
1. Add a condition inside the function to check if the speed is greater than 75 mph. If it is, add an additional message of SLOW DOWN!
    > **Example:** The car is moving forward at 82 mph. SLOW DOWN!
