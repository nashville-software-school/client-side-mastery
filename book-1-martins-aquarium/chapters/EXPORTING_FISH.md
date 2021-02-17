# Using the Fish Data

A data module in an application has the responsibility of maintaining the state of a particular type of data. In this application, the `FishData` module holds the state of each fish. Other modules in the application can request that state, and then use it for whatever they are responsible for.

Some common module responsibilities are:

1. Displaying HTML representations of state.
1. Filtering objects in state. For example, one view in the application could be to only show orange fish, or fish of a certain size, or fish found in a certain location.
1. Sorting objects in state by size, date harvested, etc.

## Vocabulary To Learn
* Array Method: `slice()`
* JavaScript module
* JavaScript import
* JavaScript `for of` loop



## Logging the Fish

You can start simple and use `console.log()` to display all the fish that are in application state. First, you need a function in the data module whose responsibility is to return the data.

Here's the simplest way to do that. The function below returns a reference to the fish collection. The function is exported so other modules can import it and use it.

> **`scripts/FishData.js`**

```js
// You already have this code. Don't add this
const fishCollection = //array of fish objects you already created

// This is new code. Add this.
export const getFish = () => {
    //we don't want to alter the original state, so
    //make a copy of it and then return it
    const fishData = fishCollection.slice();
    return fishData
}
```

Next, you import that function into the main module. Then you can invoke the function and store the fish collection in a variable that is scoped to the main module. Then just log each fish object to the developer console.

> **Note:** The imported function is wrapped in curly braces. This is needed for anything that is exported from a module that isn't the `default` export.

> **`scripts/main.js`**

```js
import { getFish } from './FishData.js'

const allTheFish = getFish()

for (const fish of allTheFish) {
    console.log(fish)
}
```
Now, you're ready to see if your fish print to the console. But, first you'll need to tell your browser to load and run your javascript. To do that, add a `<script>` tag to `index.html`, right above the closing `</body>` tag.

```js
<script type="module" src="scripts/main.js"></script>
``` 

Designating `main.js` as `type="module"` allows you to utilize the import and export syntax. Note that `main.js` is the only file we need to load via a `<script>` tag. The import statements will cause a daisy-chain effect of sorts, causing any other imported modules to also be loaded and evaluated by the browser.

## Next Steps

Once you get this working, move on to the next chapter to learn how to make modules that are responsible for defining components - one for the list of fish, and one for the individual fish. Once done, you will have an automated machine for generating the HTML representations of the fish.
