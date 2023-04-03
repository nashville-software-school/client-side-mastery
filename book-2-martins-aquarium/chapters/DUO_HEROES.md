# Modules in the Browser

Up to this point, when you needed to export information from a JavaScript module, or import it into another module, you have used the following syntax.

#### Export

```js
module.exports = { functionA, functionB }
```

#### Import

```js
const { functionA, functionB } = require("./anotherModule.js")
```

That mechanism is no longer valid when working with modules in the browser. Here is the new syntax.

#### Export

```js
export const functionA = () => {
    ...
}

export const functionB = () => {
    ...
}
```

#### Import

```js
import { functionA, functionB } from "./anotherModule.js"
```

## Define Hero Data and Export a Getter Function

In your `database.js` module, define your database and a collection of heroes in it.

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
    ]
}
```

Then write a function to export a copy of that data. This function will be exported for use in other modules. This code is fairly advanced for a beginner, and it is **not important** that you understand the code. You just need to know that this copies the data for use in other modules.

```js
export const getHeroes = () => {
    return database.heroes.map(hero => ({...hero}))
}
```

## Importing the Data

Now create a new file in your scripts directory named `heroes.js`.

Time to import the getter function.

```js
import { getHeroes } from "./database.js"
```

You have imported the function that will give you a copy of the data. You don't have a copy yet. You need to invoke the function

```js
import { getHeroes } from "./database.js"

const heroes = getHeroes()
```

Now you have a copy stored in the `heroes` variable.

## Generate Hero HTML

Now you can write a function that can turn those ugly objects into beautiful HTML that you can display in the browser to your users. This function will also be exported for use in other modules.

```js
export const HeroList = () => {
    let heroHTML = "<ul>"

    for (const hero of heroes) {
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
