# Using the Fish Data

A data module in an application has the responsibility of maintaining the state of a particular type of data. In this application, the `FishData` module holds the state of each fish. Other modules in the application can request that state, and then use it for whatever they are responsible for.

Some common module responsibilities are:

1. Displaying HTML representations of state.
1. Filtering objects in state. For example, one view in the application could be to only show orange fish, or fish of a certain size, or fish found in a certain location.
1. Sorting objects in state by size, date harvested, etc.

## Vocabulary To Learn
* JavaScript module
* JavaScript import/export
* Array iteration (`for...of`)
* Function
* return


## Logging the Fish

You can start simple and use `console.log()` to display all the fish that are in application state. First, you need a function in the data module whose responsibility is to return the data.

Here's the simplest way to do that. The function below returns a reference to the fish collection. The function is exported so other modules can import it and use it.

> **`scripts/FishData.js`**

```js
// You already have this code. Don't add this
const fishCollection = //array of fish objects you already created

// This is new code. Add this.
export const getFish = () => {
    return fishCollection
}
```

Next, you import that function into the main module. Then you can invoke the function and store the fish collection in a variable that is scoped to the main module. Then log each fish object to the developer console utilizing an array loop.

> **Note:** The imported function is wrapped in curly braces. This is needed for anything that is exported from a module that isn't the `default` export.

> **`scripts/main.js`**

```js
import { getFish } from './FishData.js'

const allTheFish = getFish()

for (const fish of allTheFish) {
    console.log(fish)
}
```
Now, you're ready to see if the fish print to the console. First you'll need to tell the browser to load and run the javascript. To do that, add a `<script>` tag to `index.html`, right above the closing `</body>` tag.

```js
<script type="module" src="scripts/main.js"></script>
``` 

Designating `main.js` as `type="module"` allows us to utilize the import and export syntax. Note that `main.js` is the only file we need to load via a `<script>` tag. The import statements will cause a daisy-chain effect, causing any other imported modules to also be loaded and evaluated by the browser.

## Loops and Iteration
There are many different kinds of loops, but they all essentially do the same thing: they repeat an action some number of times. The various loop mechanisms offer different ways to determine the start and end points of the loop.
* [Reference](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Loops_and_iteration)

## Array Methods
Arrays are list-like objects. Array methods perform traversal and mutation operations. 
* [Reference](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array)


## Next Steps
Once you get this working, move on to the next chapter to learn how to make modules that are responsible for defining components - one for the list of fish, and one for the individual fish. Once done, you will have an automated machine for generating the HTML representations of the fish.
