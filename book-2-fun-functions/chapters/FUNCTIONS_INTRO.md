## Functions

Functions are the heart and soul of JavaScript developers. Everything that a modern application does is done in a function. An application can have hundreds, possibly thousands, of tasks that it must perform to solve a problem or provide a service to humans. Each one of those tasks is in a function.

**You can think of a function as a container for code that completes a specific task.**

Functions are the first major hurdle of learning software development. One of the main reasons is that you need to understand the difference between a function definition and running the function.

It is not sequential, which is how most human consume and understand text and instructions. The key to understanding is seeing them used in many different contexts.

Beginners often ask questions like the following.

> "How many possible functions are there? Can I just memorize them all?
>
> "When do I need to write a function?

The answer to the first question is that it is the wrong question - because there are an infinite variety of functions. The reason for this is the answer to the second question. You write functions when you need some code to run to help solve your problem.

The key is understanding the problem, and then knowing the algorithm to solve it before you write any code.

## Anatomy of a Function

![](./images/function-anatomy.png)

Think of functions like minions that work for you. Each minion is designated a specific task that makes up your life.

* Buy groceries
* Pay bills
* Prepare meals
* Do math stuff when you don't want to (_which, if we're being honest, is most of the time_)
* Take the car to the repair shop

## Buying Grocery Task

Functions sometimes need to be given information in order to complete the task. Let's look at how you would write task code for a minion that buys groceries.

```js
const buyGroceries = () => {
	// Code to buy groceries with money
}
```

Since the minions can't read your mind, that means that you must provide it with the list of items you want it to purchase. Otherwise, the minion can't do its job.

In a JavaScript function, you specify that input of information with what's called a **_parameter_**. Parameters go inside the parenthesis before the arrow. In the code below, the **_arrayOfFoodToBuy_** variable is the parameter for the function.

It is important to note that parameters only work inside the function. The variable that you type inside those parenthesis cannot be used anywhere else in your code. You will be reminded of this fact throughout this series of exercises.

```js
const buyGroceries = (arrayOfFoodToBuy) => {
	// Code to buy groceries with money
	for (const food of arrayOfFoodToBuy) {
		console.log(`I bought ${food}`)
	}
}
```

What you have now is a definition of a task. The minion hasn't been told to perform the task yet, though. You need to tell the minion which food to buy, and then direct the minion to start the task.

This is called **_invoking_** a function. You type in the name of the task, and then put parenthesis after it. Inside the parenthesis, you provide the information that the minion needs. In this case, it needs an array of food items to buy.

```js
// Define the task for a minion
const buyGroceries = (arrayOfFoodToBuy) => {
	// Code to buy groceries with money
	for (const food of arrayOfFoodToBuy) {
		console.log(`I bought ${food}`)
	}
}

// Tell the minion to perform the task with specific information
const items = ["Milk", "Onions", "Ketchup"]
buyGroceries(items)
```

Once you have provided that instruction of invoking the function, the minion dutifully performs its task by following the instructions you provided inside the function.

## Another Parameter Example

Here is an example of a function with a parameter. A function can be invoked as many times as needed. If there is a parameter defined, then a value _(a.k.a argument)_ must be provided when the function runs.

```js
/*
    Define a function with a parameter. This means the
    function needs a value to be provided.
*/
const createFancyName = (name) => {
    return `Her Majesty, ${name}.`
}

const athena = createFancyName("Athena Perez") // Argument value is "Athena Perez"
console.log(athena)
// output: "Her Majesty, Athena Perez."


const charisse = createFancyName("Charisse Ford") // Argument value is "Charisse Ford"
console.log(charisse)
// output: "Her Majesty, Charisse Ford."


const jenna = createFancyName("Jenna Solis") // Argument value is "Jenna Solis"
console.log(jenna)
// output: "Her Majesty, Jenna Solis."
```

## Helpful Article

Many students in the past have found the [JavaScript Functions: Explain Like I'm Five](https://dev.to/sumusiriwardana/javascript-functions-explain-like-i-m-five-5009) article a helpful resource to understand the basics. Read it now. Read it tomorrow. Keep coming back to this entire chapter over and over again to keep reinforcing your vocabulary and basic concepts.

It's difficult to express how critically important it is for you to understand functions before you try any further concepts in this course like events, asynchronous code, modules, forms, and component-based applications. Functions are the foundation of all of those concepts.

## Practice: Filling the Tank

You have some starter code provided. It's a blank function that defines the task of filling your car up with gas. You can see that the minion will let you know that it filled up the car with gas, but **you** need to tell it how much gas you want put into the tank.

> #### `workspace/functions-intro/main.js`

```js
const fillGasTank = () => {
    console.log(`I filled the tank with ${gallons} of gas`)
}

fillGasTank(15)
```

Since the minion needs information from you to do its job, you need to define the parameter of `gallons` inside the parenthesis. When you do that successfully, run the code and the minion will let you know when it completes the task.

Now change the **_argument_** value. It is currently 15. Change it to any other number and see how the behavior of the function changes when the argument does.

#### Helpful hint

You can expand the hints below if you are stuck and don't know what to do. Make sure you try a few times and fail, and then talk with your teammates before looking at the hints.

<details>
    <summary>Hint: Function with parameter defined</summary>

    const fillGasTank = (gallons) => {
        if (gallons > 15) {

        }
    }

    fillGasTank(15)
</details>


## Avoid Spillage

Now modify the instructions for the task. Use an `if..else` block of code to prevent the function from filling up the gas tank of the value of the parameter is greater than 15. If it is greater, log the following message to the console.

"You cannot add this much gas to the tank"

#### Helpful hints

You can expand the hints below if you are stuck and don't know what to do. Make sure you try a few times and fail, and then talk with your teammates before looking at the hints.

<details>
    <summary>Hint: Starter code</summary>

    const fillGasTank = (gallons) => {
        if (gallons > 15) {

        }
    }

    fillGasTank(15)
</details>

If you're still stuck after using the starter code, you can peek at the final solution below.

<details>
    <summary>Hint: Final code</summary>

    const fillGasTank = (gallons) => {
        if (gallons > 15) {
            console.log(`You cannot add this much gas to the tank`)
        }
        else {
            console.log(`I filled the tank with ${gallons} of gas`)
        }
    }

    fillGasTank(15)
    fillGasTank(22)
</details>
