# Objects

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

Ok, I mentioned "object state" above, and you might not understand what I mean by that. Stated as simply as possible, when you hear the words _object state_, it means that you want to know what the values of an object's properties are _**at this moment in time**_. That means an object's state can change, i.e. a property's value can be reassigned.

```js
const employee = {
    firstName: "Michael",
    lastName: "Tambornino",
    role: "Sales Rep",
    accountNumber: "1-8349058340"
}
```

Those property values define the __*initial state*__ of this employee that we're representing in code.

```js
employee.role = "Sales Manager"
```

I just changed the state of the JavaScript object that is representing Michael Tambornino.

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

## Practice: Accessing Property Values

Given the following object...

```js
const beatles = {
    albums: ["Abbey Road", "Sgt Peppers Lonely Heart's Club Band", "Revolver", "Magical Mystery Tour", "Something New"],
    history: {
        formed: 1960,
        disbanded: 1970
    },
    members: [
        {
            name: "George Harrison",
            birth: 1943,
            death: 2001
        },
        {
            name: "Paul McCartney",
            birth: 1942,
            death: null
        },
        {
            name: "John Lennon",
            birth: 1940,
            death: 1980
        },
        {
            name: "Ringo Starr",
            birth: 1940,
            death: null
        }
    ]
}
```

Output the following value to the console.

```text
Paul McCartney was in the Beatles from 1960 to 1970. He was born in 1942. He contributed heavily to the Magical Myster Tour Album.
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
