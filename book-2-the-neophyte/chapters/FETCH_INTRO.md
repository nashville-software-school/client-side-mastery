# Fetching Data from the Fish API

## Why are you Learning This?

Companies all over the world provide access to their data so that software developers can build interesting solutions for their customers. You, as a developer, can request their raw data, but use it however you like.

For example, the [Merriam-Webster](https://dictionaryapi.com/) dictionary and thesaurus is available for software developers who may be building a tool for children to work on their spelling and vocabulary skills.

Another source of data is the [Air quality and pollution API](https://www.airvisual.com/air-pollution-data-api). Software developers who work for non-profits that monitor industrial pollution, or government agencies who regulate industry would find this data very useful for building custom software.

## Requesting Data from an API

First, make sure you have a terminal open and have navigated to `~/workspace/martins-aquarium/api`.

Then start your API service with the `json-server -p 8088 database.json` command

In JavaScript, you are going to be using the Fetch API. It provides you with a `fetch()` method to initiate the request to another service on the World Wide Web. Here's an example fetch call to get fish data.

> #### `scripts/fish/fishData.js`
```js
let fish = []

export const getFish = () => {
    return fetch("http://localhost:8088/fish")
        .then(response => response.json())
        .then(
            allFishFromAPI => {
                console.table(allFishFromAPI)
                fish = allFishFromAPI
            }
        )
}
```

Here's the pattern for a fetch call.

1. Request the data
    ```js
    fetch("http://localhost:8088/fish")
    ```
1. Convert the JSON string response to a JavaScript data structure (object or array)
    ```js
    .then(response => response.json())
    ```
1. Do something with the data
    ```js
    .then(
        allFishFromAPI => {
            console.table(allFishFromAPI)
            fish = allFishFromAPI
        }
    )
    ```

* Reference: [How to Use the JavaScript Fetch API to Get Data](https://scotch.io/tutorials/how-to-use-the-javascript-fetch-api-to-get-data)

## Assignment

Now that fish are being displayed again, your job is to do the same thing for tips and locations for Martin's Aquarium site.

1. Make sure the objects are removed from the arrays in the data modules and moved to the `database.json` file.
1. Write a function in both of the data modules to get the data from the API.
1. Make sure the data displays again in the HTML.

## Reminder

Asynchronous data flow is incredibly difficult to gain proficiency in, let alone mastery. There are analogies that help learn the concept, but the syntax is highly abstract and hard to visualize in your brain.

It takes a while for the human brain's neurons to get rewired enough to truly understand and analyze the code enough to do it from scratch.

For quite some time, you will just be pattern matching.