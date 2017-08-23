# :pushpin: Exercises

1. [Planets](../exercises/MJ_BROWSERIFY_PLANETS.md)
1. [Sandwich Maker Redux](../exercises/MJ_BROWSERIFY_SANDWICH_MAKER.md)
1. [Music History 6](../exercises/MJ_BROWSERIFY_MUSIC_HISTORY_6.md)

# About Browserify

At the most basic level, [Browserify](http://browserify.org/) is used to create modular JavaScript applications for the browser. It uses the [`require()`](https://nodejs.org/api/all.html#all_require) syntax from the Node.js tools to pull in dependencies that are written in other modules.

All of the modules are then weaved, or stiched, together to produce one, larger JavaScript file that places all of your modules in the right order for use in your application.

Let's look at a very basic example of building a calculator application where each operation is in its own module.

## Structure

First, create a sub-directory in your workspace directory named `calc-browserify`. In that directory, create an index.html and two more directories: `dist` which will hold the single, large JavaScript file for your application, and a `javascripts` directory which holds the source code.

```js
mkdir ~/workspace/calc-browserify && cd $_
touch index.html
mkdir dist
mkdir javascripts
```

## The application entry point

The first module you typically create in a Browserify application is, what's called, the **main** module.

```
cd javascripts
touch main.js
```

This module is the starting point of the application and will pull in dependencies that have the functionality. Here's a good start.

##### main.js

```js
"use strict";

let MyCalculator = require("./calculator");
```

In this single statement, what you're doing is using the `require` method to open the `calculator.js` file in the same directory, run its code, and take the value that it returns, and placing it into the `MyCalculator` variable.

## Your first module

Now go ahead and create the calculator.js file.

##### calculator.js

Here, you'll see that the calculator module itself is dependent upon other modules.

```js
"use strict";

/*
  The functionality for adding, subtracting, multiplying, and dividing
  are broken out into individual modules. Require those into this module.
 */
const add = require("./add");
const subtract = require("./subtract");
const multiply = require("./multiply");
const divide = require("./divide");

/* 
  Now, construct an object that contains a key/value pair for each
  of those modules that we pulled into this one
*/
let Calculator = {
  add, subtract, multiply, divide
};

/*
  Every module needs to specify what its output is. Think of this as the
  return statement in a function. What are we returning for use by other
  modules in the application?
 */
module.exports = Calculator;
```

Each one of the dependencies does one thing, and one thing only. This make a codebase easier to maintain, and allows for more flexibility when new features are added.

## More depedencies

Any time you need to add a new feature to your application, always think of adding a new module first before trying to augment existing modules. Now, since our Calculator object needs the ability to add, multiple, subtract, and divide, it pulled in that functionality from four other modules.

Go ahead and create those now.

##### add.js

```js
"use strict";

function add (one, two) {
  return one + two;
}

module.exports = add;
```


##### subtract.js

```js
"use strict";

function subtract (one, two) {
  return one - two;
}

module.exports = subtract;
```


##### multiply.js

```js
"use strict";

function multiply (one, two) {
  return one * two;
}

module.exports = multiply;
```


##### divide.js

```js
"use strict";

function divide (one, two) {
  return one / two;
}

module.exports = divide;
```

## Compiling your application

Now that you've got all of the modules needed for your application, it's time to stitch them together.

Go ahead and create a `Gruntfile.js` in the root directory for your project, and follow the instructions in the [Browserify Gruntfile](./MJ_BROWSERIFY_GRUNTFILE.md) resource file.

Once all the packages are installed and your Grunt file has the instructions, you can try to build your application. Go to the CLI in the root project folder and run the following command.

```bash
grunt
```

This will create a `bundle.js` file in the `dist` folder. If you encounter any error when Grunt runs, or the bundle file does not get created, talk to an instructor.

## Running your application

Before you run the application, let output some information to the console. Open up `main.js` and put in some `console.log()` statments.

```js
console.log("add 9 10", MyCalculator.add(9, 10));
console.log("subtract 10 9", MyCalculator.subtract(10, 9));

console.log("MyCalculator", MyCalculator);
```

Now just include your bundled file in your HTML and run it in your browser.

```html
<!doctype html>

<html lang="en">
<head>
  <meta charset="utf-8">
  <title>Nashville Software School</title>
</head>

<body>

  <script src="dist/bundle.js"></script>

</body>
</html>
```

# Resources

Once you've worked on the Browserify exercises, if you want to learn about more transforms that it can accomplish, beyond JsHint, SASS, and modules, then visit the [list of transforms](https://github.com/substack/node-browserify/wiki/list-of-transforms) on Github. Find a transform that interests you and see if you can get it to work.
