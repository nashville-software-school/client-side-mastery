# :pushpin: Exercises

1. [Sandwich Maker](../exercises/SP_JS_IIFE_SANDWICH.md)
1. [Walk-A-Thon](../exercises/SP_JS_IIFE_BOOTSTRAP.md)

# Javascript:  Modular JavaScript Development

Now it's time to start making you a modern, web application developer. The most important skill is not knowing JavaScript, but understanding how to make a modular application, regardless of the language used. You may end up working for a team that likes CoffeeScript, or TypeScript, or any other meta-language that compiles into vanilla JavaScript.

Creating modular code is all about creating strong [abstractions](https://en.wikipedia.org/wiki/Abstraction_(computer_science)). We want boundaries which appropriately expose functionality and [hide implementation](https://stackoverflow.com/a/8694874/435409).

## Literal modules

A literal JavaScript module is just a plain old JavaScript object [POJO]. It has no internal, private state that cannot be changed by someone else that has access to your code in the browser.

```js
// Literal object module
var basicCarModule = {

  color: "blue",
  size: "sedan",

  options: {
    sunRoof: true,
    racingStripes: false,
    spoiler: false,
    leatherSeats: true,
    heatedSeats: true,
    underLighting: false
  },

  setSpoilerOption: function (spoiler) {
    this.options.spoiler = spoiler;
  },

  setColor: function (color) {
    this.color = color;
  },

  setOptions: function (options) {
    this.options = options;
  }

}

console.log('basicCarModule', basicCarModule);

// You can call methods on the object
basicCarModule.setColor("green");

// You can also modify other keys, even without a setter function (bad)
basicCarModule.size = "minivan";

console.log('basicCarModule', basicCarModule);
```

## Immediately invoked function expression (IIFE)

It executes immediately after it’s created. This pattern is often used when trying to avoid polluting the global namespace, because all the variables used in the function are not visible outside its scope.

### Basic (anonymous closure)

```js
var global_base = 500;

// This function is not immediately executed
function throwAway() {
  global_base += 500;
}

// You have to explicitly execute the function
throwAway();
console.log("global_base",global_base);

// This function expression is immediately executed
(function () {
  var _internal_base = 100;
  var _internal_sum = _internal_base + global_base;
  console.log("_internal_sum",_internal_sum)
}());

/*
  Just like any other function, any variables
  declared inside its scope are not available in
  the global scope.
 */
console.log("_internal_base",_internal_base)
```

### Module private members

> File: sedan.js

```js
// IIFE
// Immediately invoked function expression
var Sedan = (function() {
  var color = "blue";
  var type = "sedan";

  return {
    manufacture_date: new Date(),
    getColor: function() {
      return color;
    },
    setColor: function(newColor) {
      color = newColor;
    },
    getType: function() {
      return type;
    }
  };
})();

/* 
  Now, code that uses this module can call methods, and access
  properties that are in the public interface, but cannot change
  any private variables.
*/
Sedan.setColor("green");  // this works

/*
 This adds the property to the public interface, but the 
 existing, internal type property remains unchanged.
*/
Sedan.type = "minivan"; 
console.log(Sedan.getType());
```

### Augmenting modules

One limitation of the module pattern so far is that the entire module must be in one file. Anyone who has worked in a large code-base understands the value of splitting among multiple files. Luckily, we have a nice solution to augment modules. 

First, we import the module, then we add properties, then we export it. Here’s an example, augmenting our **Sedan** from above:

> File: sedan.html

```html
<!doctype html>

<html lang="en">
<head>
  <meta charset="utf-8">
  <title>NSS Starter Kit - Modules</title>
</head>

<body>

  <script src="sedan.js"></script>
  <script src="sedan_augment.js"></script>

</body>
</html>
```

> File: sedan_augment.js

```js
var Sedan = (function(sedan) {
  var max_occupancy = 6;
  var current_occupancy = 0;

  sedan.setOccupancy = function(occupancy) {
    if (occupancy <= max_occupancy) {
      current_occupancy = occupancy;
    } else {
      throw "Cannot exceed maximum occupancy of " + max_occupancy;
    }
  };
  
  sedan.getOccupancy = function() {
    return current_occupancy;
  };
  
  return sedan;

})(Sedan);

console.log(Sedan);
console.log(Sedan.setOccupancy(9));
```

# Resources

[Eloquent Javascript: Chapter 10, Modules](http://eloquentjavascript.net/10_modules.html)
