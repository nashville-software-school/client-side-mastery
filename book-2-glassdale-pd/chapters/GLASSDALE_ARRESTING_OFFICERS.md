# Show Who Was Arrested by Whom

For this feature, you will be doing nearly the exact same thing you did when you filtered the displayed criminals by crime. Except in this case, you will build a component that renders a `<select>` element that is populated with all officers in the Glassdale, IL police department.

When the user selects an officer, show the criminals that were arrested by that officer.

![animated image showing how criminals will be filtered](./images/arresting-officers.gif)

## Data Source

The arresting officers are located at the URL of https://criminals.glassdale.us/officers. You will `fetch` that data in your **`OfficerDataProvider`** component and then export a `useOfficers()` function in it so that the **`OfficerSelect`** component can iterate it and render an `<option>` element for each one.

When an officer is selected by the user the **`OfficerSelect`** component can dispatch a `officerSelected` custom event.

```js
eventHub.addEventListener("change", changeEvent => {
    if (changeEvent.target.id === "officerSelect") {
        // Get the name of the selected officer
        const selectedOfficer = changeEvent.target.value

        // Define a custom event
        const customEvent = new CustomEvent("officerSelected", {
            detail: {
                officer: selectedOfficer
            }
        })

        // Dispatch event to event hub
        eventHub.dispatchEvent(customEvent)
    }
})
```

1. What component would need to react to the fact that the user chose an officer? Conviction select? Criminal list?
1. Once you determine which component should react to the user action, implement an event listener in that component.
    ```js
    eventHub.addEventListener("officerSelect", event => {
        // How can you access the officer name that was selected by the user?
        const officerName = event.???

        // How can you get the criminals that were arrested by that officer?
        const criminals = useCriminals()
        criminals.???(
            criminalObject => {
                if (criminalObject.??? === officerName) {
                    return true
                }
            }
        )
    })
    ```