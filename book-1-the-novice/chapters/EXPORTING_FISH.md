# Using the Data Provider

A data provide module in an application has the responsibility of maintaining the state of a particular type of data. In this application, the `FishDataProvider` module holds the state of each fish. Other modules in the application can request that state for what they are responsible for.

Some common module reponsibilities are:

1. Displaying HTML representations of state.
1. Filtering objects in state. For example, one view in the application could be to only show orange fish, or fish of a certain size, or fish found in a certain location.
1. Sorting objects in state by size, date harvested, etc.

## Logging the Fish

You start simple and just use `console.log()` to display all the fish that are in application state. First, you need a function in the data provider whose responsibility is to allow other modules to access the state.

Here's the simplest way to do that. The function below just returns a reference to the fish collection. The function is exported so other modules can invoke it.

> **`scripts/FishDataProvider.js`**

```js
export const useFish = () => {
    return fishCollection
}
```

Next, you import that function in the main module. Note that the function is wrapped in curly braces. This is needed for anything that is exported from a module that isn't the `default` export.

Then you can invoke the function and store the fish collection in a variable that is scoped to this module. Then just out each fish object to the developer console.

> **`scripts/main.js`**

```js
import { useFish } from './FishDataProvider.js'

const allTheFish = useFish()

for (const fish of allTheFish) {
    console.log(fish)
}
```

## Iterating the Collection

Iterate array and console log the object, and then `toString()` method on the object
