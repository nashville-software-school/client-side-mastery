# Modules

When writing applications, you will be writing code in multiple files. The code in those files will work with each other to solve a complex problem.

You call them modules, not files, when referring to them.

## Project Setup

Create a new project with three files in it.

```sh
cd ~/workspace
mkdir modular-marbles
cd modular-marbles
touch main.js marbleMaker.js bagMaker.js
code .
```

## Responsibilities

The responsbility of the `marbleMaker.js` module is to generate new marbles. It will contain a single function with instructions for this process.

The responsbility of the `bagMaker.js` module is to generate new bags specially designed for marbles. It will contain a single function with instructions for this process.

The responsbility of the `main.js` module contain the instructions for putting marbles into bags. It will use _(i.e. invoke)_ the functions that are defined in the other modules to solve the problem.

You will be introduced to the concept of some modules exporting their functions so that other modules can invoke them. You will also be introduced to the concept of importing those functions into a module to be invoked.

## Marble Maker

Open the `marbleMaker.js` module.

Copy pasta the following function into it.

```js
/*
    Define a function to create a marble. The size of the
    marble will be passed as a string argument
*/
const createMarble = (sizeString) => {
    // Define an array containing strings for all possible marble colors
    const colors = ["red", "blue", "green", "purple"]

    // Get a random number in the range of 0 - 3
    const randomIndex = Math.floor(Math.random() * 4)

    // Use that number to get a random string from the array
    const randomColor = colors[randomIndex]

    // Return a string description of the marble created
    return `A ${sizeString}, ${randomColor} marble`
}
```

### Export Function Definition

You are not going to invoke the function in this module - just define it. The next step is to export this module so that the `main.js` module can invoke it.

At the bottom of the file, add this code.

```js
module.exports = { createMarble }
```

Once that is added, **any** other module can import the function definition and invoke it.

### Import and Invoke Function

Give it a shot. Open the `main.js` and add the following code at the top.

```js
const { createMarble } = require("./marbleMaker.js")
```

This is the yang to the yin of exporting. This is importing the function definition from the other module.

Now you can invoke the function and store what it returns.

```js
const marble = createMarble("small")
console.log(marble)
```

In your terminal, run the `node main.js` command to see the marble you just created.

## Bag Maker

Open the `bagMaker.js` module.

Copy pasta the following function into it.

```js
/*
    Define a function to create a marble. The size of the
    marble will be passed as a string argument
*/
const weaveBag = (materialString) => {
    // Define an array containing strings for all possible marble colors
    const colors = ["red", "blue", "green", "purple"]

    // Get a random number in the range of 15 - 30
    const randomAmount = Math.floor(Math.random() * 16) + 15

    // Return a string description of the bag
    return `A ${materialString} marble bag that can hold ${randomAmount} marbles`
}
```

### Export Function Definition

You are not going to invoke the function in this module - just define it. The next step is to export this module so that the `main.js` module can invoke it.

At the bottom of the file, add this code.

```js
module.exports = { weaveBag }
```

Once that is added, **any** other module can import the function definition and invoke it.

### Import and Invoke Function

Give it a shot. Open the `main.js` and add the following code at the top.

```js
const { weaveBag } = require("./bagMaker.js")
```

This is the yang to the yin of exporting. This is importing the function definition from the other module.

Now you can invoke the function and store what it returns.

```js
const bag = weaveBag("silk")
console.log(bag)
```

In your terminal, run the `node main.js` command to see the bag you just created.

## More Bags and Marbles

Now invoke the functions several more times, with different sizes for the marbles, and different materials for the bags.
