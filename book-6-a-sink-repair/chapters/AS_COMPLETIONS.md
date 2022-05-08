# Creating Completion State

When Maude or Merle have completed a job, they would like to choose their name from a `<select>` element and have it recorded permanently. The date of completion should also be recorded when a name is chosen.

<img src="./images/sink-repair-complete-service.gif" alt="animation showing two service requests marked as complete" width="800px"/>

## Getting the Plumbers

First, add the following function to your `dataAccess.js` module.

```js
export const fetchRequests = () => {
    return fetch(`${API}/plumbers`)
        .then(response => response.json())
        .then(
            (data) => {
                applicationState.plumbers = data
            }
        )
}
```

Then update your `main.js` to request both resources using the following syntax. Notice the new `.then()` method which, in turn, invokes the `fetchPlumbers` function.

```js
import { fetchRequests } from "./dataAccess.js"
import { SinkRepair } from "./SinkRepair.js"


const mainContainer = document.querySelector("#container")

const render = () => {
    fetchRequests()
        .then(() => fetchPlumbers())
        .then(
            () => {
                mainContainer.innerHTML = SinkRepair()
            }
        )
}

render()
```

## Double State for Display Plumbers

You can place this `<select>` element wherever is easiest to start. Don't worry about the exact placement, just make sure that it is displayed for each service request.

Note that the value of each option in the select element has the primary key of the service request AND the primary key of the plumber delimited with 2 dashes. This is because you need to have both the request and the chosen plumber to mark a job complete.

```js
<select class="plumbers" id="plumbers">
    <option value="">Choose</option>
    ${
        plumbers.map(
            plumber => {
                return `<option value="${request.id}--${plumber.id}">${plumber.name}</option>`
            }
        ).join("")
    }
</select>`
```

## Creating New State for Completion

Add the following event listener to your requests module.

```js
mainContainer.addEventListener(
    "change",
    (event) => {
        if (event.target.id === "plumbers") {
            const [requestId, plumberId] = event.target.value.split("--")

            /*
                This object should have 3 properties
                   1. requestId
                   2. plumberId
                   3. date_created
            */
            const completion = { }

            /*
                Invoke the function that performs the POST request
                to the `completions` resource for your API. Send the
                completion object as a parameter.
             */

        }
    }
)
```

## Saving Completion State

Create two functions in your `dataAccess` module.

* `saveCompletion()` - This will perform the POST request to save the completion object to the API
* `fetchCompletions()` - This will retrieve all completion objects from the API

## Update Main

Now update your main module again to fetch the completions after requests and plumbers have been fetched.
