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

        // Write your code here

    }
})
```

1. What component would need to react to the fact that the user chose an officer? Conviction select? Criminal list?
1. Once you determine which component should react to the user action, implement a filter in that component.
    ```