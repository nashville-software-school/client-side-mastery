

### Making Copies

JavaScript has a powerful mechanism called the _**spread operator**_. It is three dots in a row `...` follow by a variable whose value is an iterable object: Array. You are going to use that to make a copy of your data before it is sent to other parts of the application.


It is important that only specific functions directly change state. By making a copy, we keep our data safe. This will make more sense later. Just remember that making copies of your data === safer.

> #### `src/scripts/store/index.js`

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