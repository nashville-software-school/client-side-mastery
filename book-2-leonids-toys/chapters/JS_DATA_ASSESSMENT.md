# Your First Self-Assessment

### Boilerplate Files

Run the following command in your terminal. It doesn't matter what directory you are in. You can run it from anywhere.

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/nashville-software-school/client-side-mastery/master/book-2-leonids-toys/scripts/flower-assessment.sh)"
```

That script creates a `~/workspace/flowers` directory, with two files in it.

1. `flowers.js`
1. `test.js`

Now, open that directory in VS Code.

```sh
cd ~/workspace/flowers

code .
```

You will be working exclusively in the `flowers.js` file. Do not modify any code in the `test.js` file. In fact, there is no reason to even open that file except for curiosity's sake.

## What You Need to Do

Open the `flowers.js` file in VS Code.

In there, you will see the following boilerplate code.

1. A variable named `flowers` is declared with an initial value of an empty array.
1. An `addFlower()` function already defined for you.
1. A `findExpensiveFlowers()` function already defined for you.

Please do not remove the functions, or rename the functions. They are there for testing purposes. You just need to implement the correct code inside them.

### Step 1: Add Initial Flowers

Add two flower objects to the empty array. Each object should have the following properties.

1. An `id` property.
1. A `color` property.
1. A `species` property.
1. A `price` property.

The first flower should have an id of 1. It must represent a White Rose. It's price is 0.90.

The first flower should have an id of 2. It must represent a Red Tulip. It's price is 1.10.

### Step 2: Automate Adding New Flowers

Write code inside the `addFlower()` function beneath the comment that will add the value of the `flowerObject` parameter to the array of flowers.

### Step 3: Finding a Flower

In the `findExpensiveFlowers()` function, you will see some existing code. Your job is to write a `for..of` loop that iterates the `flowers` array.

Each flower object in the array has a `price` property. If that property's value is 1.00 or greater, it should be added to the empty array that is in the `findExpensiveFlowers()` function.

You should use the `push()` method to add the matching flowers to `expensiveFlowers` array.

## Testing Your Code

When you believe you have code that works, go back to your terminal and type `node test.js`.

If your code works you should see the following output.

```sh
Automated Test: Adding three new flowers added to your array.
Price #1 is 0.95
Price #2 is 0.40
Price #3 is 1.05


****************************
****   TEST SUCCEEDED   ****
****************************

Congratulations on writing valid code for your first
self-assessment project.

[
  { id: 2, color: 'Red', species: 'Tulip', price: 1.1 },
  { color: 'Blue', species: 'Orchid', price: 1.05, id: 5 }
]
```

If your code does not work, you will see the following output.

```sh
Test: Three new flowers added to array.
Price #1 is 0.95
Price #2 is 0.40
Price #3 is 1.05


*************************
****   TEST FAILED   ****
*************************

The test code expected that two flowers should be
in the expensiveFlowers array, but instead saw 0.

Make sure that you have an `if` condition that
is checking the price property of each flower, and
that only flowers whose price is >= 1.00 are being
added.

[]
```

## Reviewing Your Code

If your code is successful, please review it with a member of the instruction team.

If you cannot make the code work, make sure you do the three projects in this book of the course.

If you have already done all three projects, but still can't figure out how to make the test pass, sit with a member of the instruction team to help strengthen your knowledge and understanding of the concepts and get your code on the right track.

