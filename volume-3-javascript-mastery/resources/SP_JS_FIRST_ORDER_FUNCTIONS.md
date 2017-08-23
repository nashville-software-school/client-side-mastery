# :pushpin: Exercises

1. [Calculator](../exercises/SW_JS_ADVANCED_FUNCTIONS_CALCULATOR.md)

# Javascript: First Order Functions

## More about first order functions

Since functions are objects, you can pass them as arguments to other function, just like you would any other native JavaScript type. This exercise is a simplistic example of a software development pattern called [Decorator](https://developer.mozilla.org/en-US/docs/Decorators).

```js
/*
  Create a function that makes something hungry by
  setting the `bellyIs` property value of the object
  passed in to "hungry".

  It would be called like this:
    var cat = {};
    console.log(cat);  // { }
    makeHungry(cat);
    console.log(cat);  // { bellyIs: "hungry" }
 */
function makeHungry(thing) {
  thing.bellyIs = "hungry";
}


/*
  Create a function that makes something full
 */
function makeFull(thing) {
  thing.bellyIs = "full";
}

/*
  Create a function that paints something red
 */
function paintRed(thing) {
  thing.color = "red";
}

/*
  Create a function that makes a thing old
 */
function makeOld(thing) {
  thing.age = "old";
}

/*
  Create a function that makes a thing old
 */
function makeYoung(thing) {
  thing.age = "young";
}

/*
  Create a function that has two arguments
    1. An object
    2. A function that applies a modifier

  This is the function that allows you to decorate any
  object with properties.
 */
function modifyThing(thing, modifier) {
  modifier(thing);
}

/*
  Make an object that you will then decorate by calling
  the corresponding functions
 */
var elephant = {
  type: "African",
  name: "Horton"
};

/*
  Call the modifyThing function, and pass in
  an object, and the function you want it to
  execute.
 */
modifyThing(elephant, paintRed);

/*
  You can continue to decorate your objects
  in any way that you want
 */
modifyThing(elephant, makeFull);
modifyThing(elephant, makeYoung);

/*
  Now you can continue to modify your object
  without having to write complex logic in a single
  function. You make a lot of smaller functions
  that do one thing, and one thing only.

  This is another pillar of software development
  called the Single Responsibility Principle. The
  concept comes from OOP software, but it has
  extended into more general terms.

  https://en.wikipedia.org/wiki/Single_responsibility_principle
 */

/*
  Now your object has some new properties
 */
console.log(elephant); // { bellyIs: "full", age: "young", color: "red" }
```
