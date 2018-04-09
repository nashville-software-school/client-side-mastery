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

## Videos to Watch

1. [Iterate Through an Array with a For Loop](https://www.youtube.com/watch?v=IIiZcu3JSsQ)
1. Watch all 6 episodes of [Advanced JavaScript - Introduction to Arrays](https://www.youtube.com/watch?v=UqWN8LXUldc&list=PLvZkOAgBYrsSMNbUiupQpQahsdyjaY6EM)
1. [Learn Javascript Programming #4: For Loops](https://youtu.be/BxFi7vVZx4s?t=1384)
1. [Javascript - How to Access Javascript Object Property Names Using A for in LOOP](https://www.youtube.com/watch?v=fDBuAnu0fvo)
1. [JavaScript Array Reduce in 4 Minutes](https://www.youtube.com/watch?v=tsIAyUQc8Ig)
1. [JavaScript Reduce Method - Explained with Many Examples](https://www.youtube.com/watch?v=7tAueErVUQU)
1. **NSS Learning Team video** [JavaScript Array Methods](https://www.youtube.com/watch?v=y2LSiUm29hc&list=PLX0ucpUE_qIOUsxGNEPpP9yonb4zerVIC&index=2)
1. [.call() and .apply() - OOP in JavaScript #2](https://www.youtube.com/watch?v=qLhokqv0zxg)
1. [JavaScript Storage Interface sessionStorage localStorage Tutorial](https://www.youtube.com/watch?v=klLMeL7I4O0)
1. [How To Store A JavaScript Array in Local Storage](https://www.youtube.com/watch?v=RbfG7NLKDgQ)

## Practice: Home Inventory Data

To practice working with data, you are going to build a home inventory program. You will create a database of unique, or cool, items in your home, their location, and why they are special. By the end of this practice exercise, you will be able to store a JSON database in the local storage of your browser so that it can be retrieved, and modified again, at any time in the future.

### Setup

In a new directory of your choosing, create an HTML file with a name of `index.html`, and a JavaScript file with a name of `storage.js`. Use a `<script>` tag to load your JavaScript file in the HTML.

In the JavaScript file, you are going to build the database using the guide below.

### Define your Database

A database is a collection of data sets which are often related to each other. Start by defining the collections of data. This is how you will be defining databases in JavaScript until you learn how to use 3rd-party database systems later in the course.

You're going to be using a standard object as the database, so let's create that now.

```js
// Define the database as an object
const HomeInventoryDatabase = {}
```

Next, we're going to add some keys to our database object. One for each set of data. I want to store information about furniture, crafting items, and electronics that I have in my home.

```js
// Define the arrays (a.k.a. tables) in the database to store each type of items
HomeInventoryDatabase.furniture = []
HomeInventoryDatabase.crafts = []
HomeInventoryDatabase.electronics = []
```

With this data structure, `furniture` is going to be a set of similar data, likewise for `crafts` and `electronics`. We use these sets of data to store similar information together so that when we want to display information to a human, getting the information is fast and easy.

In professional database systems, each of those unique sets (i.e. furniture, crafts, and electronics) are called tables of data. A database is a collection of tables.

### Defining Data Items

Each item that you want to store in your home inventory database will be defined as a standard object. First, I'm going to define two data items. One will be stored in the `crafts` tables in my database, and the other will be stored in the `furniture` table.

```js
// The ink well is a craft data item
const vintageInkwell = {
  name: "Vintage Ink Well",
  location: "Writing desk",
  description: "I enjoy this inkwell because it belonged to my grandfather and holds enough ink to survive weeks of writing."
}

// The writing desk is a furniture data item
const writingDesk = {
  name: "Shaker Writing Desk",
  location: "Bedroom",
  description: "This antique desk is special because I found and purchased it with my wife at an Ohio Amish auction."
}
```

Your task is to define at least 10 data items to represent things that you have in your home.

### Adding Data Items to the Database

Next, place each object that you have defined into the appropriate database table. I'm going to add the two items I created above into the appropriate tables. Remember, I'm using the term *table* because we're building a database, but the collections are actually arrays, so I can use the `push()` method.

```js
HomeInventoryDatabase.crafts.push(vintageInkwell)
HomeInventoryDatabase.furniture.push(writingDesk)
```

## Local Storage

Now it's time to make your database persistent. Persistence is an important part of storing your data because you want any changes you make to your data to continue to exist in any processes that make those changes.

You're going to be using a mechanism in the browser called [Local Storage](https://developer.mozilla.org/en-US/docs/Web/API/Storage/LocalStorage) to save your data. Once your database is safely in local storage, you will be able to write more code in the future to add, remove, or edit items in the database and those changes will be permanent, no matter how many applications use it.

### JSON.stringify to Store the Data

As your applications become more complex and you start accepting user input, you will need to change your database and then immediately save it to local storage. It only takes two lines of code to accomplish this, but we want to keep our code DRY, and never write the same line of code twice.

Time to write a function.

```js
const saveDatabase = function (database) {

}
```

This function will perform the steps necessary to save the database to local storage.

Next, the `JSON.stringify` method allows you to take an in-memory object, and convert it to a string representation of the object that can be saved in local storage. This is important, because only strings can be saved in local storage.

```js
const saveDatabase = function (databaseObject, localStorageKey) {
    /*
        Convert the Object into a string.
    */
    const stringifiedDatabase = JSON.stringify(databaseObject)

    /*
        Create a key in local storage, and store the string
        version of your inventory database as the value
    */
    localStorage.setItem(localStorageKey, stringifiedDatabase)
}
```

### JSON.parse to Read the Data

To get the value back out of local storage so that it can be used in our application as an actual object again, we need to use the `localStorage.getItem()` method. We send in an argument value that is the name of the key we want to retrieve. Let's put these instructions in a function named `loadDatabase`.

```js
const loadDatabase = function (localStorageKey) {
    // Get the string version of the database
    const databaseString = localStorage.getItem(localStorageKey)

    // Use JSON.parse() to convert the string back into an object
    return JSON.parse(databaseString)
}
```

## Saving the Database

Now you can use those two functions to save, and load, your home inventory database from localStorage. The only one that you're going to use right now is the `saveDatabase` function.

Here's what your `database.js` file should look like.

```js
/*
    Initialize the database in memory as an object
*/
const HomeInventoryDatabase = {}

/*
    Initilize all of the tables (i.e. arrays) that you want to
    use in your database.
*/
HomeInventoryDatabase.furniture = []
HomeInventoryDatabase.crafts = []
HomeInventoryDatabase.electronics = []

/*
    Time to create some data that will inserted into the database
*/

// The ink well is a craft data item
const vintageInkwell = {
  name: "Vintage Ink Well",
  location: "Writing desk",
  description: "I enjoy this inkwell because it belonged to my grandfather and holds enough ink to survive weeks of writing."
}

// The writing desk is a furniture data item
const writingDesk = {
  name: "Shaker Writing Desk",
  location: "Bedroom",
  description: "This antique desk is special because I found and purchased it with my wife at an Ohio Amish auction."
}

// Add the data to the appropriate tables
HomeInventoryDatabase.crafts.push(vintageInkwell)
HomeInventoryDatabase.furniture.push(writingDesk)

// Persist the database to localStorage
saveDatabase(HomeInventoryDatabase, "HomeInventory")
```
