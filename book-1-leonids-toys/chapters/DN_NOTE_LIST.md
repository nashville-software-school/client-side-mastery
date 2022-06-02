# Listing Your Notes

## Instructions

Now that you have an array filled with a good number of note objects, it's time to list all of the notes to the terminal.

Iterate the array with a `for..of` loop and use `console.log()` to display **only** the `text` property of each object - not the full object.

### Run Your Code

In your terminal, run your code with the following command.

```sh
node main.js
```

> **New Skill!**
>
> When you are in your terminal, instead of typing out the same command over and over again, you can press the up arrow on your keyboard to go to **any** previous command you have typed, and then press enter to run it again.

When you run the code, it should display only the text of each note. Below is an example.

```js
"Review all my old code before asking for help or looking at hints."
"I have found that slowing down and thinking about the problem, and writing out the comments makes it vastly easier to write code."
"Need to have all my code backed up to Github by the end of the week."
```

## Hint

Remember, use all the other resources at your disposal before looking at hints. Start thinking like a professional now and become an efficient learner, not a lazy one.

<details>
    <summary>Displaying all note texts</summary>

```js
for (const note of notes) {
    // We don't give you everything in the hint
    console.log(something.something)
}
```
</details>
