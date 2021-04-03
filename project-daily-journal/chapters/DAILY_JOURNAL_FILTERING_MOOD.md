# Daily Journal

The learning objective for this chapter is to use radio buttons, apply your knowledge of event listeners, the `filter()` method on an array, and the `find()` method on an array to show journal entries that match a certain mood.

> **Warning:** This part of Daily Journal development will  stretch your understanding of how each of the components can be used together in a non-sequential way. If you get frustrated by not being able to **immediately** see how it all works, that's natural and normal. See your instruction team.

## Mood Radio Buttons

Using `<fieldset>`, `<legend>`, `<input type="radio">`, and `<label>` HTML components, construct a set of radio buttons for selecting one of the moods. It's important that each of the radio buttons has the same value for the `name` attribute, but each should be a different value for the `value` attribute.

Before you go to the instruction team for help on this section, make sure you use the [Mozilla Developer Network article](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input/radio) on radio buttons as a reference first.

![mood radio buttons](./images/42YaMLSHb7.gif)

## Filter Bar Component

The fieldset that has the sad, happy, and ok radio buttons in it is a component. If you haven't set it up as one yet, it is time to make a **`FilterBar`** component. This component will set up the container for the radio buttons. It should then, in turn render a **`MoodFilters`** component. Here's an example.

> #### `daily-journal/scripts/filter/FilterBar.js`

```js
import { MoodFilter } from "./MoodFilter.js"

/*
 You need to make a new HTML element with a class of
 `filters` in index.html
*/
const contentTarget = document.querySelector(".filters")

const FilterBar = () => {
    render = () => {
        contentTarget.innerHTML = `
            ${MoodFilter()}
        `
    }

    render()
}
```

> #### `daily-journal/scripts/filter/MoodFilter.js`

```js
export const MoodFilter = () => {
    return `
        <fieldset class="fieldset">
            <legend>Filter Journal Entries by Mood</legend>
            ${
                allMoods.map(
                    (mood) => {
                        return `<input type="radio" name="moodFilter" value="${ mood.id }"/>
                        <label for="moodFilter--happy">${ mood.label }</label>
                        `
                    }
                ).join("")
            }
        </fieldset>
        `
}
```

## Add Event Listeners

Add an event listeners that captures when your radio button group changes, and then the only articles that should appear are the ones with the corresponding mood.

![journal entries filtered by mood when radio button is clicked](./images/E0uirNa8Af.gif)

A radio button group acts just like a `<select>` element. When the user clicks on one of the options, it generates a "change" event which you can capture on the event hub.

Then you can check the name property of the event target to make sure the logic only runs when the user has selected a mood.


```js
eventHub.addEventListener("change", e => {
    if (e.target.name === "moodFilter") {

    }
}
```

## Filtering the Journal Entries

Once you have successfully retrieved the value of selected mood, you need to filter all of the journal entries.

Consider adding a state variable that tracks which entries should be displayed. The user can either view all entries, or a filtered list of entries.
