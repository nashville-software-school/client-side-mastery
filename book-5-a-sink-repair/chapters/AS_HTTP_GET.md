# Display New State

Remember that every time state changes, you have to generate new HTML representations of the state. Now that you have the ability to generate new state and store it permanently in your API, you need to implement the `stateChanged` custom action again.

## Get State and Dispatch Event

Update your `sendRequest()` function's fetch call to dispatch the custom event after the POST operation has been completed.

> #### `sink-repair/src/scripts/dataAccess.js`

```js
    return fetch(`${API}/requests`, fetchOptions)
        .then(response => response.json())
        .then(() => {
            mainContainer.dispatchEvent(new CustomEvent("stateChanged"))
        })
```

## Generate New HTML Representations

Now your `main` module has to listen for the custom event and invoke the `render()` function to build all the HTML again.

> #### `sink-repair/src/scripts/main.js`

```js
mainContainer.addEventListener(
    "stateChanged",
    customEvent => {
        render()
    }
)
```

## Watch Your Network

Now submit another service request with your form, and the service request should now be immediately rendered in the list without the need to refresh the browser. Have your Developer Tools > Network tab open and inspect both the POST request, and the subsequent GET request to see what happened.

![animation of submitting a service request](./images/sink-repair-post-then-fetch.gif)

