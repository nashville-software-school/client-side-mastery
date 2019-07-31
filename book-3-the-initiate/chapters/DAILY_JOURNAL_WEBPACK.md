# Daily Journal with Webpack

## Setup
1. Clone down the [Webpack boilerplate](https://github.com/nashville-software-school/webpack-with-json-server-boilerplate) into a separate repo outside your daily journal repository.
1. In your daily journal repo, checkout a new branch.
1. Copy all the following files from the boilerplate to your daily journal repo: `package.json`, `.babelrc`, `.eslintrc`, `.eslintignore`, `webpack.config.js` and `.gitignore`.
1. Change the application name and author in the `package.json`.
1. Run `npm install`.

## Instructions

> **Task**: Take existing JavaScript modules, and refactor as Webpack modules with `import` and `export`.

Your `index.html` should have several script components at the bottom. Below is an example only, your files names do not need to match this example.

```html
<script src="scripts/entryComponent.js"></script>
<script src="scripts/filterEntries.js"></script>
<script src="scripts/entriesDOM.js"></script>
<script src="scripts/data.js"></script>
<script src="scripts/journal.js"></script>
```

Using Webpack, you need to make each of your files above into modules. Remember, your HTML file in `src` has no script tag because Webpack will put that in there for you when your HTML file is put in the `dist` directory.

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
