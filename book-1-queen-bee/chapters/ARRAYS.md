## Arrays (a.k.a. collections of things)

In software, values don't only have to be assigned individually to variables.

```js
const flower1 = "Tulip"
const flower2 = "Rose"
const flower3 = "Daffodil"
const flower4 = "Daisy"
```

Since you have four strings that are all describing a similar type of thing - flowers - you can put those four strings in a collection called an array in JavaScript. You can spot an array in code by seeing some comma-delimited values separated by commas, which are all surrounded by two square brackets: the `[` and the `]` characters.

Here is an array of those four flowers.

```js
const flowers = [ "Tulip", "Rose", "Daffodil", "Daisy" ]
```

When you assign an array as a value to a variable, it is recommended that you name the variable as a plural form of what the items in the array are. Here are some more examples.

```js
const dogs = [ "Schnauzer", "Labrador Retriever", "Bulldog", "Poodle", "Collie" ]
const studentAges = [ 24, 54, 32, 27, 29, 40, 35 ]
const professions = [ "Mechanic", "Plumber", "Musician", "Engineer" ]
const expenses = [ 71.54, 401.03, 89.59, 145.62 ]
const months = [ "April", "July", "October", "December" ]
```

As a software developer, you will constantly be working with collections of related data stored in arrays like the ones above.

In this book of the course, you will learn how to access specific items in an array, how to add items to an array, and how to automate the process of targeting each item in the array - in sequence - and doing something with each item.

## Position of Items in an Array

Here's a simple definition of an array. Think of it as an empty basket. Nothing is in it yet.

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

## Exercises:

### Setup

```sh
cd
cd workspace
mkdir arrays-intro
cd arrays-intro
touch main.js
code .
```

Once VS Code starts, open the `main.js` file copy the following code into the file.

```js
const yellowFruit = "Banana"
const orangeFruit = "Orange"
const redFruit = "Apple"
const greenFruit = "Watermelon"
const blueFruit = "Blueberry"

const fruits = []

console.log(fruits)
```

### Instructions Excersie #1

Take the 5 values assigned to the 5 variables and store them in the provided blank array instead. When you are done, there should be no variables with string values left in your code - only the `fruits` variable.

### Run Your Code

In your terminal, run your code with the following command.

```sh
node main.js
```

You should see the following output in the terminal.

```sh
[ 'Banana', 'Orange', 'Apple', 'Watermelon', 'Blueberry' ]
```

## Instructions Exercise #2
You work in a fancy restaurant. You are in your first month, and everyone they hire starts in the kitchen as a dish cleaner. Your job, specifically, is to scrub the glasses clean. Over in the code editor, you will find an array of dirty dishes. This represents the large sink in the back of the restaurant where the waiters place all of the dirty dishes.

Copy the following code into the file.

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