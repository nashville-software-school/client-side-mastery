# Functions

Functions are blocks of code that do not run (execute) until instructed (invoked).  There are many different syntaxes for (ways to write) functions, but we will stick with just one throughout the course.  The most basic example of a function is:

```js
  const myFunction = () => {
    // Logic goes here.  This can be anything from a console log to complex looping and data transformations.  You could even invoke other functions!
    console.log("I am a function")
  }
```

Parts of this are new, but other parts should look familiar.  Let's break this up a bit.  

`const myFunction` - This is declaring a variable, naming the function.
`() =>` - This is basic syntax for a function.  You will see soon that the `()` are there for a reason.
`{` - The opening curly bracket indicates the start of the code that will execute when the function is invoked.
`console.log("I am a function")` - This is the logic (code) that will execute when the function is executed.
`}` - This is the closing bracket.  It ends the function.  Anything below this line is not part of the function.

Question: If I copy and paste the above function into my JavaScript and then execute the sheet, the console.log does not appear.  Why?

Answer:  In order for code in a function to run, the function must be invoked.

To invoke a function, simply type the name of the function followed by `()`.  In the above case, we would `myFunction()`

***

## Arguments

A function can bring in one or many variables to be used with it's logic. For example:

```js
const myFunctionArgument = (myArgument) => {
    console.log(`The value of my argument is: ${myArgument}`)
  }
```
`(myArgument)` - this is your argument.  The value of `myArgument` can change every time you invoke the function.  For example, we can now execute the function twice with 2 different values.

```js
myFunctionArgument(17)
myFunctionArgument("Taco")
```

Now, the function can be used for more than 1 thing, by passing in different values for `myArguement`.  This makes our code more efficient by letting us write less code.

## The return keyword

Functions are not just limited to just doing logic, but can also produce and out put.  Consider:

```Js
const Sum = (num1, num2) => {
  return num1 + num2
}

const five = sum(3,2)
// This will log 5
console.log(five)
```

## Functions can invoke other functions

```js
const AddOneToSum = (num1, num2) => {
  const sum = Sum(num1, num2)
  return sum + 1
}
const six = AddOneToSum(2,3)
console.log(six)
```

Let's look at what's happening in the above code. 

`const AddOneToSum = (num1, num2) => {` - this is defining a new function that takes 2 arguments. 
`const sum = Sum(num1, num2)` - defining the variable named `sum` as the result of invoking the function Sum() with the numbers that we passed into the function.  In the example, it's the numbers 2 and 3.

The variable `sum` ends up being 5 after the function `Sum` is invoked.  

`return sum + 1` - this adds another number to the sum and returns the answer.

Just like with the first function we looked at, these functions can be invoked with different arguments and provide different output.  

## Scope (as it relates to functions)

Scope references whether a variable or expression is accessible.  In other words, does this exist in the current part of the code I'm working in?  

Let's look at scope with an example:

```js
const cake = {progress: 'not started'} 

const mixCakeBatter = () => {
  // ingredientsNeeded is undefined outside of the function
  const ingredientsNeeded = ['flour', 'sugar', 'eggs', 'baking soda', 'baking powder', 'salt', 'milk']

  // the object cake is accessible here and can be updated.
  cake.progress = 'mixed'
}

console.log(ingredients) // this is not defined and will give an error
console.log(cake.progress) // this results in "not started" because we have not invoked the function yet

mixCakeBatter()

console.log(cake.progress) // this results in "mixed" because we invoked the function.

```

To Learn More: 

https://developer.mozilla.org/en-US/docs/Glossary/Scope

https://www.w3schools.com/js/js_scope.asp

https://blog.devgenius.io/javascript-scope-can-be-dicey-12a9f48bf328



Functions can do so much more!  We will continue to explore and use them for all kinds of things. 


