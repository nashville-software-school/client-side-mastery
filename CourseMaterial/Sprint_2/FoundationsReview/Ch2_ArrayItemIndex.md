## Position of Items in an Array

As mentioned in the introduction, the most common type of collection in JavaScript is the array. An array can be identified by use of square brackets. The [ and the ] characters define an array. Here's a simple definition of an array. Think of it as an empty basket. Nothing is in it yet.

```js
const appleBasket = []
```

This is different than previous exercises where you assigned very concrete values to variables, like these.

```js
const age = 37  // Clear, concrete numeric value
const name = "Edward McKnight" // Clear, concrete string value
```

You can either declare a new array as empty, like above, or you can provide it with initial values upon declaration. For example, if you want some common color names to be in your array, you can provide those inside the square brackets.

```js
const myFavoriteColors = [ "red", "violet", "pink", "green", "white", "orange" ]
```

The myFavoriteColors variable still has a single value, but it is more abstract. Its value is a collection of strings, or more specifically, an array of strings.

The placement of each number in that array is called its "index". The indexing of an array starts at zero, not one. That is, the item at index 0 of the above array is the string value "red".

-   The item at index 0 is the string "red"
-   The item at index 1 is the string "violet"
-   The item at index 2 is the string "pink"
-   The item at index 3 is the string "green"
-   The item at index 4 is the string "white"
-   The item at index 5 is the string "orange"

You can, if you need to, look at the item at a specific index by using the following syntax.

```js
arrayVariable[index number]
```

So if you want to console.log() the color "white", you would write the following code.

```js
const whiteColor = myFavoriteColors[4]
console.log(whiteColor)
```

If you want to console.log() the color "violet", you would write the following code.

```js
const violetColor = myFavoriteColors[1]
console.log(violetColor)
```

## Exercise: Glass Scrubber

You work in a fancy restaurant. You are in your first month, and everyone they hire starts in the kitchen as a dish cleaner. Your job, specifically, is to scrub the glasses clean. Over in the code editor, you will find an array of dirty dishes. This represents the large sink in the back of the restaurant where the waiters place all of the dirty dishes.

### Setup

```sh
cd
cd workspace
mkdir glass-scrubber
cd glass-scrubber
touch main.js
code .
```

Once VS Code starts, open the `main.js` file copy the following code into the file.

```js
const dishes = [
    "Dinner plate", "Water glass", "Salad bowl",
    "Dinner plate", "Wine glass", "Spoon",
    "Spoon", "Fork", "Salad bowl", "Whiskey glass",
    "Fork", "Spoon", "Fork"
]

/*
    Declare three variables to store the string value
    of a glass in the array. Use the correct index to
    get the right value.
*/


console.log("I am cleaning the following glasses:")

// Put each variable in one of the parenthesis below
console.log()
console.log()
console.log()
```

### Instructions

Your job is to identify the 3 dirty glasses by using the their index in the array and assign each one to its own variable.

### Run Your Code

In your terminal, run your code with the following command.

```sh
node main.js
```

When you run the code, it should display the following.

```sh
I am cleaning the following glasses:
Water glass
Wine glass
Whiskey glass
```
