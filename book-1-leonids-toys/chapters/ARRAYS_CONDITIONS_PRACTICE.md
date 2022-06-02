## Conditions in Loops

You are going to practice your `for..of` loops some more. In this exercise, you are going to add a `if/else` code block inside the loop.

A quick example first.

```js
const wines = [ "red", "white", "white", "white", "red", "white", "red" ]
const wineCellar = []
const wineRefrigerator = []

for (const wine of wines) {
	if (wine === "red") {
		wineCellar.push(wine)
	}
	else {
		wineRefrigerator.push(wine)
	}
}

console.log(`
Contents of wine cellar: ${wineCellar}
Contents of wine refrigerator: ${wineRefrigerator}
`)
```

Feel free to copy that code into the editor and run it to see what happens.

In that example, you still iterate the entire array, but depending on the value of the `wine` variable, one of two different things could happen.

## Exercise: Sleep Mode

### Instructions

You decide to track how much your sleep affects your mood on a day-to-day basis. You notice that if you get less than 7 hours of sleep, you are grumpy all day long. If you get 7 or more hours of sleep, you are in a happy mood all day.

You start recording how many hours of sleep you get every night for two weeks. Based on the hours of sleep, you want to generate a readable report that shows you how many days you were grumpy and how many days you were happy.

There is an array provided to you in the starter code for your tracked hours of sleep. You need to complete the code using the above code as an example. One thing you will do differently is instead of putting the array in the output like the example does, you need to display the number of items in `grumpyHours` and the number of items in the `happyHours` arrays.

### Setup

```sh
cd
cd workspace
mkdir moods
cd moods
touch main.js
code .
```

Once VS Code starts, open the `main.js` file copy the following code into the file.

```js
const hours = [ 6, 9, 7, 8, 6, 6, 8, 5, 9, 8, 7, 6, 7, 7, 8, 6, 9 ]
const grumpyHours = []
const happyHours = []

console.log()
```

### Run Your Code

In your terminal, run your code with the following command.

```sh
node main.js
```

When you run the code, it should display the following.

```sh
I was grumpy on 6 days.
I was happy on 11 days.
```
