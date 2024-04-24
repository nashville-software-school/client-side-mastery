# Your Majesty

## Learning Objectives

* You should be able to describe the purpose of a function in software
* You should be able to identify a parameter in a function definition
* You should be able to describe the purpose of a parameter
* You should be able to identify where a function is invoked
* You should be able to identify an argument
* You should be able to describe what purpose an argument serves
* You should be able to describe what a function returns


## Setup

In your terminal, run the following commands. These create a directory, and a file in that directory for the code you will write in this chapter.

```sh
cd ~/workspace
mkdir majesty
cd majesty
touch main.js
code .
```

## First Function

Here is an example of a function with a parameter. A function can be invoked as many times as needed. If there is a parameter defined, then a value _(a.k.a argument)_ must be provided when the function runs.

Open the `main.js` file in Visual Studio Code and paste the following function into it.

```js
/*
    Define a function with a single parameter. When the function
    is invoked, an argument is required.
*/
const hailTheQueen = (nameString) => {
    return `Hail Her Majesty, ${nameString}.`  // This function returns a string
}
```

This is a task that you can execute later. It doesn't execute when you define it.

### Invoking a Function

Now that you have a function defined, you can invoke it and pass a string to it as an argument. In this invocation, the argument is the string of "Athena Perez".

Copy pasta the follow code into the `main.js` file below the function definition.

```js
const athena = hailTheQueen("Athena Perez") // Argument value is "Athena Perez"
console.log(athena)
```

Next, go to your terminal and run the following command.

```sh
node main.js
```

And you should see the following string in the output.

```sh
"Hail Her Majesty, Athena Perez."
```

## Another Queen

Copy pasta the follow code into the `main.js` file below the function definition. In this invocation, the argument is the string of "Charisse Ford".

```js
const charisse = hailTheQueen("Charisse Ford") // Argument value is "Charisse Ford"
console.log(charisse)

const jenna = hailTheQueen("Jenna Solis") // Argument value is "Jenna Solis"
console.log(jenna)
```

Run the code again in this terminal and you will see the output of the function being invoked three times.

```sh
"Hail Her Majesty, Athena Perez."
"Hail Her Majesty, Charisse Ford."
"Hail Her Majesty, Jenna Solis."
```


## The Queens in Your Life

Now invoke the function a couple more times, passing in arguments representing the queens in your life. Make sure you `console.log()` the string that the function returns.

Make sure you run the following command in your terminal to execute your code.

```sh
node main.js
```
