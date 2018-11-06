# Daily Journal with Modules

## Setup

1. Create a `public` directory in the root directory of your Daily Journal application.
1. Move `index.html` from the `src` directory to the `public` directory.
1. Move your `src/styles` directory to `public/styles`.

When you're done, the only directories in `src` should be
1. `src/scripts`
1. `src/lib`

### Install Packages

Go to the `src/lib` directory and install all the required packages for using Browserify modules.

```sh
npm i grunt-browserify babelify @babel/preset-env @babel/core -D
```

Copy the `src/lib/grunt/browserify.js` file you created in the last chapter to your Daily Journal application.

```sh
cp  ~/workspace/javascript/browserify-boilerplate/src/lib/grunt/browserify.js ./grunt
```

 Update it to output a different compiled file name that is more appropriate for this application.

For example.

```js
dailyjournal: {
    src: ["../scripts/main.js"],
    dest: "../../public/dailyjournal.js"
}
```

Update your `src/lib/grunt/aliases.yaml` file to run the task.

```yaml
  - "browserify:dailyjournal"
```

## Instructions

> **Task**: Take existing JavaScript modules, and refactor as Browerify syntax modules with `require` and `modules.exports`.

Your `index.html` should have several script components at the bottom. Below is an example only, your files names do not need to match this example.

```html
<script src="scripts/entryComponent.js"></script>
<script src="scripts/filterEntries.js"></script>
<script src="scripts/entriesDOM.js"></script>
<script src="scripts/data.js"></script>
<script src="scripts/journal.js"></script>
```

Using Browserify, you need to make each of your files above into modules, and your HTML file should only have one script tag. It's important that you understand that once you switch to Browserify, you HTML file will **only have this one script tag**.

```html
<script src="bundle.js"></script>
```

Here's an example of what `main.js` could look like. Again, this is _just an example_. Your code does not need to look like this. You will build your own modules and give them names that make sense to you.

```js
import DataManager from "./data/dataManager"
import DOMManager from "./dom/domManager"

DataManager.getJournalEntries().then(DOMManager.renderEntries)
```

And your `dom/DOMManagerjs` component could look something like this.

```js
import EntryFactory from "./dom/entryComponentFactory"

const entriesContainer = document.querySelector(".entryLog")

class DOMManager {
    renderEntries (entries) {
        entriesContainer.textContent = ""

        for (entry of entries) {
            const entryComponent = EntryFactory.create(entry)
            entriesContainer.innerHTML += entryComponent
        }
    }
}

const entryDOMManager = new DOMManager()

export default entryDOMManager
```

> **Performance**: The `entriesContainer` variable is defined at the module level instead of in the `renderEntries()` function. Why? It is for performance. If it was defined in the `renderEntries()` function, then each time the method is called, the DOM would have to be queried to obtain a reference to the element with a class of `entryLog`.

> **Vocabulary**: The code above shows an example of the [Singleton Pattern](https://en.wikipedia.org/wiki/Singleton_pattern) since the module exports a single instance of the DOMManager class. Every other module will use that single instance.

> **Vocabulary**: The code above creates a [closure](https://medium.com/javascript-scene/master-the-javascript-interview-what-is-a-closure-b2f0d2152b36) around the `entriesContainer` module variable.