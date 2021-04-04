# Getting Permanent State

Before you get to saving new requests, you should list any previous requests. You are going to use a `fetch()` to get all existing requests and then list them in the UI.

Feel free to go back to chapter 1 and review the video about using `fetch()`.

## Manually Create a Request

Put the following object in the requests array in your `database.json` file.

```json
{
    "id": 1,
    "description": "Aut sint voluptatem fugit eius quas molestiae modi.",
    "address": "34445 Bianka Ports",
    "budget": 400.00,
    "neededBy": "Fri Aug 27 2021 13:13:47 GMT-0500 (Central Daylight Time)"
}
```

## Application State

You will need to store that external data in your application state when you fetch it. Create a property names `requests` in your application state object. Its inital value must be an empty array.

## HTTP GET Request with Fetch

Place the following variable and function in your `dataAccess.js` module.

```js
const API = "http://localhost:8088"

export const fetchRequests = () => {
    return fetch(`${API}/requests`)
        .then(response => response.json())
        .then(
            (serviceRequests) => {
                // Store the external state in application state
                applicationState.requests = serviceRequests
            }
        )
}
```

## Export Requests State

Define and export a function named `getRequests` that returns a copy of the requests state. Go back to a previous project and look at the functions that return copies of arrays in the `database` module if you've forgotten the syntax.

## Fetch State Before Displaying

You need to fetch the data from the API and store it in application state before you can convert the data structures to HTML representations. The syntax here is very confusing for a beginner, and your instruction team will explain the logic when they do a live coding review.

```js
import { fetchRequests } from "./dataAccess.js"
import { Requests } from "./Requests.js"
import { ServiceForm } from "./ServiceForm.js"


const mainContainer = document.querySelector("#container")

fetchRequests()
    .then(
        () => {
            const applicationHTML = `
                <h1>Maude and Merle's Sink Repair</h1>
                <section class="serviceForm">
                    ${ServiceForm()}
                </section>

                <section class="serviceRequests">
                    <h2>Service Requests</h2>
                    ${Requests()}
                </section>
            `

            mainContainer.innerHTML = applicationHTML
        }
    )
```


## Core Skills: Critical and Creative Thinking

Here is some starter code. You need to define the function for the `map()` method to convert the service request objects into HTML representations. Since it is wrapped with a `<ul>` element, make each one an `<li>` element showing only the description of the request to start.

```js
import { getRequests } from "./dataAccess.js"

export const Requests = () => {
    const requests = getRequests()

    let html = `
        <ul>
            ${
                requests.map()
            }
        </ul>
    `

    return html
}
```

## Core Skill: Collaboration

Work with your peers to get this built out. If you still aren't able to get the requests to list after ~20-30 minutes of attempts, contact an instructor to walk through it.
