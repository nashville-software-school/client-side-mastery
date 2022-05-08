## Arrays (a.k.a. collections of things)

In software, values don't only have to be assigned individually to variables.

```js
const flower1 = "Tulip"
const flower2 = "Rose"
const flower3 = "Daffodil"
const flower4 = "Daisy"
```

Since you have four strings that are all describing a similar type of thing - flowers - you can put those four strings in a collection called an array in JavaScript. You can spot an array in code by seeing some comma-delimited values separated by commas, which are all surrounded by two square brackets: the `[` and the `]` characters.

Here is an array of those four flowers.

```js
const flowers = [ "Tulip", "Rose", "Daffodil", "Daisy" ]
```

When you assign an array as a value to a variable, it is recommended that you name the variable as a plural form of what the items in the array are. Here are some more examples.

```js
const dogs = [ "Schnauzer", "Labrador Retriever", "Bulldog", "Poodle", "Collie" ]
const studentAges = [ 24, 54, 32, 27, 29, 40, 35 ]
const professions = [ "Mechanic", "Plumber", "Musician", "Engineer" ]
const expenses = [ 71.54, 401.03, 89.59, 145.62 ]
const months = [ "April", "July", "October", "December" ]
```

As a software developer, you will constantly be working with collections of related data stored in arrays like the ones above.

In this book of the course, you will learn how to access specific items in an array, how to add items to an array, and how to automate the process of targeting each item in the array - in sequence - and doing something with each item.

## Exercise: Your First Array

### Setup

```sh
cd
cd workspace
mkdir arrays-intro
cd arrays-intro
touch main.js
code .
```

Once VS Code starts, open the `main.js` file copy the following code into the file.

```js
const yellowFruit = "Banana"
const orangeFruit = "Orange"
const redFruit = "Apple"
const greenFruit = "Watermelon"
const blueFruit = "Blueberry"

const fruits = []

console.log(fruits)
```

### Instructions

Take the 5 values assigned to the 5 variables and store them in the provided blank array instead. When you are done, there should be no variables with string values left in your code - only the `fruits` variable.

### Run Your Code

In your terminal, run your code with the following command.

```sh
node main.js
```

You should see the following output in the terminal.

```sh
[ 'Banana', 'Orange', 'Apple', 'Watermelon', 'Blueberry' ]
```
