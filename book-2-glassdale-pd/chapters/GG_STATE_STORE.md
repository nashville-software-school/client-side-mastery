# Start with the Data

Before you write **ANY** code for an application, you need to understand the types of data _(i.e. resources)_ you are working with, the properties of each resource, and how the resources are related to each other. All of the code that you will write is dependent upon the decisions you make about your data. Once you have started building the application, the more progress you make, the more expensive it is - in both time and money - to make changes to the structure of your data.

In this chapter, you are going to build a module in your application that is called the Data Store. Oddly enough, it's called that because it will store all of the data.

## Learning Objectives

* You should be able to explain what the Single Responsibility of the data store module is.
* You should be able to identify which property on a resource is the primary key.
* You should be able to explain the purpose of a primary key.
* You should be able to identify a foreign key on a resource that is related to a resource in another collection.
* You should be able to explain the purpose of a foreign key.
* You should be able to describe how to use functions and exporting to make application state available to other modules.

## Application State

You were introduced to the term **_state_** in the first book. You will be deepening your understanding of the concept, and you ability to correctly apply it in this book.

The data store module that you are coding in this chapter will be maintaining all of the state needed for your application.

* All of the user objects
* All of the post objects
* All of the likes of posts that users make
* All of the followers for each user
* All of the messages that users send to each other

It is the Single Responsbility of the data store module to maintain the application state.

All of the other components will be either rendering state as HTML, or telling the data store to modify the state in response to a user filling out a form, or clicking a delete icon, etc.

## Creating the Application State

1. Create a `giffygram/src/scripts/store/index.js` file.
1. Place the following code to create an object representation of the store.
    ```js
    const applicationState = { }
    ```
1. Create a users array in the application state object. Then put a single object representation of a user in the array.
    ```js
    const applicationState = {
        users: [
            {
                id: 1,
                name: "Ray Medrano",
                email: "ray@medrano.com",
                password: "ray"
            }
        ]
    }
    ```

    > **Key term**: The `id` property on an object in a data store is the **primary key** of the object. It is the only guaranteed unique value of each object.
1. Create a posts array in the application state object. Then put a single object representation of a post in the array.
    ```js
    const applicationState = {
        users: [
            {
                id: 1,
                name: "Ray Medrano",
                email: "ray@medrano.com",
                password: "ray"
            }
        ],
        posts: [
            {
                id: 1,
                userId: 1,
                title: "My first post",
                imageURL: "https://media.giphy.com/media/3oz8xyUoD2HlTIcdTW/giphy.gif",
                description: "Jianbing butcher post-ironic brunch marfa, listicle quinoa kickstarter vinyl poke cornhole snackwave yr flexitarian.",
                timestamp: 1608080619498
            }
        ]
    }
    ```

    > **Key Term**: The `userId` property on the post object is a **foreign key**. It matches the primary key of `1` that identifies Ray. In relational data systems, it is how you conect two related things together. In this example, it's your way of saying "The post object #1 belongs to Ray."

## Provide Access to Users State

It is very important to not allow other modules to have _direct_ access to the application state. You want to prevent inadvertant, or even malicious, attempts to corrupt the data, or delete the data. To have that control over access to the state, you are going to write functions that other modules can import and invoke.

### Making Copies

In JavaScript, there is a very concise, but abstract, syntax for creating a copy of an array. If another module wants to work with all of the user objects, you are going to copy the users array and give that copy to the module. Write the following function at the bottom of your data store module.

> #### giffygram/src/scripts/store/index.js

```js
/*
    Function that other modules can use to get a
    copy of the users array
*/
export const getAllUsers = () => {
    // Create a copy of users array
    const usersCopy = [...applicationState.users]

    // Make the copy the output of the function
    return usersCopy
}
```

The `[...originalArrayVariable]` syntax is called a spread operation, and creates a new array, while simultaneously copying all of the items from the original array in to the new one. It's the three dots `...` that are the magic.

The `export` keyword makes the function usable by other modules. If you do not put the `export` keyword before declaring the function, then this module is the only one that can invoke it.

## Practice: Provide Access to Posts State

Now you practice creating and exporting another function that gives other modules a way to import a function that will output a copy of the posts array for them to use.