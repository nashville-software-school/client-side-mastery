# Practice Logic in JavaScript

## Coins to Cash

```sh
mkdir -p ~/workspace/javascript/exercises/coins-to-cash && cd $_
echo '<html>
  <body>
    <script src="./coinsToCash.js"></script>
  </body>
</html>' > index.html
touch coinsToCash.js
code .
```

Define an object and store it in a variable named `piggyBank`. The object should have the following keys defined.

* quarters
* nickels
* dimes
* pennies

For each coin type, give yourself as many as you like.

```js
// I like pennies
const piggyBank = { pennies: 342 }
let dollarAmount = 0
```

Once you have given yourself a large stash of coins in your piggybank, look at each key and perform the appropriate math on the integer value to determine how much money you have in dollars. Store that value in a variable named `dollarAmount`.

When done, output the value to the browser console.

For example, if my piggy bank only held those pennies from above, when I type the variable name of `dolllarAmount` into the console, the output would be.

```sh
> dollarAmount
$3.42
```

## Cash to Coins

```sh
mkdir -p ~/workspace/javascript/exercises/cash-to-coins && cd $_
echo '<html>
  <body>
    <script src="./cashToCoins.js"></script>
  </body>
</html>' > index.html
touch cashToCoins.js
code .
```

Now do the reverse. Convert the dollar amount into the coins that make up that dollar amount. The final result is an object with the correct number of quarters, dimes, nickels, and pennies.

```js
const dollarAmount = 0.10
const piggyBank = {}

// Your magic code here

console.log(piggyBank)
```

That should produce the following output.

```js
{
  quarters: 0,
  dimes: 1,
  nickels: 0,
  pennies: 0
}
```

## Student Grades

```bash
mkdir -p ~/workspace/javascript/exercises/grades && cd $_
echo '<html>
  <body>
    <script src="./grades.js"></script>
  </body>
</html>' > index.html
touch grades.js
code .
```

### Requirements

Loop over an array of student grades (values from 50-100) and keep track of how many students get each grade in an object named `grades`.

* A score of 50-60 is an F
* A score of 61-70 is a D
* A score of 71-80 is a C
* A score of 81-90 is a B
* A score of 91-100 is an A

Start with array of random scores in your JavaScript

```js
const scores = [82, 71, 62, 95, 55, 98, 69, 72, 78, 84, 64, 58, 87, 60]
const grades = {} // You'll need to change this line of code

for (let i = 0; i < scores.length; i++) {
    /*
      If the score is greater than 90, increment grades.A by 1.

      You can use a series of `if/then` blocks, but you could
      also achieve this with a switch statement.
    */
}
```

Use `console.info()` to output the following criteria to the browser console.

1. How many of each grade? Accomplish this with a `for..in` loop.
1. What is the lowest score? Sort the array and find out.
1. What is the highest score?
1. Which grade had the most students achieve it?
    > Hint: Use an `if` statment, and a `currentGradeCount` variable, in your `for..in` loop to see if the current grade's value is higher than the last one. The `currentGradeCount` variable should be defined **before** the `for` loop.
1. Which grade had the fewest students achieve it?
