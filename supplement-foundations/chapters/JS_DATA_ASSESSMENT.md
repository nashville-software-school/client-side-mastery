# Your First Self-Assessment

### Boilerplate Files

Run the following command in your terminal. It doesn't matter what directory you are in. You can run it from anywhere.

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/nashville-software-school/course-bash-scripts/main/client/flower-assessment.sh)"
```

That script creates a `~/workspace/flowers` directory, with two files in it.

1. `main.js`
1. `test.js`

Now, open that directory in VS Code. Paste the following commands into your terminal.

```sh
cd ~/workspace/flowers

code .
```

You will be working exclusively in the `main.js` file. Do not modify any code in the `test.js` file. In fact, there is no reason to even open that file except for curiosity's sake.

## What You Need to Do

Open the `main.js` file in VS Code.

In there, you will see some starter code that...

1. Defines an array of flowers, filled with 9 objects.
1. Several functions, in which you will write your code, with the requirements written above each one.

Please do not remove the functions, or rename the functions. They are there for testing purposes. You just need to implement the correct code inside them.

The requirements are also below for convenience sake.

### Step 1: Find Inexpensive Flowers

In the first function named `inexpensiveFlowers`, you will write logic that populates the `filteredFlowers` array with only those flowers with a price less than 2.00 per flower.

### Step 2: Zoned Flowers

In the next function named `zoneFlowers`, you will write logic that populates the `filteredFlowers` array with only those flowers that grow in USDA zones 3 and 8.

### Step 3: Orange Flowers

In the next function named `orangeFlowers`, you will write logic that populates the `filteredFlowers` array with only those flowers that come in the color "Orange". Remember that JavaScript is case-sentitive.

```js
"orange" !== "Orange"
```

### Step 4: Flower HTML Representations

In the next function named `flowersAsHTML`, you will write logic produces one, large string that contains an `<article>` for each flower, a `<section>` for each flower's colors, and a `<div>` for each flower's USDA zones.

## Testing Your Code

When you believe you have code that works, go back to your terminal and type `node test.js`.

### All Tests Pass

If your code works you should see the following output.

```sh
*********************************
****   ALL TESTS SUCCEEDED   ****
*********************************

Congratulations on writing valid code for your first
self-assessment project.
```


### Errors in Your Logic or Syntax

If your code does not work, you will see a message that your code failed, with a brief message about why and possibly some helpful tips on how to fix it.

```sh
*************************
****   TEST FAILED   ****
*************************

The test code expected that 6 flowers should be
be the array of inexpensive flowers.

There were 0 items in the array.

Make sure that you have an `if` condition that
is checking the price property of each flower, and
that only flowers whose price is < 2.00 are being
added.
```

## Reviewing Your Code

If your code is successful, please review it with a member of the instruction team so that any questions you may have can be answered and a teammate can give your tips on how to deepen your knowledge.

If you cannot make the code work, make sure you do the three projects in this book of the course.

If you have already done all three projects, but still can't figure out how to make the test pass, sit with a member of the instruction team to help strengthen your knowledge and understanding of the concepts and get your code on the right track.

