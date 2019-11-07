# Functions in JavaScript

Functions are reusable code. JavaScript written without functions executes one line of code at a time until complete.

```js
// Display the first and last name of the following people
let firstName = "Jamal";
let lastName = "Haynes";

console.log(`${firstName} ${lastName}`);

firstName = "Debra";
lastName = "Gordon";

console.log(`${firstName} ${lastName}`);

firstName = "Svetlana";
lastName = "Irinov";

console.log(`${firstName} ${lastName}`);

firstName = "Sequina";
lastName = "Rodriguez";

console.log(`${firstName} ${lastName}`);
```

The inefficiencies of this code are obvious - from needlessly repeating the same code, to the high probability of human error as we increase the number of times we need to perform the operation.

```js
let firstName = "Jessawynne";
let lastName = "Parker";

// Oops, I misspelled firstName. My program now has an error, or bug, in it.
console.log(`${fist_name} ${lastName}`);
```

When the same lines of code need to be repeated, even just once, then you put those lines of code in a function. You provide a name for a function, and it needs to be descriptive enough to understand what its purpose is.

```js
function displayName (firstName, lastName) {
  /*
    Since the code needed to display a person's name is written
    only once, we never have to worry about a developer
    misspelling a word, or missing a character because she
    needed to write the code for the 34th time.
  */
  console.log(`${firstName} ${lastName}`)
}

displayName("Jamal", "Haynes")
displayName("Debra", "Gordon")
displayName("Svetlana", "Irinov")
displayName("Sequina", "Rodriguez")
displayName("Jessawynne", "Parker")
```

## Pure Functions

A pure function is one that is consistent and has no effect on anything else in your system.

```js
const bugSquasher = function (bug, squasher) {
    return `The ${bug} was squashed by the ${squasher}`
}
```

That function will return the exact same value, given the same inputs every time.

```js
bugSquasher("Beetle", "Boot")
> The Beetle was squashed by the Boot

bugSquasher("Beetle", "Boot")
> The Beetle was squashed by the Boot // Yep, same output

bugSquasher("Spider", "thing next to my hand when I saw it")
> The Spider was squashed by the thing next to my hand when I saw it
```

## Impure Functions

Impure functions produce different results upon execution...

```js
const noise = function () {
  return Math.random()
}

console.log(noise())   // ​​​​​0.8521188650079663​​​​​
console.log(noise())   // 0.311073492244087​​​​​
```

or affect other parts of the system when executed.

```js
const updateDOM = function (message) {
    const el = document.getElementById("messages")
    el.innerHTML += message
}
```

## Videos to Watch

1. NSS Learning Team video showing the usage of [functions as sub-programs](https://www.youtube.com/watch?v=XBVombfX-lQ&list=PLX0ucpUE_qIOUsxGNEPpP9yonb4zerVIC&index=1)
1. [Functions Introduction to JavaScript Learn JavaScript](https://www.youtube.com/watch?v=cX4tVeJXp3Y)
1. [Javascript Tutorial For Beginners - #3 Javascript Functions Tutorial](https://www.youtube.com/watch?v=AY6X5jZZ_JE)
1. [What the Function: Introduction to Javascript Functions - 1 of 3](https://www.youtube.com/watch?v=hVHl20w0glE)
1. [What the Function: Writing Your Own JavaScript Functions - 2 of 3](https://www.youtube.com/watch?v=Q_GZtTwhjFQ)
1. [What the Function: Higher Order Functions - 3 of 3](https://www.youtube.com/watch?v=jE7MAh2EgSQ)
1. [ES6 Arrow Functions in JavaScript tutorial](https://www.youtube.com/watch?v=_pfXEv9cFGE)
1. [Understanding Closures (In Under 10 Minutes!)](https://www.youtube.com/watch?v=rBBwrBRoOOY)
1. [Javascript Closures Tutorial - What makes Javascript Weird...and Awesome Pt 3](https://www.youtube.com/watch?v=ZqGFKcCcO-Y)

## Practice: ChickenMonkey

Write a program that prints the numbers from 1 to 100. But for multiples of five (5, 10, 15, etc.) print "Chicken" instead of the number and for the multiples of seven (7, 14, 21, etc.) print "Monkey". For numbers which are multiples of both five and seven print "ChickenMonkey".

To determine if a number can be evenly divided by 5 or 7, use the JavaScript [remainder](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Arithmetic_Operators#Remainder) operator.

You can start with this simpler version that outputs even numbers to the console and ignores odd numbers. You need to refactor this code to meet the requirements above.

```js
for (let currentNumber = 1; currentNumber <= 100; currentNumber++) {
    // Divide the current number by 2, and check if the remainder is 0
    if (currentNumber % 2 === 0) {
        console.log(currentNumber) // Only 2, 4, 6 will appear
    }
}
```

## Practice: Take a Number - Battle of the Bands

A local nightclub is having a Battle of the Bands night in a few months. They expect many bands to sign up because the grand prize is $20,000. To make things easier on the nightclub management, they want each band to be assigned a number so that they can easily keep track of the order in which the bands will perform.

Your job is to write a function that accepts any band name as an argument. The function will increment a global variable by one each time it is invoked, and return that number, and the band name concatenated together.

```js
let bandNumber = 1

const takeNumber = function () {
    /*
        Write your awesome code here. See comments
        below for what should be returned.
    */
}

const scum = takeNumber("Galactic Scum")
console.log(scum)  // This should print "1. Galactic Scum" in the console

const under = takeNumber("Underdogs")
console.log(under)  // This should print "2. Underdogs" in the console
```
### UI/UX Challenge
**This is an optional challenge once you meet MVP. Make a new GitHub branch for this challenge.**

Nightclub management wants to use this app at the front door during the event. Incorporate the logic you have written and add an HTML document and apply CSS to make a mobile version of Battle of the Bands.


## Practice: Cookout

Copy the following objects into your JavaScript file.

```js
const hamburger = {
	name: 'Hamburger',
	type: 'beef',
	cooked: false,
}
const zucchini = {
	name: 'Zucchini',
	type: 'vegetable',
	cooked: false,
}
const chickenBreast = {
	name: 'Chicken Breast',
	type: 'chicken',
	cooked: false,
}
const corn = {
	name: 'Corn',
	type: 'vegetable',
	cooked: false,
}
const steak = {
	name: 'Steak',
	type: 'beef',
	cooked: false,
}

// An array that is grouping the objects together.
const foods = [hamburger, zucchini, chickenBreast, corn, steak];

// An empty array that will store the objects after the `grill()` function cooks the food.
const cookedFood = [];
```

This exercise does not require you to alter this function. But read it. See if you can follow what it takes in, executes, and returns.

The `grill()` function. Copy this into your JavaScript as well.

```js
function grill (currentObject) {
    // Modify the food so that it is cooked
    currentObject.cooked = true;

    // Put the cooked food into the appropriate array
    cookedFood.push(currentObject);
};
```

Your task is to iterate over the array of `foods` and invoke the function for each item so that the `cookedFood` array contains all of the items after they are cooked.

## Practice: Overly Excited

For this exercise, you need to create a single JavaScript function named `addExcitement` that will use `console.log()` to print out a sentence to the browser console.

1. If you haven't done so yet, create the `workspace/javascript/overly-excited` directory structure in your home directory. Open your terminal and enter in the following command.

    ```sh
    mkdir -p ~/workspace/javascript/overly-excited
    ```

1. Now that you have created the directory, you want to change to that directory so that you can add files to it.

    ```sh
    cd ~/workspace/javascript/overly-excited
    ```

1. Create an `index.html` file in this directory with the [touch](http://www.linfo.org/touch.html) command.
1. Create an `overly-excited.js` file in this directory with the touch command.
1. Copy the following code and paste it into the `index.html` file. Notice that the `overly-excited.js` file is properly linked so that when you load this HTML file in a web browser, the logic in that file will be executed.

    ```html
    <!DOCTYPE html>
    <html>
    <head>
        <title>Overly Excited</title>
    </head>
    <body>

        <script src="overly-excited.js"></script>
    </body>
    </html>
    ```

1. Open the `index.html` file in your web browser.
1. At this point, you will simply see a blank web page because you have no content in the HTML file. Open your developer tools using the *Option+Command+I* keyboard shortcut.
1. At the top of the developer tools panel, you will see the word *Console*. Click on that word. The `console.log()` statement will output any message into this panel in your developer tools. You can try it out immediately by clicking in the Console panel, and typing `console.log("Hello, world!")`, and then pressing your return key.

## Practice: Stacking Words

> The learning objects of this exercise is to use iteration and string concatenation

Create an `addExcitement` function that should `console.log()` rows of words. It should take an array containing the words of a sentence and output them in the developer console.

> **Example output:**
>
> The
>
> The walrus
>
> The walrus danced
>
> The walrus danced through
>
> The walrus danced through the
>
> The walrus danced through the trees
>
> The walrus danced through the trees in
>
> The walrus danced through the trees in the
>
> The walrus danced through the trees in the light
>
> The walrus danced through the trees in the light of
>
> The walrus danced through the trees in the light of the
>
> The walrus danced through the trees in the light of the moon
> ...

Paste the following code into overly-excited.js

```js
// Create an array that contains the words in the sentence
let sentence = ["The","walrus","danced","through","the","trees","in","the","light","of","the","moon"];

/*
    The addExcitement function should be an impure function, and accept
    the array as the sole argument. It should iterate over the array
    and output the words to the browser console.
*/
function addExcitement (theWordArray) {

    // Each time the for loop executes, you're going to add one more word to this string
    let buildMeUp = ""

    for (let i = 0; i < theWordArray.length; i++) {
        // Concatenate the new word onto buildMeUp

        // Print buildMeUp to the console
    }

}

// Invoke the function and pass in the array
addExcitement(sentence)
```

## Practice: Some words are more exciting than others

> The learning objective of this exercise is to use the JavaScript `if` statement inside a loop to do one operation when a certain conditions is true, and a different operation if that condition is false.

Add logic to `addExcitement` that places an exclamation point (!) after every third word. Read the following English statement and write the equivalent in JavaSript code to make it work.

If the current value of the [counter variable](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/for) can be evenly divided by 3 (_using the JavaScript [remainder](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Arithmetic_Operators#Remainder) operator_) add a single exclamation point (!) to the current word in the array.

```js
let sentence = ["The","walrus","danced","through","the","trees","in","the","light","of","the","moon"];

function addExcitement (theWordArray) {
    let buildMeUp = ""

    for (let i = 0; i < theWordArray.length; i++) {
        /*
            If the current word's place (not index) in the array
            is evenly divisible by 3, add an exclamation point
            to the end of the word and then concatenate it to
            `buildMeUp`.

            Otherwise, just concatenate the word itself.
         */


        // Print buildMeUp to the console
    }

}

addExcitement(sentence)
```

> **Example output:**
>
> The
>
> The walrus
>
> The walrus danced!
>
> The walrus danced! through
>
> The walrus danced! through the
>
> The walrus danced! through the trees!
>
> The walrus danced! through the trees! in
>
> The walrus danced! through the trees! in the
>
> The walrus danced! through the trees! in the light!
>
> The walrus danced! through the trees! in the light! of
>
> The walrus danced! through the trees! in the light! of the
>
> The walrus danced! through the trees! in the light! of the moon!

## Practice: Function Arguments

> The learning objective of this exercise is to practice defining and using function arguments.

Add a new argument to the function so that a developer can specify which character should be displayed instead of it always being an exclamation point.

```js
// I want to use a question mark
addExcitement(sentence, "?")
```

> **Example output:**
>
> The
>
> The walrus
>
> The walrus danced?
>
> The walrus danced? through
>
> The walrus danced? through the
>
> The walrus danced? through the trees?
>
> The walrus danced? through the trees? in
>
> etc..

## Challenge: Multiple Punctuation

> Challenges are optional exercises that you can work once you've completed all the practice exercises and understand the concepts in them.

Add a new argument to the function so that a developer can specify how many times the special character should be added.

```js
// I want to use a 4 asterisks
addExcitement(sentence, "*", 4)
```

> **Example output:**
>
> The
>
> The walrus
>
> The walrus danced****
>
> The walrus danced**** through
>
> The walrus danced**** through the
>
> The walrus danced**** through the trees****
>
> The walrus danced**** through the trees**** in
>
> etc..

## Challenge: Arrow Functions

> Challenges are optional exercises that you can work once you've completed all the practice exercises and understand the concepts in them.

Watch the video (_see above_) about arrow functions, and see if you can rewrite `addExcitement` using that syntax.
