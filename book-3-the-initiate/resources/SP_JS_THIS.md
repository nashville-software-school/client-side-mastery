# Javascript: this (pronounced 'zeese')

What is `this` in JavaScript? It's a common misconception that when you see the keyword `this` inside a function that it refers to the function itself. However, it's the *context* in which a function is executed that drives what the value of `this` is.

Let's look at a simple example to show why it is not a reference to the function itself.

```js
// Define a function that increments this.counter
function sample( loopCounter ) {
  console.log( "loopCounter", loopCounter );
  this.counter++;
}

// Set the initial value of the counter variable in the function
sample.counter = 0;

// Define a loop that called sample() an arbitrary number of time
for (var i = 0; i < 11; i++) {
  sample( i ); // Outputs 0, 1, 2, 3, etc..
}

// Output the final value of the counter variable from the function
console.log( sample.counter );  // Outputs 0
```

In the previous example, we need to look at the execution context that existed when we executed the `sample()` function. Remember when I explained that **everything** lives on the `window` (i.e. global) object when JavaScript was executed in a browser? Well, looking back inside the `for` loop above, you'll notice that we have a simple execution of the `sample()` function. Therefore, the execution *context* is the `window` object.

That *execution context* becomes the value of `this` for the entirety of the execution of the function. So, looking back on the previous example, if the *execution context* is `window`, the function evaluates as this.

```js
// Define a function that increments this.counter
function sample( loopCounter ) {
  console.log( "loopCounter", loopCounter );
  window.counter++;
}
```

So when you output `sample.counter` to the console, it was still at 0, its initial value, because we never modified it. Instead, you were incrementing a global variable.

You will be learning more about `this` in future modules, but just keep in mind that its value is not the function containing it, but the context in which the function was executed.