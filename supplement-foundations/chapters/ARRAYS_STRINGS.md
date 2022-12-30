# A String Within a String

In this exercise, you will use a `for..of` loop and conditional logic with `if/else` blocks again. You will also use a new tool to find a smaller string value within a bigger string value. You will also use the logical OR operator `||`, which is similar to the logical AND operator `&&` you have used in previous exercises.

#### Quick Incrementing Review

If a variable has a numeric value, you can increase the value by 1 by putting two plus signs after the variable.

```js
let pears = 4
pears++
console.log(pears)  // Will output 5
```

#### Logical Operators Review

You have used `&&` before to check if BOTH conditions are true in order to run some logic.

```js
const pineappleBelongsOnPizza = true
const theyWereOnABreak = true
const theOfficeIsFunny = false

if (pineappleBelongsOnPizza && theyWereOnABreak) {
	// Both variables are true, so this code runs
	console.log("Basic")
}

if (pineappleBelongsOnPizza && theOfficeIsFunny) {
	// Since both of the variables' values are not true, this won't run
	console.log("Bad")
}
```

The OR `||` operator is for when you want to check if EITHER of the conditions are true. They both don't need to be.

```js
const pineappleBelongsOnPizza = true
const theyWereOnABreak = true
const theOfficeIsFunny = false

if (pineappleBelongsOnPizza || theOfficeIsFunny) {
	// One of the variables' value is true, so this runs
	console.log("Basic")
}

if (theyWereOnABreak || theOfficeIsFunny) {
	// One of the variables' value is true, so this runs
	console.log("Bad")
}
```

## Includes a Smaller String

As a software developer, you will often need to determine if a string contains a certain sub-string. For example, if you have an array where people filled out feedback for a play they attended, you want to determine how many people felt a certain emotion. You would look for the words "happy", or "delight", or "disappointed", or "bored" anywhere in their feedback.

Their feedback won't have those words in any predictable location in the entire string.

#### Example Feedback

```js
const allFeedback = [
    "I don't regret coming, but I won't recommend it to a friend.",
	"I would say I was disappointed in the production.",
	"I was happy. The whole play had me smiling.",
	"What a delightful evening. Money well spent.",
	"Meh. It was fine.",
	"While there was nothing terrible, I was disappointed in the music.",
	"I was delighted by the fun music and the whimsical dances.",
	"I didn't hate it, but the last 20 minutes had me completely bored."
]
```

To find these keywords within the feedback, you can use the `String.includes()` method provided by JavaScript. Here is an example.

```js
let happyCustomers = 0
let unhappyCustomers = 0

for (const feedback of allFeedback) {
	/*
		If the current feedback includes the string of "delight" or the string
		of "happy", increase the value of the happyCustomers variable by 1
	*/
	if (feedback.includes("delight") || feedback.includes("happy")) {
		happyCustomers++
	}
	/*
		If the current feedback includes the string of "disappointed" or
		the string of "bored", increase the value of the unhappyCustomers
		variable by 1
	*/
	else if (feedback.includes("disappointed") || feedback.includes("bored")) {
		unhappyCustomers++
	}
}

console.log(`Happy customers: ${happyCustomers}
Unhappy customers: ${unhappyCustomers}
`)
```

## Exercise: How Do You Take Your Coffee?

### Setup

```sh
cd
cd workspace
mkdir coffee-effects
cd coffee-effects
touch main.js
code .
```

Once VS Code starts, open the `main.js` file copy the following code into the file.

```js
const coffees = [
    "light colombian roast", "hawaiian dark roast", "guatemalan blend medium roast",
    "dark madagascar blend", "jamaican dark blue", "jamaican medium roast",
    "salvador robusto light"
]

let output = ""

for (const coffee of coffees) {
    if (coffee.includes("light")) {
        output += `I'll have the ${} and drink it black`
    }
    else if (coffee.includes("medium")) {
        output += `I'll have the ${} and add cream only`
    }
    else if (coffee.includes("dark")) {
        output += `I'll have the ${} and add cream and sugar`
    }
    output += "\n"
}

console.log(output)
```

### Instructions

You start with an array of different coffee roasts around the world that you enjoy. Depending on the roast, you prepare the coffee differently. If it is a light roast, you drink it black. If it is a medium roast, you put cream in it. If it is a dark roast, you put cream and sugar in it.

Your job is to iterate the `coffees` array and output the following sentences for each coffee. Replace the `xxx` placeholder with the full name of the coffee.


### Run Your Code

In your terminal, run your code with the following command.

```sh
node main.js
```

When you run the code, your output should follow these rules. The `xxx` should be the name of the coffee.

For light roast, output

`"I'll have the xxx and drink it black"`

For medium roast, output

`"I'll have the xxx and add cream only"`

For dark roast, output

`"I'll have the xxx and add cream and sugar"`
