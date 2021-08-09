# Daily Journal: Display List of Entries

You have built your form for entering in journal entries, so now you need to define how the data that you will be collecting in the form should be stored. Your learning objective for this chapter is to build a function that returns an HTML representation of a journal entry data structure, and render it to the DOM.

## The First Journal Entry Rendered to the DOM

By the end of this chapter - once you have all the functionality written - you will see your journal entry beneath your form.

![](./images/first-journal-entry.png)


## Journal Entry Components

In this chapter you will take your raw data structures, and create HTML representations of them so they can be added to the DOM. You can't add JavaScript objects to the DOM. Only HTML can be rendered by the browser.

### Journal Entry Component

Add two, new JavaScript modules to your application named `JournalEntryList.js` which will be responsible for rendering a list of entry components, and `JournalEntry.js` which will be responsible for rendering a single journal entry.

Just like Martin's Aquarium application, you are going to make each individual item component return an HTML string.

> **scripts/JournalEntry.js**

```js
/*
 *  Purpose: To render a single journal entry as an
 *           HTML representation of the data
 */
export const JournalEntryComponent = (entry) => {
    return `
        <section id="entry--${entry.id}" class="journalEntry">
            Display the entry's full text, and the date
            it was entered here.
        </section>
    `
}
```

### Journal List Component

The list component, just like Martin's Aquarium, will take all of the individual entry HTML strings and inject it into the browser DOM.

> **scripts/JournalEntryList.js**

```js
/*
 *  Purpose:
 *    To render as many journal entry components as
 *    there are items in the collection exposed by the
 *    data module component
 */
import { getJournalEntries } from "./JournalData.js"
import { JournalEntryComponent } from "./JournalEntry.js"

// DOM reference to where all entries will be rendered
const entryLog = document.querySelector("#entryLog")

export const EntryListComponent = () => {
    // Use the journal entry data from the data module component
    const entries = getJournalEntries()

    for (const entry of entries) {
        /*
            Invoke the component that returns an
            HTML representation of a single entry
        */
        entryLog.innerHTML += ???
    }
}
```

## Render the Entry List

Now you need to import the list component into the main module and invoke it there. If you are still not clear on how to do this, see a member of your instruction team and we'll talk through it.
