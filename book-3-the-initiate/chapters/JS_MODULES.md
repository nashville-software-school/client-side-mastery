# Browserify Modules

Browserify allows you to build modules of JavaScript logic that export functionality that can be imported by any other module. When building a modular application, consider that each module is an independent utility that does one specific thing. When another module needs the functionality of one of the other utilities, they can import it.

![browserify visualization](./images/browserify.png)

Let's look at an example.

First, we'll define a module that represents a car factory that has the unique ability of building a car of any make and model.


```js
/*
    Author: Steve Brownlee
    Name: carFactory.js
    Purpose: Produces a new car from a factory
*/

const carFactory = (make, model) => {
    const newCar = Object.create(null, {
        "make": {
            value: make,
            enumerable: true
        },
        "model": {
            value: model,
            enumerable: true
        }
    })

    return newCar
}

module.exports = carFactory
```

In our `main.js`, which is the standard beginning module of an application using Browserify, we can import the car factory.

```js
/*
    Author: Steve Brownlee
    Name: main.js
    Purpose: Entry point of our application
*/
const car = require("./carFactory")

const garage = []

const mustang = car("Ford", "Mustang")
const accord = car("Honda", "Accord")

garage.push(mustang)
garage.push(accord)

console.log(garage);
```

We can take this a step further and make the car garage it's own module.

```js
/*
    Author: Steve Brownlee
    Name: garage.js
    Purpose: To store car instances
*/
const garage = []

const garageSupervisor = Object.create(null, {
    "store": {
        value: function (car) {
            garage.push(car)
        }
    },
    "retrieve": {
        value: function (carToFind) {
            return garage.find(car => car.make === carToFind.make && car.model === carToFind.model)
        }
    },
    "inventory": {
        get: () => garage
    }
})

module.exports = garageSupervisor
```

Now let's import this module into our main module and use its methods.

```js
/*
    Author: Steve Brownlee
    Name: main.js
    Purpose: Entry point of our application
*/
const car = require("./carFactory")
const garage = require("./garage")

const mustang = car("Ford", "Mustang")
const accord = car("Honda", "Accord")

garage.store(mustang)
garage.store(accord)

console.log(garage.inventory)
```

## Plugins You Need to Install

1. [grunt-eslint](https://github.com/sindresorhus/grunt-eslint): For verifying your JavaScript against community standards, and checking sytax.

    `npm install grunt-eslint --save-dev`
1. [grunt-contrib-uglify](https://www.npmjs.com/package/grunt-contrib-uglify): For minifying your code to make HTTP calls faster.

    `npm install git://github.com/gruntjs/grunt-contrib-uglify.git#harmony --save-dev`

1. [grunt-browserify](https://www.npmjs.com/package/grunt-browserify): For compiling your modules into a single application

    `npm install grunt-browserify --save-dev`

## Practice: Contact List

Build four components:

1. A **ContactCollection** component that loads existing contacts from storage, and saves new ones. Each new contact should have an auto-generated identifier.
1. A **Contact** component that displays a person's name, phone number, and address.
1. A **ContactList** component that displays all contacts. It should import the **Contact** component and the **ContactCollection** component.
1. A **ContactForm** component that, when filled out and a submit button is pressed, adds a new contact to storage. It should import the **ContactCollection** component.

In `main.js`, import the **ContactList** component and the **ContactForm** component.

The user should see the contact form at the top of the view, and the list of contacts underneath it.

> **Bonus:** Are there any other modules that could be made? Do any modules have more than one possible responsibility? Perhaps something that is a general utility function.

## Practice: Product Ordering

Your task is to simulate a product listing page like you would find on Etsy, Amazon, or Ebay. This application should implement the following features.

1. Display an individual product component. Each product should have a title, short description, price, quantity, and an image.
1. Display the application information in a navigation bar at the top of the page.
    1. The name of the company - Betsy
    1. Three links: *Categories*, *Orders*, and *Log Out* (_these links won't actually do anything, you're just practicing making the navigation bar a component)
1. Display a review list component that contains a maximum of 3 product review components beneath a product. You can use [hipster ipsum](https://hipsum.co/) for the reviews themselves.

### Component/Module Map

![dependency map](./images/product-exercise-dependecies.png)

## Technical Requirements

1. While you are developing, make sure Grunt is verifying your JavaScript syntax every time you save a file.
1. Grunt should be compiling your modules each time you save a JavaScript file.
1. Grunt should be minifying your code each time you save a JavaScript file.
