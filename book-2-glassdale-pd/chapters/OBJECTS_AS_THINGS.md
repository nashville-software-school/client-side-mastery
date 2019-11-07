# Why Developers Use Objects

## Why are you Learning this?

Since objects are the core concept behind Object Oriented Programming - what you are learning here at NSS - you are going to learn how to use objects to provide value and context to data in your applications. As developers, we write software in order to automate processes that people already perform with real world things. Your code will represent those people and things as objects.

## Getting Started

Your job as a web application developer will often be to take a process that is done by an organization and build an application that does the same thing.

For example, a small company may use a colossal Excel spreadsheet to track all of their business expenses, and they email it around to each other, and eventually the accounting department gets it. They eventually realize that this process is rife with opportunities for human error, and the file becomes so large that it can't be emailed any more.

They hire you to build an application to track expenses.

Let's examine some of the things that you will be representing in code.

1. An employee who needs to track expenses
1. The expense itself (date, business, dollar amount, purpose, etc.)
1. An employee who needs to verify that it's a valid expense
1. An expense report

These things are objects we need to represent in code. Each object has properties that define it.

* An employee has a first name, last name, a role, and an account number
* The expense has a date, location, dollar amount, and purpose
* The expense report has a date, and a collection of expenses

So objects are things in the physical world that have properties that we want to represent in the application. A simple representation of an expense resource, in code, would look like this.

```js
const expense = {
    dateCreated: "01/01/2017",
    location: "Bob's Burgers",
    dollarAmount: "14.34",
    purpose: "Lunch with very important client",
    code: "1001A"
}
```

Here's a representation of a person who is an employee as a JavaScript object.

```js
const employee = {
    firstName: "Michael",
    lastName: "Tambornino",
    role: "Sales Rep",
    accountNumber: "1-8349058340"
}
```

Here's a representation of an expense report resource. It's a collection of expenses, with a timestamp of when the report was generated.

```js
const expenseReport = {
    dateCreated: "02/01/2017",
    expenses: [
        {
            amount: 14.34,
            dateCreated: "01/01/2017",
            vendor: "Bob's Burgers",
            code: "1001A"
        },
        {
            amount: 51.03,
            dateCreated: "01/03/2017",
            vendor: "Sunoco",
            code: "2213D"
        },
        {
            amount: 7.22,
            dateCreated: "01/07/2017",
            vendor: "Taco Bell",
            code: "1001A"
        }
    ]
}
```

## Object State

Ok, I mentioned "object state" above, and you might not understand what I mean by that. Stated as simply as possible, when you hear the words _object state_, it means that you want to know what the values of an object's properties are _**at this moment in time**_. That means an object's state can change, i.e.  property values can be reassigned.

```js
const employee = {
    firstName: "Michael",
    lastName: "Tambornino",
    role: "Sales Rep",
    accountNumber: "1-8349058340"
}
```

Those property values define the __*initial state*__ of this employee that we're representing in code. Now write the following line of code.

```js
employee.role = "Sales Manager"
```

You just changed the state of the JavaScript object that is representing Michael Tambornino.

## Object Behavior

Since you will be writing objects to represent people, things, and processes, then you will also need to define the behaviors of each. You do that by defining a function as the value of a key. These are called methods instead of properties.

They are just regular functions, but software developers call them methods within the context of an object because they are defining behaviors of a specific thing.

Here's an example.

```js
const rufusTheDog = {
    age: 4,                 // Property
    species: "Dalmatian",   // Property
    bark: function () {     // Method
        window.alert("WOOF!")
    }
}

rufusTheDog.bark()
```

You can also accept arguments that change the behavior of the method.

```js
const rufusTheDog = {
    age: 4,
    species: "Dalmatian",
    bark: function (something) {
        window.alert(`Rufus barks 'WOOF!' at ${something}`)
    }
}

rufusTheDog.bark("mailman")
rufusTheDog.bark("leaf")
rufusTheDog.bark("child")
```

## Introduction to `this`

In JavaScript, the keyword of `this` refers to the execution context - which is a whole can of worms that you're not going to get into right now. In the context of using objects in JavaScript, `this` is more straightforward, in that it will refer to the object instance itself.

Consider the following code.

```js
const rufusTheDog = {
    age: 4,
    species: "Dalmatian",
    contentsOfStomach: [],
    eat: function (item) {
        this.contentsOfStomach.push(item)
    },
    puke: function () {
        this.contentsOfStomach.length = 0
    },
    bark: function (something) {
        window.alert(`Rufus barks 'WOOF!' at ${something}`)
    }
}
```

The variable `rufusTheDog` contains an object, and two of the methods use the `this` keyword. In this content `this` _**is**_ `rufusTheDog`. Now you can invoke the eat method for Rufus a few times.

```js
rufusTheDog.eat("leftovers")
rufusTheDog.eat("treat")
rufusTheDog.eat("bunny")
```

Now that Rufus has eaten some food, you can inspect his belly.

```js
console.log(rufusTheDog.contentsOfStomach)

> [ 'leftovers', 'treat', 'bunny' ]​​​​​
```

Since `this === rufusTheDog`, why don't we just use `rufusTheDog` inside the object? In the code below, `this` has been replaced the the variable name.

```js
const rufusTheDog = {
    age: 4,
    species: "Dalmatian",
    contentsOfStomach: [],
    eat: function (item) {
        rufusTheDog.contentsOfStomach.push(item)
    },
    puke: function () {
        rufusTheDog.contentsOfStomach.length = 0
    },
    bark: function (something) {
        window.alert(`Rufus barks 'WOOF!' at ${something}`)
    }
}
```

While this works perfectly fine, imagine that you need to change the variable `rufusTheDog` to `myDogRufus`. Since humans are prone to making mistakes, a developer may miss the fact that the other variables need to be changed as well.

By using `this`, you never have to worry about changing multiple lines of code.

### Debugging Your Code

We can pause our code at any time to watch what is happening line by line and check the value of each variable at that moment. We do that by using the `debugger` keyword in our code where we want our program to pause. This helps us to pinpoint a specific behavior we were not expecting, and it can allow us to watch when a varibale's value changes in a way we did or didn't expect.

In your code, add the word `debugger` within the `eat()` method on the `rufusTheDog` object. When the program is run (by resfreshing your browser) the execution of your code will pause on that line and you can check each variable and step through your code line by line. Try it out!


## Videos to Watch

1. [What's an Object in JavaScript?](https://www.youtube.com/watch?v=8iXoWC9XcU8)
1. [Objects and Prototypes In-depth 02 - Objects Basics](https://www.youtube.com/watch?v=yHkPHteghSc&index=2&list=PLqq-6Pq4lTTaflXUL0v3TSm86nodn0c_u)
1. [Objects and Prototypes In-depth 03 - Creating Objects](https://www.youtube.com/watch?v=25wlojU2mHg&index=3&list=PLqq-6Pq4lTTaflXUL0v3TSm86nodn0c_u)
1. [Object Keys](https://www.youtube.com/watch?v=cEVnlKgySsg)
1. [Javascript - How to Access Javascript Object Property Names Using A `for in` LOOP](https://www.youtube.com/watch?v=fDBuAnu0fvo)
1. [Modular Javascript - Prototypal Pattern vs Classical OOP in JS](https://www.youtube.com/watch?v=doXpW5AD60Q)
1. [Object.create - Object Creation in JavaScript P6 - FunFunFunction #57](https://www.youtube.com/watch?v=CDFN1VatiJA)

## Practice: Represent your Pet

Create an object that represents your pet.

1. Name property with a string value.
1. Species property with a string value.
1. Nicknames property with an array value. Array contains strings.
1. Age property with an integer value

## Practice: Pet Sounds

Now that you have an object that represents your pet, it's time to add some behavior. Pick three behaviors that your pet has and add three kys to your pet object. Each key's value should be a function that logs to the console or displays a window alert. Your choice.

For example, if your pet is a dog, you could add a `bark` property, and the function would `window.alert("WOOF!")`.

Once you have define the properties, invoke each behavior. For example:

```js
angus.bark()
angus.whine()
angus.pant()
```

## Practice: My Pet "This"

1. Give your pet a new key named `favoriteToys` whose value is an empty array.
1. Now define another new key named `play` whose value is a function with a single parameter named `toy`.
1. The function should determine if your pet liked the toy, and if s/he does, then it should be added to the `favoriteToys` array using the `this` keyword _(see example above)_.

Here's an example. If your pet is a cat, then he likely only likes furry toys, so you could put an `if..then` condition in the `play()` method that checks if the word "fuzzy" is in the argument value. If it is, it gets added to the array.


## Practice: Fast Food Ordering

You need to write code to represent the process of ordering food at a fast food joint. Your restaurant is Bob's Burgers, and you have some starter code below. The object will have two behaviors that you must define.

1. The object should have a property named `orders` that is an array. You will need to define this.
1. Define a function to represent the behavior of placing an order. It should accept one argument named `meal`. This argument will be an object. There is starter code provided.
1. Define a function to represent the behavior of getting all orders. It should return the `order` property (hint: `this`). You will need to define this.
1. Each meal object should have three properties: `sandwichType`, `fries` (true or false), and `drinkSize`.


```js
const restaurant = {
    name: "Bob's Burgers",
    placeOrder: function () {
    }
}

const chickenComboMeal = {

}

// Place an order
restaurant.placeOrder()

// Invoke the function to return the list of all orders

// Output all orders to the console using console.table()
```

## Challenge: Political Campaign

> Challenges are optional exercises that you should attempt only if you've completed the practice exercises and understand the concepts.

You have volunteered your time to a local political candidate, Elizabeth Sanger, who wants to become a US representative in Congress for your district. Unfortunately, the team discovered that you're a software developer, so they have begged you to build an application that lets them track volunteers, and store information about Elizabeth and her campaign.

Your job is to define the different objects and arrays, their structure, and the corresponding properties for each, to represent the following information about Elizabeth's campaign.

1. Her congressional district (_you can use yours here_)
1. Her platform statements for the following issues.
    1. Taxes
    1. Jobs
    1. Infrastructure
    1. Health care
    1. Crime and enforcement
1. URL for donation form
1. Calendar of events
1. Volunteer information
    1. Name
    1. Address
    1. Email
    1. Phone number
    1. Availability
    1. What activities each one is willing to do (e.g. answering phone calls, taking polls, etc.)
1. Biography
1. Image gallery
    1. Head shot
    1. Picture of family
    1. Picture of constituents
1. Mission statement
1. URL for registering to vote

## Advanced Challenge

> Advanced challanges are intended to be difficult and the expectation is for you to use your imagination, and research skills to make your own decisions about which code should be written.

After you have defined all the objects for representing the data about Elizabeth's campaign, write a corresponding function for each one whose purpose is to change the state of the object. Then use your functions to modify the existing data.

Things to think about.

- Am I modifying an array? Then the function argument should be added to the target array with the `push()` method.
- Am I modifying an object? Then I should pass both the key name to be modified, and its corresponding value.

This challenge is for you to practice writing functions, so the more you can write, the better. It helps make neural connections in your brain at this point since you're still building your software vocabulary.

Example:

```js
function addToImageGallery (newImage) {
    ...
}

function changeBiography (newBiography) {
    ...
}

function changePlatform (topic, newPlatformStatement) {
    ...
}
```
