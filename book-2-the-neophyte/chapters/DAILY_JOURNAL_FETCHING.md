# Daily Journal

Your learning objective in this chapter is to set up JSON Server to store the data for your daily journal entries, query that data from the API, and then use your knowledge of Promises (_remember, `fetch` is a fancy Promise_) and `then()` to render the entries to the DOM.

## Setting up a JSON Server API

The [json-server](https://github.com/typicode/json-server) library was written to allow developers to quickly build an API to use as persistant storage while developing applications. You are going to expose your journal entries via an API, request that API over HTTP, and then populate your DOM when the data comes back in a response.

### Installation

Install `json-server` by typing in the following command in your terminal. It doesn't matter where you are in your directory structure when you type this in since the package is installed globally - meaning it can be executed anywhere.

```sh
npm install -g json-server
```

If you get an error when you try to run that, you may need to install it with administrative rights with `sudo`.

```sh
sudo npm install -g json-server
```

### Journal Entries as JSON

In the root directory, create a new directory in your project named `api`, and create a new file in that directory named `entries.json`.

```sh
mkdir api
touch api/entries.json
```

![creating the api directory](./images/Rn0iCdc6qN.gif)

Your next step is to remove the array of entries that you have in `journal.js`, and transplant it to `api/entries.json` as a JSON object.

When working with **Official JSON Objects**, all keys should be strings so put double quotes around them.

![](./images/dQFNJpbEfM.gif)

As mentioned previously in [Chapter 9 - Building and Using an API](./chapters/JSON_SERVER_API.md), each object should have a unique ID. At this point, once you've transplanted your journal entries into `api/entries.json`, make sure to add unique integer IDs to each entry like the following example.
```
{
  "id": 1,
  "concept": "Array methods",
  "date": "08/06/19",
  "entry": "We learned about array methods.",
  "mood": "ok"
}
```

### Starting the Server

Now you run the `json-server` command with the arguments below in the `api` directory.

```sh
cd api
json-server -w entries.json
```

![starting json-server](./images/gklBlNixxn.gif)

Go to your browser now, and visit the URL listed in the output. It should be `http://localhost:3000`. Then click on the hyperlink for `entries` and you should see the objects that you created.

![json server entries](./images/jason-server-entries.png)

## Using `fetch()` to Query Data

> **Refactor:** At this point, the `journalEntries` array should be completely removed from your JavaScript. You are now going to get the data from your API server.

Since you are now simulating the scenario that your data now lives _somewhere else on the Web_ you need to use the [fetch()](https://learn.co/lessons/javascript-fetch) command in JavaScript.

```js
fetch() // Fetch from the API
    .then()  // Parse as JSON
    .then(entries => {
        // What should happen when we finally have the array?
    })
```

## Viewing the Response

Once you have your fetch written correctly, refresh your browser and go to the Network tab in your dev tools. You will see an entry labeled `fetch`. If you click on that request, you can preview the response.

![](./images/qqipDG07AL.gif)
