# Understanding Errors

Your whole life, you've been trained to make mistakes disappear as quickly as possible. Part of this program is to begin the process of re-training your brain.

Your future teammates will only benefit if you understand why the error is happening, not just that you fixed it. Then you can explain to them why it happened so that future errors of the same kind can be avoided.

## Logical Errors

Copy pasta the following code into your `main.js` module and run the debugger again. Make sure you don't have any breakpoints set.

```js
const ramona = hailTheQueen()
console.log(ramona)
```

You will notice the following output in the Debug Console.

```sh
Hail Her Majesty, undefined.
```

Do you understand why you see the value of `undefined` at the end of the sentence instead of queen's name? It is easy to fix the error, but anyone can do that. Can you explain it, though?

Here is the correct vocabulary.

> The value of `undefined` is at the end of the string that was returned by the function because no argument was provided when the function was invoked. Therefore, the `nameString` parameter retained its default value of `undefined` and that value was placed at the end of the string template.

This is called a logical error. That means that all of your syntax was valid, so JavaScript executed all of it without any problems. However, the output was invalid.

These are the hardest errors to understand and resolve because JavaScript can't tell you what you did wrong. As far as it is concerned, you did not violate any syntax rules so your code is good.

Go ahead and fix the logical error by providing a valid argument.

## Syntactical Errors

When you make a mistake with the syntax rules of the language itself, JavaScript can, and will tell you exactly where you messed up, and how. Unfortuntely, as a beginner, sometimes the error message can be as confusing as the error itself.

Time to make a common, beginner syntactical error.

Copy pasta the following code at the bottom of the `main.js` module, and then run the debugger.

```js
const monica = hailTheQuen("Monica Dinglehopper")
console.log(monica)
```

Now watch the following video for an overview of how to read and understand a JavaScript syntax error.

[<img src="../../book-1-queen-bee/chapters/images/video-play-icon.gif" height="75rem" />](https://watch.screencastify.com/v/cN8Vw8dWNvwb4L2avTq8)