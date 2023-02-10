## Adding Items to an Array

In this chapter, you will learn how how to add items to an array.

## Review of String Interpolation

Before you read this chapter, this is a quick reminder about string interpolation. That weird word that means that you can inject a variable's value into a string.

#### Example

```js
const giveUp = "give you up"
const letDown = "let you down"

console.log(`Never gonna ${giveUp}, never gonna ${letDown}`)
```

Output is "Never gonna give you up, never gonna let you down"

## Array Push

There is a classic hip hop song from the 1980's that I always think of when I want to add a new value to an array. Arrays have a method on them named `.push()`. That method lets you add a new value as the last item in the array.

You will start off with this simple example where you have three pieces of paper that need to be copied. The original pieces of paper should not be touched. Therefore, you will end up with a new collection - or array - that will contain the copies.

Here's how you can add a new piece of paper to the collection that needs to be copies.

```js
const originals = [ "Original paper 1", "Original paper 2", "Original paper 3" ]

originals.push("Original paper 4")

console.log(originals)
```

This is the new contents of the array

```js
[ "Original paper 1", "Original paper 2", "Original paper 3", "Original paper 4"]
```

## Making Copies

Now it is time to combine the `for` loop with the `push()` method on an array to make a copy for each item in the `originals` array.

```js
const originals = [ "Original paper 1", "Original paper 2", "Original paper 3" ]
const copies = []  // Blank array that will contain the copies

for (const paper of originals) {
	const copy = `Copy of ${paper}`
	copies.push(copy)
}

console.log(copies)
```

## Exercise: Making Mugs

### Setup

```sh
cd
cd workspace
mkdir making-mugs
cd making-mugs
touch main.js
code .
```

Once VS Code starts, open the `main.js` file copy the following code into the file.

```js
const clay = [ "Clay", "Clay", "Clay", "Clay" ]
const toFireInKiln = []

for () {
   const mug = `${} coffee mug`
}

console.log(toFireInKiln)
```

### Instructions

Your task is to iterate the array containing the chunks of clay and after your code is done, the `toFireInKiln` array should contain the string value "Clay coffee mug" for every string in the `clay` array.

### Run Your Code

In your terminal, run your code with the following command.

```sh
node main.js
```

When you run the code, it should display the following.

```sh
[ "Clay coffee mug", "Clay coffee mug", "Clay coffee mug", "Clay coffee mug" ]
```
