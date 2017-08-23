# JavaScript: Core Principles

## Function expression vs. function declaration

```
var myFunc = function() {
  // This is a function expression
};

function yourFunc() {
  // This is a function declaration
}

var theirFunc = function ourFunc() {
  // This is a function expression
};

// ourFunc is not defined, nor does it make the previous expression into a declaration

```

## Hoisting
Function declarations and variable declarations are always moved (“hoisted”) invisibly to the top of their containing scope by the JavaScript interpreter. Function parameters and language-defined names are, obviously, already there. This means that code like this:

```js
function foo() {
  bar();
  var x = 1;
}
```

is actually interpreted like this:

```js
function foo() {
  var x;
  bar();
  x = 1;
}
```

Variable declarations get hoisted, but expressions do not.

```js
function test() {
  foo(); // TypeError "foo is not a function"
  bar(); // "this will run!"
  var foo = function () { // function expression assigned to local variable 'foo'
    alert("this won't run!");
  }
  function bar() { // function declaration, given the name 'bar'
    alert("this will run!");
  }
}
test();
```

Because of hoisting in JavaScript, it is common convention to make sure that you have **only one** var declaration for each variable, and that you do it at the top of the function to avoid an confusion or bugs caused by hoisting.

```js
function goodFunc() {
  var good = true;
  var evil = false;
  var wings = 2;

  // Awesome code using those variables...
}
```

You can also have one `var` declaration, and then have each variables separated by commas. The `var` applies to all of them.

```js
function goodFunc() {
  var good = true, evil = false, wings = 2;

  // Awesome code using those variables...
}
```

## Callbacks review

> A reference to executable code, or a piece of executable code, that is passed as an argument to other code.

```js
function callMe(numA, callback) {
  var newNum = numA * 11;
  callback(newNum);
}

function maybe(numB) {
  console.log("final", numB * 8);
}

callMe(5, maybe);
```
