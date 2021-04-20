# Rendering the Application Structure

Up to this point, you have had your journal entry form hard-coded in your `index.html` file. Your task for this exercise is update the **`DailyJournal`** module whose responsiblity is to render the application's HTML structure.

## Journal Form Component

Create a **`JournalForm`** module which returns the HTML for the journal input fields. You will be removing all of that HTML from `index.html` and putting it into this new component function.

## Rendering the Form

Once that component is complete, make sure you import it into **`DailyJournal`** and ensure that the form is the first thing rendered.

> #### `daily-journal/scripts/DailyJournal.js`

```js
// Keep your existing imports and add the new import for the form function

export const DailyJournal = () => {
    return `
        <h1>Daily Journal</h1>

        <div class="entryList">
            ${ Entries() }
        </div>

        <article class="entryForm">
            Use interpolation to put the HTML that the form function generates here
        </article>
    `
}
```