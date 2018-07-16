# Functions in JavaScript

Functions are reusable code. JavaScript written without functions executes one line of code at a time until complete.

```js
// Display the first and last name of the following people
let firstName = "Jamal";
let lastName = "Haynes";

console.log(`${firstName} ${lastName}`);

let firstName = "Debra";
let lastName = "Gordon";

console.log(`${firstName} ${lastName}`);

let firstName = "Svetlana";
let lastName = "Irinov";

console.log(`${firstName} ${lastName}`);

let firstName = "Sequina";
let lastName = "Rodriguez";

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
    return `The ${bug} was squashed by a ${squasher}`
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

For example...

```js
// Only show even numbers
const numbers = [1,2,3,4,5,6,7]

for (let i = 0; i < numbers.length; i++) {
    const currentNumber = numbers[i]

    // Take the current number, divide by 2, and check if the remainder is 0
    if (currentNumber % 2 === 0) {
        console.log(currentNumber) // Only 2, 4, 6 will appear
    }
}
```

## Practice: Take a Number - Battle of the Bands

A local nightclub is having a Battle of the Bands night in a few months. They expect many bands to sign up because the grand prize is $20,000. To make things easier on the nightclub management, they want each band to be assigned a number so that they can easily keep track of the order in which the bands will perform.

Your job is to write a function that accepts any band name as an argument. The function will increment a global variable by one each time it is invoked, and return that number, and the band name concatenated together.

```js
const bandNumber = 1

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

## Practice: Overly Excited

## Requirements

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

## Stacking Words

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

## Adding Conditions to the Loop

Then add logic to `addExcitement` that places an exclamation point (!) after every third word. This will require you to do some basic math in JavaScript, and use an `if` statement.

Your job is to read the following English statement and write the equivalent in JavaSript code to make it work.

> If the current value of the [counter variable](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/for) can be evenly divided by 3 - using the JavaScript [remainder](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Arithmetic_Operators#Remainder) operator - then add a single exclamation point (!) to the output.

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
> ...

## Even More Excited

Add logic in the `addExcitement` function to the increase the number of exclamation points after every third word. The number of exclamation points (!) will be determined by how many times the counter variable can be divided by 3.

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
> The walrus danced! through the trees!!
>
> The walrus danced! through the trees!! in
>
> The walrus danced! through the trees!! in the
>
> The walrus danced! through the trees!! in the light!!!
>
> The walrus danced! through the trees!! in the light!!! of
>
> The walrus danced! through the trees!! in the light!!! of the
>
> The walrus danced! through the trees!! in the light!!! of the moon!!!!
> ...

## Function Arguments

Add a new argument to the function so that a developer can specify which character should be displayed instead of it always being an exclamation point.

```js
// I want to use a question mark
addExcitement(sentence, "?");
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
> The walrus danced? through the trees??
>
> etc..

## Another Sentence

Now you should define another variable that will hold an array of different words than your existing sentence. Perhaps name the variable `betterSentence`, or `nextSentence`.

Invoke your function for a second time, passing in the new sentence variable and a different special character.

```js
// Example
addExcitement(nextSentence, "&");
```

# Challenge: Arrow Functions

Watch the video about arrow functions, and see if you can rewrite `addExcitement` using that syntax.

```js
// Complete this arrow function template to make your
// function work with it.
let addExcitement = () => { };
```


# Practice: Cookout

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
```

And two arrays. The first array contains the objects to be cooked.

```js
const uncookedFood = [hamburger, zucchini, chickenBreast, corn, steak];
```

And an empty array that will store the objects after the `grill()` function cooks the food.

```js
const cookedFood = [];
```

This exercise does not require you to alter this function. But read it. See if you can follow what it takes in, executes, and returns.

The `grill()` function. Copy this into your JavaScript as well.

```js
const grill = currentObject => {
	// Modify the food so that it is cooked
	currentObject.cooked = true;

	// Put the cooked food into the appropriate array
	cookedFood.push(currentObject);
};
```

Your task is to iterate over the array of `uncookedFood` and invoke the function for each item so that the `cookedFood` array contains all of the items after they are cooked.

