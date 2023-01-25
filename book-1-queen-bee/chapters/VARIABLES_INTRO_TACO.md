# Let's Taco about Variables

JavaScript is the programming language of the web. This is how we'll make our web pages *do* things:
- Respond to clicks
- Log in users
- Show us our saved information
- Keep track of our friend's information
- And pretty much everything else you can think of that happens on the web

But before we can do any of that cool stuff, we need to learn the basic building blocks of JavaScript.

## **Setup**
--- 

In your terminal, run the following commands. These create a directory, and a file in that directory for the code you will write in this chapter.

```sh
cd ~/workspace
mkdir variables
cd variables
touch main.js
code .
```

## **One Small Step** 
---

We can check our work in JavaScript by running ```node.js```. Paste the following line into your JS file. 

```js
console.log("Hello, world!")
```

Next, go to your terminal and run the following command.

```sh
node main.js
```

Congratulations, you have officially done it. You are now on your way to being a spec-taco-ular JavaScript programmer.


## **Variables**
---

A variable is a little box to store information that you want to reference or modify later. Let's start by creating a simple variable to hold a name:

```js
let myName = "Dwayne The Rock Johnson";
```

We can also declare the variable first and then assign it later. This is like setting up an empty box and then putting something in it later.
```js
let myName; // variable declaration

myName = "Dwayne The Rock Johnson"; // variable assignment
```
Variable values can change. For example, lets' say we want to change our name to just "The Rock" for the sake of brevity.

```js
// We declare the variable just like we did before
let myName = "Dwayne Johnson";

// Except this time we reassign it to hold a different value. Notice we don't have to use the let keyword for reassignments.
myName = "The Rock";

// This should log "The Rock" to the console
console.log(myName);
```  

## `let, const, and var`
---

If you've been exposed to JavaScript before, or you find yourself googling in the next couple of weeks, you may see some other ways of declaring variables. For example, all of the following is valid code:
```js
let catsName = "Edgar"

const catColor = "orange"

var catAge = 5
```

There are slight differences in the way each of these variables will behave. We'll discuss more about those differences later. For now, we'll default to using `let`. If you're burning with curiosity, you can read a little bit more about the different variable keywords [here](https://www.freecodecamp.org/news/var-let-and-const-whats-the-difference/).


# Data Types
So far, most of our variables have been strings (i.e. they've had quotes around them). JavaScript doesn't care what data type our variables are when we assign them, but data types behave differently once you start trying to manipulate them.
## Primitive Data Types
---  
### Numbers
Unlike strings, numbers do not have quotes around them. JavaScript treats both integers (whole numbers) and floats (decimal numbers) the same.
```
let age = 46;
```
You can perform basic math with JavaScript just like you would on a calculator.

```js
let totalCost;
let totalWithTax;

let costPerItem = 2.50;
let numberOfItems = 4;
let taxRate = 0.06;

totalCost = costPerItem * numberOfItems;
totalWithTax = totalCost + (taxRate * totalCost);

console.log(totalWithTax);
```
### Booleans
Booleans are true/ false values. They do not have quotes around them.

```js
let likesDogs = true;

let allergicToDogs = false;
```
### Strings
Strings are anything that has a quotes around it. For now, the main thing we'll do with strings combine them with other values. This is called concatenation (when you combine a string with another string) or interpolation (when you combine a string with a variable or expression). Don't worry too much about the vocab for right now.

```js
let firstName = "Dwayne";
let lastName = "Johnson";

// There are a couple different ways to combine strings. These two examples produce the same result:

// Option A: String Concatenation with the + symbol
let fullName = firstName + " " + lastName;

// Option B: String template literals (probably easier once you get used to them) When we say you need to string interpolate this is what we mean. More on this later
fullName = `${firstName} ${lastName}`;
```

Anything becomes a string when you put quotes around it. This can cause some funky behavior if you're not careful.

```js
let x = "2";
let y = "4";
let total = x + y;
// In this case, the value of total would be "24", not 6.

```


## New Vocab
These are some important new words we've learned so far. If you don't remember what any of these mean, re-read the chapter so far or ask an instructor.
1. Variable
1. Declare
1. Assign
1. String
1. Boolean


***
## Lightning Exercise
### All About Me
1. In your JavaScript file, declare and assign the following variables with information about yourself:
  - `firstName` should hold a string of your first name
  - `lastName` should hold a string of your last name
  - `age` should hold a number of your age
  - `likesTravel` should hold a boolean representing whether or not you like to travel
  - Log each variable to your terminal
***

## Practice


### 1. Today's weather
1. In your JavaScript file, instantiate and assign the following variables with information about the current weather:
  - `temperature` should hold a number representing the current temperature in Fahrenheit
  - `conditions` should hold a string about the current weather conditions (i.e. "cloudy", "sunny", etc).
  - `sunriseTime` should hold a string representing what time the sun rose this morning
  - `sunsetTime` should hold a string representing what time the sun will set this evening
  - Log each variable to your terminal
  - Use string template literals to combine these variables into a sentence about the weather. (Example: "It's currently sunny and 55 degrees. The sun rose this morning at 7:34 AM and will set at 5:09 PM.")



