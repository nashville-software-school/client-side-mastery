# Saving Permanent State

As the person is typing into the form fields, they are changing the state of the application, but it is transient state because the person hasn't committed to the service request until the button is clicked. When the person clicks the button, your job is to take the transient state and convert it into permanent state by storing it in the `database.json` file by using a `fetch()` call.

Feel free to go back and watch video in chapter 1 or a refresher on fetch.

## HTTP POST Request with Fetch

Place the following function in your `dataAccess.js` module. The POST method on any HTTP request means _"Hey API!! I want you to create something new!"_

```js
const API = "http://localhost:8088"

export const sendRequest = (userServiceRequest) => {
    const fetchOptions = {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify(userServiceRequest)
    }


    return fetch(`${API}/requests`, fetchOptions)
        .then(response => response.json())
        .then(() => {

        })
}
```

## HTTP Request Methods

Here are the four main methods used on HTTP requests.

| Method | Description |
|--|--|
| **GET**  | Please give me this resource.  |
| **POST**  | Please create something new.  |
| **PUT**  | Please modify an existing resource.  |
| **DELETE**  | Please delete an existing.  |


## Listen for the Click



