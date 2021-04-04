# Saving Permanent State

As the person is typing into the form fields, they are changing the state of the application, but it is transient state because the person hasn't committed to the service request until the button is clicked. When the person clicks the button, your job is to take the transient state and convert it into permanent state by storing it in the `database.json` file by using a `fetch()` call.

Feel free to go back and watch video in chapter 1 or a refresher on fetch.

## HTTP POST Request with Fetch

Place the following variable and function in your `dataAccess.js` module.

```js
const API = "http://localhost:8088"

export const sendRequest = () => {
    return fetch(`${API}/requests`)
        .then(response => response.json())
        .then(() => {

        })
}
```

## Listen for the Click



