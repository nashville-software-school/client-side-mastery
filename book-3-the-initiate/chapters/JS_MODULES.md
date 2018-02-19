# Browserify Modules

Browserify allows you to build modules of JavaScript logic that export functionality that can be imported by any other module. Let's define a module that represents a car factory that has the unique ability of building a car of any make and model.

![browserify visualization](./images/browserify.png)

```js
/*
    Author: Steve Brownlee
    Name: carFactory.js
    Purpose: Produces a new car from a factory, using a generator
             for unique id values.
*/
const idGenerator = function* (startFrom = 0) {
    let newId = 1

    while (true) {
        yield startFrom + newId
        newId++
    }
}

const uuidMaker = idGenerator()

const carFactory = (make, model) => {
    const newCar = Object.create(null, {
        "id": {
            value: uuidMaker.next().value
        },
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
        value: function (carId) {
            return garage.find(car => car.id === carId)
        }
    },
    "inventory": {
        get: () => garage
    }
})

module.exports = garage
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

## Practice: Product Ordering

Your task is to simulate a product listing page like you would find on Etsy, Amazon, or Ebay. This application should implement the following features.

1. Display a product. Each product should have a title, short description, price, quantity, and an image.
1. Display the application information in a navigation bar at the top of the page.
    1. The name of the company - Betsy
    1. Three links: *Categories*, *Orders*, and *Log Out* (_these links won't actually do anything, you're just practicing making the navigation bar a component)
1. Display 3 product reviews beneath the product listing. You can use [hipster ipsum](https://hipsum.co/) for the reviews themselves.

Each of those features is a separate component, and you must write your code as modular as possible with Browserify.

1. One module contains the product information (i.e. productFactory)
1. One module displays the product information (i.e. product Controller)
1. One module builds the navigation bar
1. One module contains the review information (i.e. reviewFactory)
1. One module displays the review information (i.e. reviewController)

## Technical Requirements

1. While you are developing, make sure Grunt is verifying your JavaScript syntax every time you save a file.
1. Grunt should be compiling your modules each time you save a JavaScript file.
1. Grunt should be minifying your code each time you save a JavaScript file.
