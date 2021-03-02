# Setup Application Data Manager

Once you have created the ERD identifying the resources and types of data, you can build a module in the application to interact with the data.


## Learning Objectives
You should be able to:
* explain the Single Responsibility of the data manager module
* identify which property on a resource is the primary key
* explain the purpose of a primary key
* identify a foreign key on a resource and how it is related in another collection
* explain the purpose of a foreign key
* describe how to export functions and make the data manager methods available to other components

## Data Manager

It is the Single Responsibility of the data manager to make requests to change the data.

The data manager module will contain methods that:

* Get all of the user objects
* Get all of the post objects
* Get all of the likes of posts that users make
* Get all of the messages that users send to each other
* Post for each...
* Any method related to changing the data

All other components will be either rendering _(i.e. displaying)_ state as HTML, or telling the data store to modify the state in response to a user filling out a form, or clicking a delete icon, etc.

## Create the Data Manager

1. Create a `giffygram/src/scripts/data/DataManager.js` file.
1. Create the `getUsers` method

```js
    export const getUsers = () => {

        return fetch("http://localhost:8088/users", {
            method: "GET",
        })
        .then(response => response.json())
        .then(parsedResponse => {
            // do something with response here
            return parsedResponse;
        })
    }

```

#### What's Happening here?
* The simplest use of `fetch()` takes one argument — the path to the resource you want to fetch — and returns a `promise` containing the response (a Response object).
* To extract the JSON body content from the response, we use the `json()` method
* Fetch calls are **asynchronous** - not existing or happening at the same time
* `.then()` method used with asynchronous programming, called only once, after the asynchronous task finishes



> **Key term**: The `id` property on an object is the **primary key** of the object. It is the only guaranteed unique value for each object.

```js
    export const getPosts = () => {

        return fetch("http://localhost:8088/posts", {
            method: "GET",
        })
        .then(response => response.json())
        .then(parsedResponse => {
            // do something with response here
            return parsedResponse;
        })
    }

```

> **Key Term**: The `userId` property on the post object is a **foreign key**. It matches the primary key of `1` of the user who created the post. In relational data systems, it is how you connect two related things together. In this example, it's your way of saying "This post object belongs to user #1."


The `export` keyword makes the function usable by other modules. If you do not put the `export` keyword before declaring the function, then this module is the only one that can invoke it.

## Practice: Journal Get Entries
* Set up your journal to include a `DataManager.js` module.