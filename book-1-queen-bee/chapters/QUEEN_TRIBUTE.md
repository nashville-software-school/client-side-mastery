# This is Just a Tribute

Time to pay tribute to the queen! As a loyal citizen, you have the privilege of paying tribute to your queen each year. How lucky are you!

In this chapter, you need to define a new function that creates an object that represents your tribute to your queen. That new object will be added to a tribute chest _(i.e. an array of tribute objects)_.

## Learning Objectives and Competencies

At the end of this chapter you should be able to...

* Define a function with parameters and explain why those parameters are needed.
* Create an object based on the value of function parameters.
* Add a new value to an existing array.

## Tribute Object Creator

### Setup

Add the following line of code to the top of your `main.js` module.

```js
const tributeChest = []
```

### Description

A tribute object will have three properties.

1. An `id` property for a unique numerical identifier of the tirbute.
2. A `description` property to store the string description of your tribute.
3. A `queenId` property to store the unique numerical identifier of a specific queen.

Time for your first function to create a tribute object and add it to the tribute chest. Remember that a function must be properly written so that all of the information it needs to do its job can be captured as parameters.

This function's task is to create an object with three properties. The information it needs is what the value of each parameter will be. How many parameters must be defined for this function?

Here is some code to get you started, or you can write your own. You can write this function anywhere in your `main.js` module, but it is suggested that it be near the top of the module.

```js
const payTribute = () => {
    // Create a tribute object


    // Add the tribute object to the tribute chest
}
```

Now fill in everything that is needed for this function to complete its task. If you get stuck, there are hints below.

## Pay Your Tribute

Now invoke your function at least three times to pay tribute to three different queens. This means that the argument value for the queen's `id` must be different each time you invoke the function.

If you get stuck, check out the hints below.

## Watch Your Code Run

Time to practice using the debugger again. Put a breakpoint on the first line of code and step through your code, making sure you step into your new function to watch its logic.

For a review, you can watch a video that steps through the code and examines that values of variables as they change.

[<img src="../../book-1-queen-bee/chapters/images/video-play-icon.gif" height="75rem" />](https://watch.screencastify.com/v/MUKQNQMgqHOH3OFYnQOB)

## Hints

<details>
    <summary>Hint 1 - Parameters</summary>

First define three parameters. You may pick your own variable names if you wish, or use the well-named ones provided.

```js
const payTribute = (tributeId, tributeDescription, queenId) => {

}
```
</details>

<details>
    <summary>Hint 2 - Tribute object</summary>

First define two parameters. You may pick your own variable names if you wish.

```js
const payTribute = (tributeId, tributeDescription, queenId) => {
    const tribute = {
        id: tributeId,
        description: tributeDescription,
        queenId: queenId
    }

}
```
</details>

<details>
    <summary>Hint 3 - Add to chest</summary>

Use the `.push()` array method to add your tribute to the tribute chest.

```js
const payTribute = (tributeId, tributeDescription, queenId) => {
    const tribute = {
        id: tributeId,
        description: tributeDescription,
        queenId: queenId
    }

    tributeChest.push(tribute)
}
```
</details>

<details>
    <summary>Hint 4 - Paying Tribute</summary>

```js
payTribute(1, "Barrel of wine", 2)
payTribute(2, "Silk", 1)
payTribute(3, "Bushel of oranges", 3)
payTribute(4, "Ten gold coins", 1)
```
</details>

