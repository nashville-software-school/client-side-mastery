# Daily Journal

You have built your form for entering in journal entries, so now you need to define how the data that you will be collecting in the form should be stored. Your learning objective for this chapter is to build a function that returns an HTML representation of a journal entry data structure, and render it to the DOM.

## The First Journal Entry Rendered to the DOM

By the end of this chapter - once you have all the functionality written - you will see your journal entry beneath your form.

![](./images/first-journal-entry.png)

## Main Module

The main module will be responsible for dynamically updating the HTML that displays in the browser to the people using the application. Put the following starter code in the module.

```js
import { ??? } from "./DailyJournal.js"

const container = document.querySelector("#entries")

const render = () => {
    container.innerHTML = DailyJournal()
}
```

You will immediately notice that some of the code will get the red underline. That's ok because you'll fix it as you go through the chapter.

## Daily Journal Component

While the main module is responsible for actually putting your application's HTML code into the browser for viewing, this component is responsible for generating the overall structure of your HTML.

> **scripts/DailyJournal.js**

```js
import { ??? } from "./Entries.js"

export const DailyJournal = () => {
    return `
        <div class="entryList">
            ${ Entries() }
        </div>
    `
}
```

## Journal List Component

Add a new JavaScript module to your application named `Entries.js` which will be responsible for rendering a list of HTML representations of your journal entries. Most of the code is provided, but you have to define a good HTML structure for each journal entry's representation.

> **scripts/Entries.js**

```js
/*
    Which function allows this component to get a copy
    of the data? Import it on the following line of code
    and then invoke it on the third line of code.
*/
import { ??? } from "./database.js"

export const Entries = () => {
    const entries = ???
    const allEntriesAsHTML = ""


    for (const entry of entries) {
        allEntriesAsHTML += `
           Replace this with your HTML representation of a journal entry
        `
    }

    return allEntriesAsHTML
}
```

## Rendering the Entry List

Replace all of the `???` in the example code with the proper syntax to see your journal entries be displayed. Talk to your teammates and your instruction team if you are still struggling with import/export of functions.

Also try drawing out the import/export flow on a piece of paper with boxes and lines. It truly does help to visualize the process.
