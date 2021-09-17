# Using the Database

A database module in an application has the responsibility of maintaining the state of a particular type of data. In this application, the `database.js` module holds the state of each fish. Other modules in the application can request that state, and then use it for whatever they are responsible for.

Some common module reponsibilities are:

1. Displaying HTML representations of state.
1. Filtering objects in state. For example, one view in the application could be to only show orange fish, or fish of a certain size, or fish found in a certain location.
1. Sorting objects in state by size, date harvested, etc.

## Let Other Modules Access State

The database module will maintain the state, but other modules need copies of the state to use for their purposes. Here's the simplest way to do that. The function below returns a copy of the fish array.

The function is exported so other modules can import it and use it.

Don't worry about understanding all of the syntax here. Just remember that it copies the objects in an array. Understanding comes with time and practice.

> **`workspace/martins-aquarium/scripts/database.js`**

```js
export const getFish = () => {
    return database.fish.map(fish => ({...fish}))
}
```

Next, you import that function into the main module. Then you can invoke the function and store the fish collection in a variable that is scoped to the main module. Then just log each fish object to the developer console.

> **Note:** The imported function is wrapped in curly braces. This is needed for anything that is exported from a module that isn't the `default` export.

> **`scripts/main.js`**

```js
import { getFish } from './database.js'

const allFish = getFish()

for (const fish of allFish) {
    console.log(fish)
}
```
Now, you're ready to see if your fish print to the console. But, first you'll need to tell your browser to load and run your javascript. To do that, add a `<script>` tag to `index.html`, right above the closing `<body>` tag.

```html
    <script type="module" src="./scripts/main.js"></script>
</body>
```

Designating `main.js` as `type="module"` allows you to utilize the import and export syntax. Note that `main.js` is the only file we need to load via a `<script>` tag. The import statements will cause a daisy-chain effect of sorts, causing any other imported modules to also be loaded and evaluated by the browser.

## Next Steps

Once you get this working, move on to the next chapter to learn how to make another module that is responsible for defining a component which will list the fish as HTML representations.
