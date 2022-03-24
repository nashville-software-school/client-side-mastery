# Note Articles

In preparation for when you are going to be contructing HTML representations of your data to be displayed in a web browser, you are going to be constructing some strings in this chapter that contain the `<article>` element, with the text from each note contained _(interpolated)_ inside it.

## Instructions

Start with a new output section using the following code at the bottom of your file.

```js
console.log("***  Note Articles  ***")
```

Then iterate the notes array again. On each iteration, use `console.log()` to display the text of each note, but surrounded by an article HTML element. Refer back to the previous projects to review how to build a string template and interpolate JavaScript variables inside it.

```html
<article>Always work on a branch and submit a PR, even if I'm working on my own project.</article>
```

### Run Your Code

In your terminal, run your code with the following command.

```sh
node main.js
```

When you run the code, it should output similar to the following example.

```js
***  Note Articles  ***
<article>Always work on a branch and submit a PR, even if I'm working on my own project.</article>
<article>I have found that slowing down and thinking about the problem, and writing out the comments makes it vastly easier to write code.</article>
<article>Review all my old code before asking for help or looking at hints.</article>
```

## Hint

Remember, use all the other resources at your disposal before looking at hints. Start thinking like a professional now and become an efficient learner, not a lazy one.

<details>
    <summary>String templates</summary>

Sorry, no hint on this one. Refer back to chapters 8 and 9 in the Foundations Review work.
</details>
