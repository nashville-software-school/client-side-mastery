# Functions Module

In this chapter, you are going to move all of your functions into a separate module, export them, and then import them back into the `averagePrice.js` module.

## Learning Objectives and Competencies

At the end of this chapter you should be able to...

* Describe what a JavaScript module is, and why developers odularize their code.
* Understand that each module does not automatically have access to code in other modules.
* Understand that for modules to share code, they must export and import their code.
* Understand that a module can only export one thing.
* Explain that a module can export multiple functions, or data structures, by adding them all to a single object.

## A Functions Module

Your current module of code can now be broken down into 3 main sections.

1. Where the data is imported at the top of the module.
2. Where the functions are defined that do operations on the data.
3. Where the logic of your application is defined where the functions are invoked to obtain the required output for the business.

You are going to move the functions section into its own module. In that module you will export those functions. Lastly, in the `averagePrice.js` module, you will import it.

This will not cause any change in functionality. You are simply splitting up your code into multiple modules for greater readability.

### Creating the Module

In the same directory as `averagePrice.js`, create a new file named `functions.js`.

```sh
touch functions.js
```

Then open `averagePrice.js`, highlight all of the functions and cut the code.

Open `functions.js` and paste the code in there.

### Exporting the Functions

At the bottom of the module, you are going to export all of the functions.

There is a limitation with exporting. You can only export one thing from a module, yet you want to export 6 things. The mechanism to handle that is to add each function as a key on an object.

The code below is a shorthand way of doing this in JavaScript. Each function is added as a key, by name, and the value of each property will be the function itself.

```js
module.exports = {
    isBargain, isClothing, isGear,
    isSurfboard, convertDataForAccounting,
    calculateAveragePrice
}
```

This is equivalent to doing the following. You can see why this shortcut was added to JavaScript, to eliminate all of the redundant syntax.

```js
// Don't do this. Use the shorthand syntax.
module.exports = {
    isBargain: isBargain,
    isClothing: isClothing,
    isGear: isGear,
    isSurfboard: isSurfboard,
    convertDataForAccounting: convertDataForAccounting,
    calculateAveragePrice: calculateAveragePrice
}
```

### Importing the Functions

The last step is to import the data back into `averagePrice.js` so that it has data to work with. Put this line of code at the top of the module.

```js
const {
    isBargain, isClothing, isGear,
    isSurfboard, convertDataForAccounting,
    calculateAveragePrice
} = require("./functions.js")
```

Now run your logic with the debugger again and verify that everything works as intended.
