# Reacting to State Changes with useEffect()

## Video Walkthrough

Watch the [Honey Rae's Repairs - Total Customers State](https://vimeo.com/568226412) video to see how the `useState()` and `useEffect()` hooks are used to set up and watch application state.

## Documentation Walkthrough

Your initial introduction to the `useEffect()` hook was not very compelling, nor did it show you the true power of the function. This hook's main purpose is to observe one, or more, state variables, and then run code when that state changes.

It's an event listener. It doesn't look like one, though, because React has encapsulated that code behind the scenes and has give you `useEffect()` to use.

Remember when you used the following code when your state changed?

```js
document.dispatchEvent(
    new CustomEvent("stateChanged")
)
```

The main module then listened for that event and built all of the HTML again.

```js
document.addEventListener("stateChanged", event => {
    console.log("State of data has changed. Regenerating HTML...")
    renderAllHTML()
})
```

The `useEffect()` function does **all of that for you now**, and does it more discreetly, with better performance, and targets only the specific HTML that would change instead of re-rendering the _entire_ application.


## Starter Code

Completely replace the code in your **`CustomerList`** module with the following starter code.

> #### `src/components/customers/CustomerList.js`

```js
import React, { useEffect, useState } from "react"

export const CustomerList = () => {
    const [customers, setCustomers] = useState([])

    useEffect(
        () => {
            fetch("http://localhost:8088/customers")
                .then(res => res.json())
                .then((data) => {
                    setCustomers(data)
                })
        },
        []
    )

    useEffect(
        () => {

        },
        [customers]
    )

    return (
        <>
            {
                customers.map(
                    (customerObject) => {
                        return <p key={`customer--${customerObject.id}`}>{customerObject.name}</p>
                    }
                )
            }
        </>
    )
}
```
