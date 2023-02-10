# Daily Journal

Your learning objective in this chapter is to set up JSON Server to store the data for your daily journal entries, query that data from the API, use `fetch()` and `then()` to render the entries to the DOM.

## Setting up a JSON Server API

The [json-server](https://github.com/typicode/json-server) library was written to allow developers to quickly build an API to use as persistant storage while developing applications. You are going to expose your journal entries via an API, request that API over HTTP, and then populate your DOM when the data comes back in a response.

### Journal Entries as JSON

In the root directory, create a new directory in your project named `api`, and create a new file in that directory named `database.json`.

```sh
mkdir api
touch api/database.json
```

![creating the api directory](./images/Rn0iCdc6qN.gif)

Your next step is to take the array of entries that you have hard-coded in the `database.js` module, and move it to `api/database.json` as a JSON object.

> #### `daily-journal/api/database.json`

```json
{
    "entries": [
        // Remove this comment and paste all of your objects here
    ]
}
```

When working with **Official JSON Objects**, all keys should be strings so put double quotes around them.

### Starting the Server

Now you run the `json-server` command with the arguments below in the `api` directory.

```sh
cd api
json-server -w database.json -p 8088
```

Go to your browser now, and visit the URL listed in the output. It should be `http://localhost:8088`. Then click on the hyperlink for `entries` and you should see the objects that you created.

## Using `fetch()` to Query Data

> **Refactor**
>
> At this point, the `entries` key in your database object  should be initialized as an empty array. You are now going to get the data from your API server.
>
>    ```js
>    const database = {
>        entries: []
>    }
>    ```

Since you are now simulating the scenario that your data now lives _somewhere else on the Web_ you need to use the [fetch()](https://learn.co/lessons/javascript-fetch) command in JavaScript.

> #### `daily-journal/scripts/database.js`

```js
export const getEntries = () => {
    return fetch("http://localhost:8088/entries") // Fetch from the API
        .then()  // Parse as JSON
        .then(entries => {
            // What should happen when we finally have the array?
        })
}
```

## Viewing the Response

Once you have your fetch written correctly, refresh your browser and go to the Network tab in your dev tools. You will see an entry labeled `fetch`. If you click on that request, you can preview the response.

![](./images/qqipDG07AL.gif)
