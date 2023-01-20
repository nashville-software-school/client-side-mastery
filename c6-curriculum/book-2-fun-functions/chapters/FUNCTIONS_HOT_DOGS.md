# Converting Objects to Strings

In previous work, you often used the properties of objects to build sentences that you can display to a human using your software to make the data more readable.

```js
const dog = {
	name: "Ringer",
	age: 4,
	breed: "Cocker Spaniel"
}

console.log(`${dog.name} the ${dog.breed} is ${dog.age} years old.`)

> Ringer the Cocker Spaniel is 4 years old.
```

Now, imagine that you are writing a program for a doggy day care. The owner  wants to see a daily report of how many animals are currently being cared for at the facility. There could be dozens of dogs at any given time.

Since the owner doesn't want to see a bunch of JavaScript objects, you need to convert each one into a string format - specifically, an HTML representation of the dog object. A popular HTML element is a `<section>`.

You would then need write a function that defines how a minion will perform the task of converting a dog object into a dog HTML `<section>` representation.

When the task is complete, the minion will hand you the end result of its hard work. It **returns** something to you.

#### Reminder: When a function returns a value, you should store that value in a variable

```js
// Object representing Ringer
const dog = {
	name: "Ringer",
	age: 4,
	breed: "Cocker Spaniel"
}

// Define a function to convert the object to a string
const dogHTMLMaker = (dogObject) => {
	// Make some HTML to represent the dog
	const dogHTMLSection = `<section>${dogObject.name} the ${dogObject.breed} is ${dogObject.age} years old/section>`

	// Return the HTML
	return dogHTMLSection
}

// Invoke the function and give the minion what it needs to do its job.
const stringReturnedFromFunction = dogHTMLMaker(dog)

console.log(stringReturnedFromFunction)

> "<section>Ringer the Cocker Spaniel is 4 years old/section>"
```

Still doing the same thing that you have done in previous exercises - using interpolation to inject variables into strings - but this time, you put that task into a function. Now, anywhere in your "highly sophisticated" web application, you can convert a dog object into an HTML representation.

This doesn't have much meaning to you now, but during your time in class, you will be performing this task dozens and dozens of times.

Get data from storage `>` Object representation in application `>` Convert object to HTML `>` Put HTML in the browser

For now, you are just practicing the pattern without all the context that you will have in class.

## Practice: HTML Representation of a Computer

You have been given some starter code. It's an object representing an Apple Macbook Pro computer. You need to define a function that takes that object as input (_needs a parameter_), and outputs (_returns_) the following HTML representation of that computer.

Note that the `id` property of the computer is after the `--` in the section's id attribute.

```html
<section id="computer--1">
	<h1>Apple Macbook</h1>
	<div>Model: Pro</div>
	<div>Memory: 32 GB</div>
	<div>Hard drive space: 500 GB</div>
	<div>Processor speed: 2.4 Ghz</div>
</section>
```


```js
const computer = {
	id: 1,
	manufacturer: "Apple",
	make: "Macbook",
	model: "Pro",
	specs: {
		memory: 32,
		hardDrive: "500 GB",
		processor: 2.4
	}
}
```
