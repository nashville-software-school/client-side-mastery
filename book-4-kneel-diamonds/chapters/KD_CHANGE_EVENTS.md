# New Event Type: Change

## Learning Objectives

* You should be able to remember that radio button controls generate a _change_ event that you can listen for.
* You should be able to remember that when the user selects a radio input options, that the _value_ of the event target will be the value attribute of the chosen option.
* You should be able to implement an event listener for a group of radio input options.

## Change Listeners

Now, you need to listen for when the user makes a choice in one of the option groups. Start with metals.

> #### `kneel-diamonds/scripts/Metals.js`

```js
import { getMetals } from "./database.js"

const metals = getMetals()

document.addEventListener(
    "change",
    (event) => {
        if (event.target.name === "metal") {
            window.alert(`User chose metal ${event.target.value}`)
        }
    }
)
```

When you choose a metal, you should now see a message displayng the primary key of the chosen metal.

![](./images/kneel-diamonds-display-chosen-metal.gif)
