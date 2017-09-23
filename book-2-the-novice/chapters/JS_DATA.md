# Working with Data

As software developers, our job is to work with data. We need to take raw data, and present it to humans in a way that they can understand it, and make decisions with it. Raw data is completely unusable, because modern systems are built on what's called tabular data, or normalized data.

In essence, spreadsheets.

We've all seen a spreadsheet before. Columns represent the values for each type of data we're collecting, and the rows represent the collection of **all** the data for each segment of our observations. In the spreadsheet below, we see data about rainfall over a ten year span.

![](./images/tabulardata.png)

In JavaScript, we can't create spreadsheeets, but we can represent their structure using arrays and objects.

## Arrays

Each row of data in the spreadsheet above is an array. A collection of data values.

```js
const _1948 = [3.4, 3.8, 4.0, 3.9, 3.5, 3.6, 3.6]
const _1949 = [4.3, 4.7, 5.0, 5.3, 6.1, 6.2, 6.7]
const _1950 = [6.5, 6.4, 6.3, 5.8, 5.5, 5.4, 5.0]
const _1951 = [3.7, 3.4, 3.4, 3.1, 3.0, 3.2, 3.1]
const _1952 = [5.8, 6.4, 6.7, 7.4, 7.4, 7.3, 7.5]
```

Then we can create a new array to store each row so that we have one collection that we can reference to get the raw data.

```js
const RainfallDatabase = [_1948, _1949, _1950, _1951, _1952]
```

This kind of storage is useful if we want to use functions to filter, average, summarize, or mean the data.

```js
// Copy this entire code example into a Quokka project
const _1948 = [3.4, 3.8, 4.0, 3.9, 3.5, 3.6, 3.6]
const _1949 = [4.3, 4.7, 5.0, 5.3, 6.1, 6.2, 6.7]
const _1950 = [6.5, 6.4, 6.3, 5.8, 5.5, 5.4, 5.0]
const _1951 = [3.7, 3.4, 3.4, 3.1, 3.0, 3.2, 3.1]
const _1952 = [5.8, 6.4, 6.7, 7.4, 7.4, 7.3, 7.5]

const RainfallDatabase = [_1948, _1949, _1950, _1951, _1952]

// Find out how much total rain has fallen over last 10 years
const allRainfall = RainfallDatabase.reduce(
  function(currentSet, nextSet) {
    return currentSet.concat(nextSet)
  }
).reduce(
  function(total, monthlyRainfall) {
    return total + monthlyRainfall
  }
)

console.log(allRainfall)
```

But if we want to look at specific years, we don't have a way of identifying a single set of data, e.g. get all rainfall for 1952.

## Objects and Arrays for Data

Let's combine objects, which will allow us to provide key names in order to identify the data, and arrays, which will hold the data sets themselves.

```js
const RainfallDatabase = {
  "1948" : [3.4, 3.8, 4.0, 3.9, 3.5, 3.6, 3.6],
  "1949" : [4.3, 4.7, 5.0, 5.3, 6.1, 6.2, 6.7],
  "1950" : [6.5, 6.4, 6.3, 5.8, 5.5, 5.4, 5.0],
  "1951" : [3.7, 3.4, 3.4, 3.1, 3.0, 3.2, 3.1],
  "1952" : [5.8, 6.4, 6.7, 7.4, 7.4, 7.3, 7.5]
}
```

We still have all the data, and although the calculations needed to perform the total rainfall for all 10 years would have different syntax, we can still do it.

```js
// Copy this entire code example into a Quokka project
const RainfallDatabase = {
  "1948" : [3.4, 3.8, 4.0, 3.9, 3.5, 3.6, 3.6],
  "1949" : [4.3, 4.7, 5.0, 5.3, 6.1, 6.2, 6.7],
  "1950" : [6.5, 6.4, 6.3, 5.8, 5.5, 5.4, 5.0],
  "1951" : [3.7, 3.4, 3.4, 3.1, 3.0, 3.2, 3.1],
  "1952" : [5.8, 6.4, 6.7, 7.4, 7.4, 7.3, 7.5]
}

/*
  Don't worry about understanding this code, it is here for 
  display purposes only. That said, taking time to *try* to
  understand this code would be encouraged. Talk to the staff.
*/
yearlyRainData = [].concat
    .apply([], Object.values(RainfallDatabase))
    .reduce((sum, monthlyRainfall) => sum + monthlyRainfall)

console.log(yearlyRainData)
```

But now we can look at total rainfall per year since each set of data has a key (i.e. 1948, 1949, 1950, etc...).

```js
// Copy this entire code example into a Quokka project
const RainfallDatabase = {
  "1948" : [3.4, 3.8, 4.0, 3.9, 3.5, 3.6, 3.6],
  "1949" : [4.3, 4.7, 5.0, 5.3, 6.1, 6.2, 6.7],
  "1950" : [6.5, 6.4, 6.3, 5.8, 5.5, 5.4, 5.0],
  "1951" : [3.7, 3.4, 3.4, 3.1, 3.0, 3.2, 3.1],
  "1952" : [5.8, 6.4, 6.7, 7.4, 7.4, 7.3, 7.5]
}

for (let year in RainfallDatabase) {
  console.log(year, RainfallDatabase[year].reduce((s, r) => s + r))
}
```

# Videos to Watch

1. [Iterate Through an Array with a For Loop](https://www.youtube.com/watch?v=IIiZcu3JSsQ)
1. Watch all 6 episodes of [Advanced JavaScript - Introduction to Arrays](https://www.youtube.com/watch?v=UqWN8LXUldc&list=PLvZkOAgBYrsSMNbUiupQpQahsdyjaY6EM)
1. [Learn Javascript Programming #4: For Loops](https://youtu.be/BxFi7vVZx4s?t=1384)
1. [Javascript - How to Access Javascript Object Property Names Using A for in LOOP](https://www.youtube.com/watch?v=fDBuAnu0fvo)
1. [JavaScript Array Reduce in 4 Minutes](https://www.youtube.com/watch?v=tsIAyUQc8Ig)
1. [JavaScript Reduce Method - Explained with Many Examples](https://www.youtube.com/watch?v=7tAueErVUQU)
1. [.call() and .apply() - OOP in JavaScript #2](https://www.youtube.com/watch?v=qLhokqv0zxg)
1. [JavaScript Storage Interface sessionStorage localStorage Tutorial](https://www.youtube.com/watch?v=klLMeL7I4O0)
1. [How To Store A JavaScript Array in Local Storage](https://www.youtube.com/watch?v=RbfG7NLKDgQ)

# Practice: Home Inventory Data

To practice working with data, you are going to build a home inventory program. You will create a database of unique, or cool, items in your home, their location, and why they are special.

## Defining Data Collections

Each item in your home will be defined as an object with the following keys.

```js
// Example objects
const vintageInkwell = {
  "name": "Vintage Ink Well",
  "type": "crafts",
  "location": "Writing desk",
  "description": "I enjoy this inkwell because it belonged to my grandfather and holds enough ink to survive weeks of writing."
}

const writingDesk = {
  "name": "Shaker Writing Desk",
  "type": "furniture",
  "location": "Bedroom",
  "description": "This antique desk is special because I found and purchased it with my wife at an Ohio Amish auction."
}
```

Define at least 10 objects in your home, of at least 3 different types - i.e. crafts, electronics, furniture, etc.

### Arrays

Define arrays for each type that you have defined.

```js
// Example arrays
let crafts = []
let furniture = []
let electronics = []
```

### Arrays of Objects

Next, place each object that you have defined into the appropriate array.

```js
crafts.push(vintageInkwell)
furniture.push(writingDesk)
```

## The Database

Now that you have collections of data stored in discrete JavaScript arrays, it's time to define our database object which will contain all of the data.

```js
// Example database
let HomeInventory = {
  "furniture": furniture,
  "crafts": crafts,
  "electronics": electronics
}
```

### Unique Identifiers

## Local Storage

Now it's time to make your database persistent. Making the data persistent is important because if you just use the code you've written so far, and make changes to the data sets, each time you reload your application in the browser, all of your modifications are gone.

Putting your database in the browser's local storage allows you to make modifications over time and have the data always be up to date with all of your changes.

### JSON.stringify to Store the Data

The `JSON` object allows you to take an in-memory object, and convert it to a string representation of the object that can be saved in local storage. 

```js
const homeInventoryString = JSON.stringify(HomeInventory)
localStorage.setItem("homeInventory", homeInventoryString)
```

### JSON.parse to Read the Data

To get the value back out of local storage.

```js
const storedInventory = localStorage.getItem("homeInventory")
let HomeInventory = JSON.parse(storedInventory)

// or, in combined syntax
const storedInventory = JSON.parse(localStorage.getItem("homeInventory"))
```
