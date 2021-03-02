# Setup Application Data

Once you have created the ERD identifying resources and types of data, you can build a module in the application to store the data.


## Learning Objectives
You should be able to:
* explain the Single Responsibility of the data store module
* identify which property on a resource is the primary key
* explain the purpose of a primary key
* identify a foreign key on a resource and how it is related in another collection
* explain the purpose of a foreign key
* describe how to export functions and make the application's data state available to other modules

## Application State

It is the Single Responsibility of the data store module to maintain the application state.

The data store module will contain:

* All of the user objects
* All of the post objects
* All of the likes of posts that users make
* All of the messages that users send to each other


All other components will be either rendering _(i.e. displaying)_ state as HTML, or telling the data store to modify the state in response to a user filling out a form, or clicking a delete icon, etc.

## Creating the Application State

1. Create a `giffygram/src/scripts/store/index.js` file.
1. Place the following code to create an object representation of the store.
    ```js
    // applicationState is an object
    const applicationState = { }
    ```
1. Create a users array in the application state object. Then put a single object representation of a user in the array. Note that the properties on this object exactly match the properties that you defined in your ERD.
    ```js
    // each Table in the ERD is a key with a value that is an array of data
    const applicationState = {
        users: [
            {
                id: 1,
                name: "Ray Medrano",
                email: "ray@medrano.com",
                dateJoined: "2021/01/02"
            }
        ]
    }
    ```

    > **Key term**: The `id` property on an object in a data store is the **primary key** of the object. It is the only guaranteed unique value for each object.
1. Create a posts array in the application state object. Then put a single object representation of a post in the array.
    ```js
    const applicationState = {
        users: [
            {
                id: 1,
                name: "Ray Medrano",
                email: "ray@medrano.com",
                dateJoined: "2021/01/02"
            }
        ],
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

JavaScript has a powerful mechanism called the _**spread operator**_. It is three dots in a row `...` follow by a variable whose value is an iterable object: Array. You are going to use that to make a copy of your data before it is sent to other parts of the application.


It is important that only specific functions directly change state. By making a copy, we keep our data safe. This will make more sense later. Just remember that making copies of your data === safer.

> #### `giffygram/src/scripts/store/index.js`

```js
/*
    Function that other modules can use to get a
    copy of the users array
*/
export const getAllUsers = () => {
    // we don't want to alter the original state,
    // so make a copy of it and then return the copy
    const usersCopy = [...applicationState.users]
    return usersCopy
}
```

The `export` keyword makes the function usable by other modules. If you do not put the `export` keyword before declaring the function, then this module is the only one that can invoke it.

## Practice: Provide Access to Posts State

Create the function that will give other modules access to a copy of the state of posts. Remember to export the function.