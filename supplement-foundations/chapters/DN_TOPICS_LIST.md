# Listing Only The Topics

Now that you have listed all of the notes, you need to list all of the topics that have been used to describe the notes.

## Instructions

In this chapter you will need to write a `for..of` loop inside of another one since the topics on each note is an array as well.

Start with `console.log("*** All Note Topics ***")` and display each topic beneath it.


### Run Your Code

In your terminal, run your code with the following command.

```sh
node main.js
```

When you run the code, it should display something like the following.

```txt
*** All Note Topics ***
strategy
professional
help
thinking
reminder
github
```

## Hint

Remember, use all the other resources at your disposal before looking at hints. Start thinking like a professional now and become an efficient learner, not a lazy one.

<details>
    <summary>Nested For Loop</summary>

```js
for (const note of notes) {
    for (const topic of note.topics) {
        console.log()  // What is the data type of the `topic` variable?
    }
}
```
</details>
