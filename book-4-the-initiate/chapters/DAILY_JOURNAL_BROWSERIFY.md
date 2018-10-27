# Daily Journal with Modules

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
import EntryFactory from "./dom/componentFactory"

const DOMManager = Object.create(null, {
    "render": {
        "value": (entries) => {
            const entriesContainer = document.querySelector(".entryLog")

            entriesContainer.textContent = ""

            for (entry of entries) {
                const entryComponent = EntryFactory.create(entry)
                entriesContainer.innerHTML += entryComponent
            }
        }
    }
})
```
