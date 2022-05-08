## Review of Iteration

Things you used in this classroom.

* `for..of` loops
* Logical operators AND `&&` and OR `||`
* Arrays
* `if/else` code blocks for conditional logic
* `.push()` method for arrays
* `.length` property for arrays
* `.includes()` method for strings
* `+=` operator to add a any number to a variable's existing value
* `++` operator to add 1 to a variable's existing value
* Division `/` operator to find averages

That's a lot. We also want to remind you that it's expected for these concepts and skills to not be solidified just yet. You need a significant amount of practice to become proficient at determining when you need to use these tools when you write code.

Up next is going to be learning about JavaScript Objects. Before you go, we would like to present you with this optional challenge exercise. We won't even test your submission. It's up to you to work on this until you feel you have it right. If you want to just move on to Objects instead, that's perfectly fine.

## Optional Challenge: Where Do I Spend My Money?

Have you ever used online banking, or a service like Mint to track your monthly expenses? They can tell you in a concise report how much you spend on food, fuel, utilities, travel, clothing, and entertainment every month.

In the code editor, there is some sample code. It starts with an array filled with your monthly expenses. Each string in the array contains a `:` delimited string. On the left side of the colon is the vendor, and on the right is the amount of money you spent. Your job is to correctly categorize each expense and put the amount spent in the correct target array.

* If the vendor contains the sub-string of "Clothing" place the expense amount in the `clothing` array.
* If the vendor contains the sub-string of "Movie" place the expense amount in the `entertainment` array.
* If the vendor contains the sub-string of "Fuel" place the expense amount in the `fuel` array.
* If the vendor contains the sub-string of "Utility" place the expense amount in the `utilities` array.
* If the vendor contains the sub-string of "Groceries" or the sub-string of "Restaurant" place the expense amount in the `food` array.
* If the vendor contains the sub-string of "Lyft" or the sub-string of "Uber" place the expense amount in the `travel` array.
* If the expense amount is greater than 100.00, place the expense amount in the `largePurchases` array.

## Helpful Hints

### Turning a String into a Number

To convert a string into a number, you can use the following code.

```js
const accountBalance = "2551.30"
console.log(accountBalance)  // Output is "2551.30"
console.log(parseFloat(accountBalance))  // Output is 2551.30
```

### Logical Operators

You will need to use the logical OR `||` operator in some of your `if` conditions.
