# Using All the Filters!

For this chapter, your job is to refactor the application so that you can filter the criminal list on both the crime **and** the arresting officer at the same time. Right now, either filter will override the previous one.

So if you choose a crime, and then choose an officer, the criminals that should be listed are the ones who committed the selected crime, and were arrested by the selected officer.

## Getting Started

1. Create a **`Filter`** component in a `Filter.js` file.
1. In this component add a button up in the filtering area next to both select elements labeled "Filter".
1. Add a "click" event listener in the **`Filter`** that captures when the user clicks on the filter button.
1. Dispatch a custom message named "filterClicked" to the event hub. The event detail object
1. Move the event listeners in the **`CriminalList`** component that were responding to the custom events for when a criminal or officer were selected to the **`Filter`** component.

> #### `glassdale/scripts/filter/Filter.js`

```js
const eventHub = document.querySelector(".container")
const contentTarget = document.querySelector(".filter__button")

let selectedOfficer = null
let selectedCrime = null

const FilterComponent = () => {

    eventHub.addEventListener("officerSelected", event => {
        selectedOfficer = what?
    })

    eventHub.addEventListener("crimeSelected", event => {
        selectedCrime = what?
    })

    eventHub.addEventListener("click", clickEvent => {
        if (clickEvent.target.id === "filterButton") {
            const message = new CustomEvent("filterInitiated", {
                detail: {
                    // What data should be provided?
                }
            })
        }
    })
}
```

## Refactor Criminal List

Your **`CriminalList`** component now needs to be refactored. It will now listener for the "filterInitiated" event, and then filter the array of criminals twice.

1. Filter by crime
1. Then filter by officer
1. Then render what's left