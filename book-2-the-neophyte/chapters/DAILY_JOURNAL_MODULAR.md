# Daily Journal

In this stage of the application, you are going to modularize your JavaScript code. You will create several JavaScript files, which each have a single responsibility.
<!-- Then you will need to include them in your `index.html` in the correct order. -->

My modularizing your code, you achieve two main goals.

1. When changes need to be made to your application, it makes it far easier to find the code that needs to change. This benefit comes at the expense of having more files to manage, and open, during development.
1. It nearly eliminates the possibility of merge conflicts. When working in a team, each developer takes responsibility for making a very specific change. By modularizing your code, the likelihood that two developers will need to be working on the same file, at the same time, is minimized.

## Single Responsibility Modules

Create three new files in your `src/scripts` directory.

1. `apiManager.js` - Move the code that deals with getting the data into this file.
1. `DOMPrinter.js` - Move the code that is responsible for modifying the DOM into this file.
1. `singleJournalEntry.js` - Move the code that is responsible for creating the journal entry HTML component into this file.

> **Tip:** Once this is done, your `journal.js` file should be completely empty.

<!-- Now refactor your `index.html` file to include all of your JavaScript files. -->

Now refactor the script element in your `index.html` to include the attribute: `type="module"`

## Refactor

Replace the code in `src/scripts/apiManager.js` with the code below. Since you moved the code to this file, you should consider this file an independent, helper module now. It should not call any functions, just define them. The responsbility for how the application should operate should reside in `src/scripts/journal.js` now.

The code in the `data.js` module, then, should only define functionality for **how** to access the data, but should not immediately run it.

### API Manager Module

```js
const APIManager = {
    getJournalEntries () {
        return fetch("http://localhost:3000/entries")
            .then(response => response.json())
    }
}

export default APIManager
```

You may have noticed some strange syntax in the object above. It's ok if you didn't. Take a closer look and you will see that the `getJournalEntries` method on the object was defined with the traditional `key: value` syntax. Here's the same object using that syntax.

```js
const API = {
    getJournalEntries: function () {
        return fetch("http://localhost:3000/entries")
            .then(response => response.json())
    }
}
export default  API
```

Both are valid, but the first example saves a few characters.

### Main Application Logic

Now that you've defined an object whose responsibility is to access the data, you need to write code in `src/scripts/journal.js` to use that object and get the data. Once you know you have the data, pass it along to the `renderJournalEntries` function that now lives in `src/scripts/DOMPrinter.js`.

`DOMPrinter.js:`
```js
import APIManager from './APIManager.js'

const DomPrinter = {
// DOM printer methods go here

}

export default APIManager
```


Put this comment in `src/scripts/journal.js`. Then write the main logic that uses the code in the helper modules.

```js
import DOMPrinter from './DOMPrinter.js'


/*
    Main application logic that uses the functions and objects
    defined in the other JavaScript files.

    Change the fake variable names below to what they should be
    to get the data and display it.
*/
objectWithGetterMethod.methodToGetData().then(functionThatRendersData)
```

## Challenge

Change the code in both `src/scripts/DOMPrinter.js` and `src/scripts/singleJournalEntry.js` so that the functions in each one becomes a method on an object, just like the code for `API` does above.

When you are done, there should be three objects defined in your application.

1. One object that has a method for API access
1. One object that has a method for building a component
1. One object that has a method rendering the components to the DOM

> **Refactor:** Once the objects are defined, refactor your code to use the methods on those objects where needed.
