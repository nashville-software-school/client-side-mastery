# Start with the Data

Before you write **ANY** code for an application, you need to understand the types of data _(i.e. resources)_ you are working with, the properties of each resource, and how the resources are related to each other. All of the code that you will write is dependent upon the decisions you make about your data. Once you have started building the application, the more progress you make, the more expensive it is - in both time and money - to make changes to the structure of your data.

In this chapter, you are going to build a module in your application that is called the Data Store. Oddly enough, it's called that because it will store all of the data.

## Learning Objectives

* You should be able to explain what the single responsibility of the data store module is.
* You should be able to identify which property on a resource is the primary key.
* You should be able to explain the purpose of a primary key.
* You should be able to identify a foreign key on a resource that is related to a resource in another collection.
* You should be able to explain the purpose of a foreign key.
* You should be able to describe how to use functions and exporting to make application state available to other modules.

## Application State

You were introduced to the term **_state_** in previous books. You will be deepening your understanding of the concept, and you ability to correctly apply it in this book.

The data store module that you are coding in this chapter will be maintaining all of the state needed for your application.

* All of the user objects
* All of the post objects
* All of the likes of posts that users make
* All of the messages that users send to each other

It is the Single Responsbility of the data store module to maintain the application state.

All of the other components will be either rendering _(i.e. displaying)_ state as HTML, or telling the data store to modify the state in response to a user filling out a form, or clicking a delete icon, etc.

## Creating the Application State

1. Create a `giffygram/src/scripts/database.js` file.
1. Place the following code to create an object representation of the store.
    ```js
    const database = { }
    ```
1. Create a users array in the application state object. Then put a single object representation of a user in the array. The object should have the following properties.
    * id _(number)_
    * email _(string)_
    * password _(string)_
    * name _(string)_
    * dateJoined _(epoch timestamp)_

    > **Key term**: The `id` property on an object in a data store is the **primary key** of the object. It is the only guaranteed unique value of each object.
1. Create a posts array in the application state object. Then put a single object representation of a post in the array.
    ```js
    const database = {
        posts: [
            {
                id: 1,
                userId: 2,
                description: "Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.",
                imageURL: "https://media.giphy.com/media/YqGeOQ0u6hB5u/giphy-downsized.gif",
                timestamp: 1580005022812,
                title: "Self-enabling directional array"
            }
        ]
    }
    ```

> **Key Term**: The `userId` property on the post object is a **foreign key**. It matches the primary key of `1` that identifies Ray. In relational data systems, it is how you conect two related things together. In this example, it's your way of saying "The post object #1 belongs to Ray."

## Provide Access to Users State

Now you need to write some simple functions that will allow other code to access this data, or state.

### Making Copies

JavaScript has a weird, but powerful mechanism called the _**spread operator**_. It is three dots in a row `...` follow by a variable whose value is an array. You are going to use that to make a copy of your data before it is sent to other parts of the application.

> TODO: Insert video about spread operator here

The reason for making copies for the rest of the application to use is so that other code cannot change the data directly.

This will make more sense later. Just remember that making copies of your data === safer.

> #### `giffygram/src/scripts/store/index.js`

```js
/*
    Function that other modules can use to get a
    copy of the users array
*/
export const getAllUsers = () => {
    // Create a copy of users array
    const usersCopy = applicationState.users.map(user => ({...user}))

    // Make the copy the output of the function
    return usersCopy
}
```

The `export` keyword makes the function usable by other modules. If you do not put the `export` keyword before declaring the function, then this module is the only one that can invoke it.

## Practice: Provide Access to Posts State

Now you practice creating and exporting another function that gives other modules a way to import a function that will output a copy of the posts array for them to use.