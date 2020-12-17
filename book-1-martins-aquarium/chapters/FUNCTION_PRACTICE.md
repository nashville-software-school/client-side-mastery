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

## Practice: Evens or Odds

1. Design a function named `evenOrOdd` that takes a single number as an argument.
1. It should return the string \"Even\" if the number is evenly divisible by two.
1. It should return the string \"Odd\" if the number is not evenly divisible by two.
1. Log the result of the function.

> **Hint:** Use the modulo - or remainder - operator in JavaScript to accomplish this.
>
> https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Arithmetic_Operators#Remainder_()

#### Exploration Tasks

* Create an array of numbers outside the function. Some even, some odd. After the function is defined, iterate the array of numbers with a `for..of` loop, and invoke the `evenOrOdd` function with each number as the argument.
* What happens when you pass the argument value of 0?

## Practice: Double Functions

For this exercise, you are going to utilize two functions; each function will have a single responsibility. The goal of the exercise is to convert an array of words into a sentence, but some of the words in the array should not be included in the sentence.

Therefore, you need two functions.

* One function to filter out the unwanted words.
* One function to convert an array of words into a single sentence.
* Each function needs to return a value.
* The return value from one function needs to be passed to the other function.

In the array of words below, filter out any word that starts with the letter `k`. With the remaining words, combine them all into a single string and log that string to the console.

```js
const words = [
    "The", "killing", "complex", "houses",
    "married", "kittens", "and", "single",
    "soldiers", "and", "their", "kleptomaniacal",
    "families"
]

/*
    Function to filter out `k` words
    (Google 'javascript startswith' to get started)
 */

/*
    Function to build a single string from the array
    (Google 'javascript combine all items in array' to get started)
 */


/*
    Invoke the filtering function and store its return value
 */


/*
    Invoke the string building function, and pass the
    return value of the previous function as an argument
*/


console.log()
```

## Practice: You Can Tune a Piano, But You Can't...

Sven the Norwegian fisherman goes out at 5:32 AM every day to fish for tuna in the North Sea. Each time he casts his line, he has a 33% chance of catching a tuna.

On a side note, did you know that you can ask JavaScript for a random number? You use the `Math.random()` method which, by default, returns a number between 0 and 1. If you mutiply the result by 2, you will get a number between 0 and 2. This would allow you to simulate a coin flip. You could check if the value was between 0 and 1 (_heads_), or between 1 and 2 (_tails_).

```js
Math.random() * 2  // Number between 0 and 2
```

Write a function that simulates Sven's chances of catching a tuna. The function needs no input, and it simply returns `true` or `false`. If a random number falls in a certain range, return `true`. If it falls in any other range, return `false`.

Invoke the function and then log one of the following messages to the console.

```html
Sven hooked a tuna!  :)
```

or

```html
Sven came up empty-handed.  :(
```

#### Exploration Tasks

* Try multiplying the `random()` method by different values and see how it affects how often Sven catches a fish.
* Instead of hard-coding the number by which you multiple `random()`, see if you can pass that number in as an argument to the function.
* Is your function a pure function? Why or why not? If you're unsure, talk to your teammates or your instructors.
* What happens if you multiply `random()` by 0?

## Practice: Fast Food (_Multiple Parameters_)

Your job in this exercise is to write a function that returns an object that represents a fast food meal. The customer will be able to order a sandwich, a side item (_like fries or apples_), a drink, and a dessert. Your function should take all of those externally defined values as input (_i.e. parameters_) and then `return` an object like this.

```js
{
    "sandwich": "Ultimate Slammer",
    "side": "Potato wedges",
    "drink": "Mr. Pepper",
    "dessert": "Fudge sundae"
}
```

> **Tip:** Since each of these values are separate items, then there needs to be one parameter for each one. Then you need to specify four arguments.

```js
const takeOutBag = orderMeal("Ultimate Slammer", "Fudge sundae", "Mr. Pepper", "Potato wedges")
```

#### Exploration Tasks

* What happens if you define more parameters than arguments?
* What happens if you change the order of your parameters?
* What happens if you change the order of your argument values when you invoke the function?
* What happens if you remove one of your parameters?

## Practice: Same Chores, Different Days

Here's a fancy term for you: _Higher Order Functions_. It's a function that takes another function as a parameter and uses it for its own purposes.

Here's a simple example. This is a function that reads in a number, then returns that number multiplied by 2.

```js
const twice = number => number * 2

twiceTwo = twice(2)
console.log(twiceTwo)  // 4

twiceSix = twice(6)
console.log(twiceSix)  // 12

twiceThirteen = twice(13)
console.log(twiceThirteen)  // 26
```

You can make functions that multiply numbers by any amount. Make two more functions: one that multiplies by 5, and one that squares a number.

```js
const timesFive = number => number * 5
console.log(timesFive(2))  // 10
console.log(timesFive(5))  // 25

const square = number => number * number
console.log(square(4))  // 16
console.log(square(13))  // 169
```

So now you have three functions, each of which does something different to a number.

```js
const twice = number => number * 2
const timesFive = number => number * 5
const square = number => number * number
```

Now you can define another function that takes one of those functions as input. It's a more generic function that will perform _any task_ on a number, but needs you to tell it what it should do.

```js
/*
    I can make any number bigger, but you need to tell
    me how much bigger by giving me the function you
    want me to invoke on the number
*/
const bigify = (number, operationFunction) => {
    const result = operationFunction(number)
    return result
}
```

Now take the same number and perform all three operations on it by invoking `bigify()`.

```js
const number = 7
const by2 = bigify(number, twice)  // 14
const by5 = bigify(number, timesFive)  // 35
const byItself = bigify(number, square)  // 49
```

> **Lightning Exercise:** Define another function that cubes a number. Then augment the code above by passing the function to `bigify()`

You are now going to do something similiar. You are going to make the same person perform a series of three chores. Then you get to decide which three chores, depending on the day.

### Defining the Chores

First define six (6) functions that defines a single parameter whose value should be an object. That object will look like this.

```js
{
    firstName: "Donald",
    lastName: "McLelland"
}
```

Each function should return a string in the following format, if the object parameter represents Donald McLelland.

```html
"Donald McLelland went to the grocery store"
```

or

```html
"Donald McLelland got the engine oil changed"
```

So think of six random tasks that you perform on a regular basis and define a function for each one. We will start you off with a hint.

```js
const xxxxx = person => `${} ${} `
```

### Lazy Day

Now define a function that has three parameters. The purpose of each parameter is as follows:

1. `chore` - A function that will perform a chore
1. `person` - An object representing a perform. It should have a `firstName` and a `lastName` property.
1. `day` - The weekday to perform the task (_e.g. "Tuesday"_)

We suggest you name this higher order function `dayPlanner()`.

The return value of `dayPlanner` should be a string in the following format, assuming the `person` object represents Yolanda Johnson, the chore was mowing the lawn, and the day was Thursday.

```html
"Yolanda Johnson mowed the lawn on Thursday."
```

Log that output to the developer console.

### Busy Day

Refactor the `dayPlanner` higher order function to accept five (5) parameters. The first three should be functions. The fourth should be the person object. The fifth should be the day string.

```js
(firstChore, secondChore, thirdChore, person, day)
```

Inside the higher order function, invoke all three chore functions and format the return value for `dayPlanner` to follow this format.

```html
"On Monday, Yolanda Johnson mowed the lawn, and Yolanda Johnson
picked up the dry cleaning, and Yolanda Johnson replaced the
batteries in the smoke detectors."
```

Log that output to the developer console.
