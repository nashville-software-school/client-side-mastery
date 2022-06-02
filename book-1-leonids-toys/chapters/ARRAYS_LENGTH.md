## Using the Length of an Array

Arrays have a `.length` property that tells you how many items are in the array.

## Rainfall

You can perform whatever task you want inside a for loop. In the previous exercises, you have used the `.push()` methods to build up a new array based on the items in another array. Here is an example of building up a total value.

A meterologist wants to determine what the total rainfall for a year was, and then calculate the average rainfall per month.

```js
const rainfallPerMonth = [ 5, 12, 18, 20, 22, 17, 29, 21, 20, 22, 30, 9 ]
let totalRainfall = 0  // Start at 0 and add to it in the loop

for (const rain of rainfallPerMonth) {
	totalRainfall += rain
}

// To find the average, you take the total and divide by the number of items
const averageRainfall = totalRainfall / rainfallPerMonth.length

console.log(`Total rainfall was ${totalRainfall} inches
Average rainfall was ${averageRainfall} inches
`)
```

Put that code into the code editor and run it to see the output.

## Exercise: Grocery Expenses

### Setup

```sh
cd
cd workspace
mkdir grocery-expenses
cd grocery-expenses
touch main.js
code .
```

Once VS Code starts, open the `main.js` file copy the following code into the file.

```js
const monthlyExpenses = [ 201.43, 189.22, 132.09,  238.85, 195.41 ]
let totalExpense = 0

for (const xxx of xxx) {
	// Add the current monthly cost to the value of totalExpense
}

// Calculate your average monthly food costs
const averageExpense =

// Make sure you use backticks for multi-line string output
console.log()
```

### Instructions

Update the code to calculate your average monthly grocery expenses for the five months' worth of expenses that have been recorded already in the array.

### Run Your Code

In your terminal, run your code with the following command.

```sh
node main.js
```

When you run the code, it should display the following.

```sh
On average, I spend 191.4 dollars on groceries per month.
So far this year, I have spent 957 dollars on groceries.
```
