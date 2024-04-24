# Villains

In your `database.js` module, add a new villains key that is an array of fun villain names that you come up with.

```js
const database = {
    heroes: [
        {
            id: 1,
            name: "Dynoguy",
            power: "Fire blasts"
        },
        {
            id: 2,
            name: "Hyperspeed",
            power: "Super speed"
        }
    ],
    villains: [
        // Remove this comment and create some villain objects
    ]
}
```

Then write a function to export a copy of that villain data.

```js
export const getVillains = () => {
    return database.villains.map(villain => ({...villain}))
}
```

## Importing the Data

Now create a new file in your scripts directory named `villains.js`.

Then import the function reference and then invoke it to get a copy of the villain array.

```js
import { getVillains } from "./database.js"

const villains = getVillains()
```

Now you have a copy stored in the `villains` variable.

## Generate Villain HTML

Now you can write a function that can turn those ugly objects into beautiful HTML that you can display in the browser to your users. This function will also be exported for use in other modules.

```js
export const VillainList = () => {
    let villainHTML = "<ul>"

    for (const villain of villains) {
        villainHTML += `<li>${villain.name}</li>`
    }

    villainHTML += "</ul>"

    return villainHTML
}
```

This function, when invoked, will generate a string of HTML that looks like this.

```html
<ul>
    <li>Villain 1</li>
    <li>Villain 2</li>
    <li>Villain 3</li>
    <li>Villain 4</li>
</ul>
```

You haven't invoked it yet. You'll get to that later.
