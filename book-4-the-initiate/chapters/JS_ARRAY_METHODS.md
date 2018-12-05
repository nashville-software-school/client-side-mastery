# Shaping Data with Array Methods

## find

This will be one of the most useful methods for you during the client side course. Imagine the following scenario.

You have an array of objects that represent businesses. Each business name is unique. The `find()` array method will iterate the array until it finds a match, and then return that matched object.

```js
const businesses = [
  {
    "index": 1,
    "company": "KAGE",
    "phone": "+1 (971) 427-3003",
    "address": "888 Kansas Place, Riceville, West Virginia, 3628"
  },
  {
    "index": 2,
    "company": "DUFLEX",
    "phone": "+1 (834) 503-3186",
    "address": "856 Kensington Street, Kieler, Missouri, 1635"
  },
  {
    "index": 3,
    "company": "UPLINX",
    "phone": "+1 (921) 443-2136",
    "address": "255 Duffield Street, Maury, Marshall Islands, 4407"
  },
  {
    "index": 4,
    "company": "PORTALINE",
    "phone": "+1 (889) 454-3246",
    "address": "771 Atlantic Avenue, Waumandee, Indiana, 1297"
  },
  {
    "index": 5,
    "company": "XUMONK",
    "phone": "+1 (948) 419-3737",
    "address": "778 Montague Street, Derwood, North Dakota, 764"
  }
]

// Find business by its name
const targetBusiness = businesses.find(business => business.name === "UPLINX")

// Find business by its id
const targetBusiness = businesses.find(business => business.id === 2)

// Find business by its state
const targetBusiness = businesses.find(business => business.address.includes("Missouri"))
```

## forEach

This is a straight up replacement for a `for` loop. However, where a `for` loop simply iterates _n_ number of times, the `forEach()` method is an operation on an array.

```js
/*
    A `for` loop is not an operation on an array at all,
    even if we use an array's length to determine how many
    times the loop will iterate.
*/
const animals = ["cow", "chicken", "pig", "fish"]

// This `for` loop iterates 4 times
for (let i = 0; i < animals.length; i++) {

    // The logic inside the for block has NOTHING to do with
    // the animals array at all.
    console.log(`This is iteration ${i}`)

}
```

```js
const animals = ["cow", "chicken", "pig", "fish"]

/*
    A function whose purpose is to cook an animal and
    return the processed result
*/
const cookIt = function (animal) {
    switch (animal) {
        case "cow":
            console.log("steak");
            break;
        case "chicken":
            console.log("drumstick");
            break;
        case "pig":
            console.log("bacon");
            break;
        case "fish":
            console.log("sushi");
            break;
    }
}

// Execute the cookIt function for each item in the array
animals.forEach(cookIt)
```

## map

The `map()` method will also iterate over each item in an array and run the logic of the specific function each time. The difference is that running `map()` creates a new function. You never want to modify your raw data in your database, so when you need to transform it, you need a **new** array so your source remains unchanged.

```js
const rawIngredients = ["cow", "potato", "chicken", "corn"]

/*
    You will often see the processing function for these
    methods defined anonymously, rather than defined
    separately as it was in the previous example.
*/
const cookedIngredients = rawIngredients.map(function (ingredient) {
    switch (ingredient) {
        case "cow":
            return "hamburger"
            break
        case "potato":
            return "fries"
            break
        case "chicken":
            return "drumstick"
            break
        case "corn":
            return "popcorn"
            break
    }
})

console.log(cookedIngredients)
> ​​​​​[ 'hamburger', 'fries', 'drumstick', 'popcorn' ]​​​​​

console.log(rawIngredients)
> ['cow', 'potato', 'chicken', 'corn'] // Source data unchanged
```

## filter

The `filter()` method is when you want to weed out some of the source data that doesn't meet the criteria for a solution.

```js
const rawIngredients = [
    { "name": "cow", "type": "meat" },
    { "name": "potato", "type": "vegetable" },
    { "name": "chicken", "type": "meat" },
    { "name": "corn", "type": "vegetable" }
]

/*
    You can also use the new ES6+ function declaration
    syntax for your anonymous function.
*/
const vegetarianIngredients = rawIngredients.filter(ingredient => {
    const isVegetarian = (ingredient.type === "vegetable")
    return isVegetarian
})

console.log(vegetarianIngredients)
> ​​​​​[ { name: 'potato', type: 'vegetable' },​​​​​
  ​​​​​  { name: 'corn', type: 'vegetable' } ]​​​​​

console.log(rawIngredients)
> [ { 'name': 'cow', 'type': 'meat' },
    { 'name': 'potato', 'type': 'vegetable' },
    { 'name': 'chicken', 'type': 'meat' },
    { 'name': 'corn', 'type': 'vegetable' }
] // Source data unchanged
```

## reduce

The `reduce()` method is for aggregating the data into a single value.

```js
const monthlyRainfall = [23, 32, 27, 20, 20, 31, 33, 26, 19, 12]

// ES6+ syntax
const totalRainfall = monthlyRainfall.reduce(
    (currentTotal, next) => currentTotal + next
)

// Traditional syntax
const totalRainfall = monthlyRainfall.reduce(
    function (currentTotal, next) {
        return currentTotal + next
    }
)
```

## Other Helpful Methods

* [reverse](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/reverse) - Reverses the order of items in the array
* [every](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/every) - Determine if every item in an array passes a condition
* [some](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/some) - Determine if some of the items in an array passes a condition

[Mozilla Developer Network documentation](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array) on every method available on arrays.

## For the Visual Learners

![emojis](./images/array_methods.png)

## Videos to Watch

* [6 JavaScript Native Array Functions in 5 Minutes](https://www.youtube.com/watch?v=9ar5ZpBW7NE)
* [Common Array Methods - Beau teaches JavaScript](https://www.youtube.com/watch?v=MeZVVxLn26E)

## Practice: Solar System

### Setup

These commands are a helpful quick start. You may choose to ignore them completely and create your own directory structure. If you choose to use this recommendation, just copy the commands below and paste. It doesn't matter what directory you are currently in.

```bash
mkdir -p ~/workspace/javascript/exercises/array-methods && cd $_
touch index.html
touch array-methods.js
```

### Requirements

1. Copy the code below into the JavaScript file, and follow the instructions in the comments.

```javascript
const planets = ["mercury", "venus", "earth", "mars", "jupiter", "saturn", "uranus", "neptune"]

/*
    Use the forEach method to add the name of each planet
    to a section element in your HTML with an id of "planets".
    Use string templates to construct the DOM elements.
*/
const planetEl = document.getElementById("planets")

/*
    Use the map method to create a new array where the
    first letter of each planet is capitalized. Use the
    `toUpperCase()` method on strings.

    https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/toUpperCase
*/


/*
    Use the filter method to create a new array that
    contains planets with the letter 'e'. Use the `includes()`
    method on strings.

    https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/includes
*/


// Use the reduce method to create a sentence from the words in the following array
const words = ["The", "early", "bird", "might", "get", "the", "worm", "but", "the", "second", "mouse", "gets", "the", "cheese"]
```

## More Practice: Spam, Spam, Spam, Spam
Learning Objective: practice accessing data within an array of objects

You have been tasked with building a list of email addresses of all of our customer's contacts so we can spam them with an email about Miffles the Vampire Weiner Dog.

1. Create a new project in `workspace`.
1. In your JavaScript file, paste the [customers array](./data/customers.js) that contains the emails we need to retrieve.

From that array, extract just the customers' contact email addresses and store them in a new array. (Hint: you may want to use `forEach()` and/or `concat()` or any other array methods you have learned.)


## Challenge: Chaining Methods

### Setup

These commands are a helpful quick start. You may choose to ignore them completely and create your own directory structure. If you choose to use this recommendation, just copy the commands below and paste. It doesn't matter what directory you are currently in.

```bash
mkdir -p ~/workspace/exercises/javascript/chaining-methods && cd $_
touch index.html
touch chaining.js
```

### Requirements

Using one single line of JavaScript code, complete the following tasks on the array of integers below.

1. Sort the numbers in descending order (10, 9, 8, 7, etc).
1. Remove any integers greater than 19.
1. Multiply each remaining number by 1.5 and then subtract 1.
1. Then output (either in the DOM or the console) the sum of all the resulting numbers.

```js
const integers = [13, 25, 6, 3, 11, 2, 18, 7, 21, 1, 29, 20, 12, 8];
```

## Advanced Challenge: Car Dealership

Copy the JSON from [cars.json](./data/cars.json) and assign it to a variable in a new application. This data holds sales information for a car dealership. Your job is to produce the following reports for the dealership based on their total 2017 sales.

1. Total profit for 2017
1. In which month did they sell the most cars?
1. Which salesperson sold the most cars?
1. Which salesperson made the most profit?
1. Which model was the most popular?
1. Which bank provided the most loans to our customers?
