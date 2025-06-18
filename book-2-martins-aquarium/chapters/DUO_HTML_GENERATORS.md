# Composing Dynamic HTML

Stay in your `main.js` module and now you're going to build the new HTML that you want to be in the `<main>` HTML element.

## Dynamic HTML

Place the following code in the main module above your line of code that you added in the previous chapter.

```js
// Import the function references that generate the HTML lists
import { HeroList } from "./heroes.js"
import { VillainList } from "./villains.js"

// Capture the return values of the HTML list generators
const heroListHTML = HeroList()
const villainListHTML = VillainList()

// Build up a single string containing both chunks of HTML
const theWholeEnchilada = `
    <h1>Heroes</h1>
    ${heroListHTML}

    <h1>Villains</h1>
    ${villainListHTML}
`
debugger

/*
    This is the code you wrote in the last chapter to get a
    reference to the <main> element
*/
const theExistingMainElement = document.querySelector("#container")
```

Then refresh your browser and inspect that value of the `theWholeEnchilada` variable. You will see that it is a large HTML string made up of what the HTML generator function in the other modules produce.

![](./images/the-whole-enchilada-value.gif)

Now remove the `debugger` statement and move on to the next chapter to see how to place this new HTML string into the visible part of the browser.