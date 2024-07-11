# Modules in the Browser

Up to this point, when you needed to export information from a JavaScript module, or import it into another module, you have used the following syntax.

## Define Hero Data and Export a Getter Function

In your `scripts/database.js` module, define your database and a collection of heroes in it.

```js
export const database = {
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
    ]
}
```

## Importing the Data

Now create a new file in your scripts directory named `heroes.js`. Add this code to the module to import the database.

```js
import { database } from "./database.js"
```

## Generate Hero HTML

Now you can write a function that can turn those ugly objects into beautiful HTML that you can display in the browser to your users. This function will also be exported for use in other modules.

```js
export const HeroList = () => {
    let heroHTML = "<ul>"

    for (const hero of database.heroes) {
        heroHTML += `<li>${hero.name}</li>`
    }

    heroHTML += "</ul>"

    return heroHTML
}
```

This function, when invoked, will generate a string of HTML that looks like this.

```html
<ul>
    <li>Dynoguy</li>
    <li>Hyperspeed</li>
</ul>
```

You haven't invoked it yet. You'll get to that later.
