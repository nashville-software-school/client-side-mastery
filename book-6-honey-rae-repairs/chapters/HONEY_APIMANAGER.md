# Moving the Fetch (Single Responsibility)

In all projects that you've done since Book 3, you've had a separate module that had the Single Responsibility of managing the data for your application, including having functions that fetch the data for synchronization.

Your task is to change your code to follow that pattern with React.

## API Manager Module

1. In your `components` directory, create an `ApiManager.js` file.
1. In the API manager module, define a function called `getAllCustomers()` and move the `fetch()` from `CustomerList.js` into the new function you just created. Make sure you return the fetch call.
    ```js
    export const getAllCustomers = () => {
        return fetch(insert URL here)
            .then(res => res.json())
    }
    ```
1. Import the `getAllCustomers()` function into CustomerList module.
    ```js
    import { getAllCustomers } from "../ApiManager"
    ```
1. Update the `useEffect()` like so...
    ```js
        useEffect(
        () => {
            getAllCustomers()
                .then(
                    (customers) => {
                        assignCustomers(customers)
                    }
                )
        },
        []
    )
    ```

Once that is complete and working, move **ALL** of the other fetch calls in your React components to functions in the API Manager module. Then import those functions into the appropriate React component modules.