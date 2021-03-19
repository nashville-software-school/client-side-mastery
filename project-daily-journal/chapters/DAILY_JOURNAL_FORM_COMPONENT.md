# Rendering the Application Structure

Up to this point, you have had your journal entry form hard-coded in your `index.html` file. Your task for this exercise is create a **`DailyJournal`** module whose responsiblity is to render the application's HTML structure.

Then create a **`JournalForm`** module which returns the HTML for the journal input fields.

Once that component is complete, make sure you import it into **`DailyJournal`** and ensure that the form is the first thing rendered.

> #### `daily-journal/scripts/main.js`

```js
import { DailyJournal } from "./DailyJournal.js"

const mainContainer = document.querySelector("#container")

const renderAllHTML = () => {
    mainContainer.innerHTML = DailyJournal()
}

renderAllHTML()
```

> #### `daily-journal/scripts/DailyJournal.js`

```js
import { JournalForm } from "./JournalForm.js"

export const DailyJournal = () => {
    return `
        <h1>Daily Journal</h1>

        <article class="entryForm">
            ${ JournalForm() }
        </article>
    `
}
```